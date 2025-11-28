<#
.SYNOPSIS
    Adds an existing user to an AD security group.

.DESCRIPTION
    Uses Add-ADGroupMember to add the specified user account to the
    specified group. This is used to grant access based on group
    membership instead of applying permissions directly.

.PARAMETER UserName
    sAMAccountName or distinguishedName of the user.

.PARAMETER GroupName
    Name or distinguishedName of the target security group.

.EXAMPLE
    .\Add-User-To-Group.ps1 `
        -UserName "john.smith" `
        -GroupName "GG_MARKETING_RW"
#>

param(
    [string]$UserName,
    [string]$GroupName
)

Import-Module ActiveDirectory

try {
    Add-ADGroupMember -Identity $GroupName -Members $UserName
    Write-Host "User '$UserName' added to group '$GroupName'." -ForegroundColor Green
}
catch {
    Write-Warning "Failed to add '$UserName' to '$GroupName' - $_"
}
