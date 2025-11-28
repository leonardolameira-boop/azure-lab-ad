<#
.SYNOPSIS
    Creates department folders and applies NTFS permissions.

.DESCRIPTION
    For each department, this script:
        - Creates a folder under the specified BasePath
        - Removes default inheritance and Everyone
        - Grants:
            <DEPT>_RW   -> Modify
            <DEPT>_READ -> Read

.PARAMETER BasePath
    Base path where department folders will be created.
    Example: "C:\Departments"

.PARAMETER Departments
    Array of department names (e.g. "FINANCE","MARKETING","HR").

.PARAMETER DomainNetbios
    NetBIOS name of the domain (e.g. "DUNNES").

.EXAMPLE
    .\Create-Department-FoldersAndPermissions.ps1 `
        -BasePath "C:\Departments" `
        -Departments @("FINANCE","MARKETING","HR") `
        -DomainNetbios "DUNNES"
#>

param(
    [string]$BasePath,
    [string[]]$Departments,
    [string]$DomainNetbios
)

# Ensure base path exists
if (-not (Test-Path -Path $BasePath)) {
    New-Item -Path $BasePath -ItemType Directory | Out-Null
}

foreach ($dept in $Departments) {

    $folderPath = Join-Path $BasePath $dept

    if (-not (Test-Path -Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
        Write-Host "Folder created: $folderPath" -ForegroundColor Cyan
    }

    # Expected AD groups
    $groupRead = "$DomainNetbios\${dept}_READ"
    $groupRW   = "$DomainNetbios\${dept}_RW"

    Write-Host "Applying NTFS permissions on: $folderPath" -ForegroundColor Yellow

    # Disable inheritance and keep existing explicit permissions
    icacls $folderPath /inheritance:d | Out-Null

    # Remove Everyone (if present)
    icacls $folderPath /remove:g "Everyone" 2>$null | Out-Null

    # Grant permissions
    icacls $folderPath /grant "${groupRW}:(OI)(CI)M" | Out-Null
    icacls $folderPath /grant "${groupRead}:(OI)(CI)R" | Out-Null

    Write-Host "Permissions applied for $dept (RW: $groupRW / R: $groupRead)." -ForegroundColor Green
}
