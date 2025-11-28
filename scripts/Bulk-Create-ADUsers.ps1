<#
.SYNOPSIS
    Creates multiple Active Directory users from a CSV file.

.DESCRIPTION
    Imports user data from a CSV file and creates one AD user per row.
    The CSV must contain at least the following columns:
    UserName, GivenName, Surname, OU, Password

.PARAMETER CSVPath
    Full or relative path to the CSV file.

.EXAMPLE
    .\Bulk-Create-ADUsers.ps1 -CSVPath ".\EXAMPLES\users-sample.csv"

.NOTES
    Each row is processed individually; failures are written as warnings.
#>

param(
    [string]$CSVPath
)

Import-Module ActiveDirectory

if (-not (Test-Path -Path $CSVPath)) {
    Write-Error "CSV file not found: $CSVPath"
    exit 1
}

$users = Import-Csv -Path $CSVPath

foreach ($user in $users) {
    try {
        New-ADUser `
            -Name "$($user.GivenName) $($user.Surname)" `
            -SamAccountName $user.UserName `
            -GivenName $user.GivenName `
            -Surname $user.Surname `
            -Path $user.OU `
            -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
            -Enabled $true

        Write-Host "User created: $($user.UserName)" -ForegroundColor Green
    }
    catch {
        Write-Warning "Failed to create user: $($user.UserName) - $_"
    }
}
