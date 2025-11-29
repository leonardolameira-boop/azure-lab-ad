<#
.SYNOPSIS
Shows the top N processes by CPU usage.

.DESCRIPTION
Uses Get-Process and sorts by CPU time to quickly identify the most
expensive processes on the system.

.PARAMETER Top
Number of processes to display.

.EXAMPLE
.\Get-TopCPUProcess.ps1 -Top 10
#>

param(
    [int]$Top = 10
)

Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First $Top `
        ProcessName,
        Id,
        @{Name='CPU_s';Expression={[math]::Round($_.CPU,1)}},
        @{Name='WS_MB';Expression={[math]::Round($_.WorkingSet64/1MB,1)}} |
    Format-Table -AutoSize
