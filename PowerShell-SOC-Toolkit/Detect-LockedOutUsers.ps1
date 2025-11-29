<#
.SYNOPSIS
    Identifies locked-out Active Directory user accounts.

.DESCRIPTION
    This script queries the domain for accounts currently locked out.
    It returns:
      - Username
      - Display Name
      - Distinguished Name (DN)
      - When the lockout occurred
      - Lockout source (if detectable)
      - Number of failed logons (badPwdCount)

    Useful for SOC, Helpdesk, and Incident Response investigations.

.NOTES
    Requires the ActiveDirectory PowerShell module.

.EXAMPLE
    .\Detect-LockedOutUsers.ps1

    Lists all currently locked-out users in the domain.

.EXAMPLE
    .\Detect-LockedOutUsers.ps1 -Verbose

#>

[CmdletBinding()]
param()

Import-Module ActiveDirectory -ErrorAction Stop

Write-Verbose "Querying Active Directory for locked-out users..."

# Get all locked-out accounts
$lockedUsers = Search-ADAccount -LockedOut -UsersOnly -ErrorAction SilentlyContinue

if (!$lockedUsers) {
    Write-Host "`n✔ No locked-out users found in the domain." -ForegroundColor Green
    return
}

$result = foreach ($user in $lockedUsers) {

    # Retrieve lockout details
    $userProps = Get-ADUser $user.SamAccountName -Properties `
        DisplayName, LockedOut, lastLogonDate, badPwdCount, lockoutTime

    # Attempt to find the lockout source
    try {
        $audit = Get-EventLog -LogName Security -InstanceId 4740 -Newest 2000 -ErrorAction Stop |
                 Where-Object { $_.ReplacementStrings[0] -eq $userProps.SamAccountName } |
                 Select-Object -First 1

        if ($audit) {
            $lockoutSource = $audit.ReplacementStrings[1]
        }
        else {
            $lockoutSource = "Unknown"
        }
    }
    catch {
        $lockoutSource = "Not Available"
    }

    # Convert lockout time from AD format (if exists)
    $lockoutDate = if ($userProps.lockoutTime -gt 0) {
        [DateTime]::FromFileTime($userProps.lockoutTime)
    }
    else {
        $null
    }

    [PSCustomObject]@{
        UserName      = $userProps.SamAccountName
        DisplayName   = $userProps.DisplayName
        LockedOut     = $userProps.LockedOut
        LockoutTime   = $lockoutDate
        BadPwdCount   = $userProps.badPwdCount
        LockoutSource = $lockoutSource
        DistinguishedName = $userProps.DistinguishedName
    }
}

Write-Host "`n🚨 Locked-out accounts detected:`n" -ForegroundColor Yellow

$result | Format-Table -AutoSize
