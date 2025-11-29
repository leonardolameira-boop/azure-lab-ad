<#
.SYNOPSIS
Exports an Active Directory user report to CSV.

.DESCRIPTION
This script queries Active Directory for enabled user accounts and exports
useful attributes such as:
- DisplayName
- SamAccountName
- UserPrincipalName
- Department
- Title
- Enabled
- LastLogonDate

.PARAMETER OutputPath
Path of the CSV file to create.

.EXAMPLE
.\Get-ADUser-Report.ps1 -OutputPath "C:\Reports\AD-Users.csv"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$OutputPath
)

Import-Module ActiveDirectory

$users = Get-ADUser -Filter * -Properties Department,Title,LastLogonDate,UserPrincipalName,Enabled |
    Select-Object `
        Name,
        SamAccountName,
        UserPrincipalName,
        Department,
        Title,
        Enabled,
        LastLogonDate

$users | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8

Write-Host "User report exported to $OutputPath" -ForegroundColor Green
