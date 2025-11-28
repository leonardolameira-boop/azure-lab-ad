<#
.SYNOPSIS
    Creates a standardized OU structure per department.

.DESCRIPTION
    For each department, this script creates:
        OU=<DEPT>,<RootOU>
            OU=USERS
            OU=COMPUTERS
            OU=GROUPS
        And under OU=GROUPS it creates:
            <DEPT>_READ
            <DEPT>_RW

.PARAMETER RootOU
    The distinguishedName where the department OUs will be created.
    Example: "OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL"

.PARAMETER Departments
    Array of department names (e.g. "FINANCE","MARKETING","HR").

.EXAMPLE
    .\Create-Department-OUs.ps1 `
        -RootOU "OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL" `
        -Departments @("FINANCE","MARKETING","HR")
#>

param(
    [string]$RootOU,
    [string[]]$Departments
)

Import-Module ActiveDirectory

foreach ($dept in $Departments) {

    Write-Host "Creating OU structure for department: $dept" -ForegroundColor Cyan

    # Department OU path
    $deptOUPath = "OU=$dept,$RootOU"

    # Create department OU if it does not exist
    if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$dept)" -SearchBase $RootOU -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $dept -Path $RootOU -ProtectedFromAccidentalDeletion $false
    }

    # Child OUs: USERS, COMPUTERS, GROUPS
    $childOUs = @("USERS","COMPUTERS","GROUPS")
    foreach ($child in $childOUs) {
        $childPath = "OU=$child,$deptOUPath"

        if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$child)" -SearchBase $deptOUPath -ErrorAction SilentlyContinue)) {
            New-ADOrganizationalUnit -Name $child -Path $deptOUPath -ProtectedFromAccidentalDeletion $false
        }
    }

    # Security groups under OU=GROUPS
    $groupsOUPath = "OU=GROUPS,$deptOUPath"

    $groups = @(
        "${dept}_READ",
        "${dept}_RW"
    )

    foreach ($group in $groups) {
        if (-not (Get-ADGroup -Filter "Name -eq '$group'" -SearchBase $groupsOUPath -ErrorAction SilentlyContinue)) {
            New-ADGroup `
                -Name $group `
                -GroupScope Global `
                -GroupCategory Security `
                -Path $groupsOUPath `
                -Description "Access group $group for department $dept"
        }
    }

    Write-Host "OU structure and groups created for $dept." -ForegroundColor Green
}
