<#
.SYNOPSIS
    Creates a single Active Directory user.

.DESCRIPTION
    This script creates a new user in Active Directory using the
    provided parameters (username, names, OU and password).

.PARAMETER UserName
    The sAMAccountName of the new user.

.PARAMETER GivenName
    The user's first name.

.PARAMETER Surname
    The user's last name.

.PARAMETER OU
    DistinguishedName of the target OU where the user will be created.
    Example:
    "OU=MARKETING,OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL"

.PARAMETER Password
    Initial account password in plain text.

.EXAMPLE
    .\Create-ADUser.ps1 `
        -UserName "john.smith" `
        -GivenName "John" `
        -Surname "Smith" `
        -OU "OU=MARKETING,OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL" `
        -Password "P@ssword123"

.NOTES
    Requires the ActiveDirectory module and Domain Admin (or delegated) permissions.
#>

param(
    [string]$UserName,
    [string]$GivenName,
    [string]$Surname,
    [string]$OU,
    [string]$Password
)

Import-Module ActiveDirectory

New-ADUser `
    -Name "$GivenName $Surname" `
    -SamAccountName $UserName `
    -GivenName $GivenName `
    -Surname $Surname `
    -Path $OU `
    -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
    -Enabled $true
