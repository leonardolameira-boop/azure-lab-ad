<#
.SYNOPSIS
Exports Windows Event Logs to CSV for further analysis.

.DESCRIPTION
Uses Get-WinEvent to retrieve events from a given log name and optional
time range, then exports them to CSV.

.PARAMETER LogName
Name of the Windows log (e.g. Security, System, Application).

.PARAMETER OutputPath
CSV file path for the exported events.

.PARAMETER Hours
How many past hours to include (default: 24).

.EXAMPLE
.\Export-EventLogs.ps1 -LogName Security -Hours 12 -OutputPath "C:\Logs\Security.csv"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$LogName,

    [Parameter(Mandatory = $true)]
    [string]$OutputPath,

    [int]$Hours = 24
)

$startTime = (Get-Date).AddHours(-$Hours)

$filter = @{
    LogName   = $LogName
