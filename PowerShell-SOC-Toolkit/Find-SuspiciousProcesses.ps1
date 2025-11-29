<#
.SYNOPSIS
Finds potentially suspicious processes based on simple heuristics.

.DESCRIPTION
This script uses Get-Process to highlight processes that may deserve
further investigation:
- High CPU time
- High memory usage
- Missing executable path
- Processes running from unusual locations

This is NOT a malware detector, only a triage helper for SOC / Helpdesk.

.PARAMETER MinCPU
Minimum CPU time in seconds to flag a process as suspicious.

.PARAMETER MinMemoryMB
Minimum working set (in MB) to flag a process as suspicious.

.EXAMPLE
.\Find-SuspiciousProcesses.ps1 -MinCPU 200 -MinMemoryMB 200

Lists processes with more than 200 seconds of CPU time OR 200 MB of RAM
considered worth a closer look.
#>

param(
    [int]$MinCPU = 200,
    [int]$MinMemoryMB = 200
)

$processes = Get-Process | Sort-Object CPU -Descending

$results = $processes | ForEach-Object {
    $p = $_
    $path = $null

    try {
        $path = $p.Path
    } catch {
        $path = $null
    }

    [PSCustomObject]@{
        ProcessName = $p.ProcessName
        Id          = $p.Id
        CPU_s       = [math]::Round($p.CPU,1)
        WS_MB       = [math]::Round($p.WorkingSet64 / 1MB,1)
        Path        = $path
        NoPath      = [string]::IsNullOrEmpty($path)
    }
} | Where-Object {
    ($_.CPU_s -ge $MinCPU) -or
    ($_.WS_MB -ge $MinMemoryMB) -or
    ($_.NoPath -eq $true)
}

$results | Format-Table -AutoSize
