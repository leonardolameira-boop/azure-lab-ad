<#
.SYNOPSIS
    PowerShell wrapper for Nmap port scanning operations.

.DESCRIPTION
    This script simplifies common Nmap scan types for SOC analysts,
    Helpdesk, Pentesters, and Incident Responders.

    Requires Nmap installed and added to PATH.

    Supported scan modes:
        - Quick scan
        - Top 100 ports
        - Full scan (all 65,535 ports)
        - Stealth SYN scan
        - Service/Version detection
        - OS detection
        - Custom scan

.PARAMETER Target
    IP address, hostname, or CIDR block to scan.

.PARAMETER Mode
    Scan mode. Options:
        quick
        top100
        full
        stealth
        version
        os
        custom

.PARAMETER CustomArgs
    Additional manual arguments when Mode = custom.

.EXAMPLE
    .\Nmap-PortScan.ps1 -Target 10.0.1.4 -Mode quick

.EXAMPLE
    .\Nmap-PortScan.ps1 -Target client01.dunnes.local -Mode version

.EXAMPLE
    .\Nmap-PortScan.ps1 -Target 10.0.1.0/24 -Mode custom -CustomArgs "-sS -sV -p 1-500"

#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Target,

    [Parameter(Mandatory=$true)]
    [ValidateSet("quick","top100","full","stealth","version","os","custom")]
    [string]$Mode,

    [string]$CustomArgs
)

# Ensure Nmap is installed
$nmap = Get-Command "nmap.exe" -ErrorAction SilentlyContinue
if (!$nmap) {
    Write-Host "❌ Nmap is not installed or not in PATH. Install it from: https://nmap.org/download.html" -ForegroundColor Red
    return
}

Write-Host "`n🌐 Running Nmap scan..." -ForegroundColor Cyan
Write-Host "Target: $Target" -ForegroundColor Yellow
Write-Host "Mode:   $Mode`n" -ForegroundColor Yellow

switch ($Mode) {

    "quick" {
        $args = "-T4 -F $Target"
        $modeDesc = "Quick Scan (Fast, top 100 ports)"
    }

    "top100" {
        $args = "--top-ports 100 -T4 $Target"
        $modeDesc = "Top 100 Ports"
    }

    "full" {
        $args = "-p- -T4 $Target"
        $modeDesc = "Full Scan (1-65535)"
    }

    "stealth" {
        $args = "-sS -T4 $Target"
        $modeDesc = "Stealth SYN Scan"
    }

    "version" {
        $args = "-sV -T4 $Target"
        $modeDesc = "Service/Version Detection"
    }

    "os" {
        $args = "-O -T4 $Target"
        $modeDesc = "OS Detection"
    }

    "custom" {
        if (-not $CustomArgs) {
            Write-Host "❌ You must supply -CustomArgs with Mode 'custom'" -ForegroundColor Red
            return
        }
        $args = "$CustomArgs $Target"
        $modeDesc = "Custom Scan"
    }
}

Write-Host "🔎 Scan Type: $modeDesc" -ForegroundColor Green
Write-Host "🛠  Executing: nmap $args" -ForegroundColor Gray
Write-Host "`n-----------------------------------------------`n"

# Run Nmap
Start-Process -NoNewWindow -Wait -FilePath "nmap.exe" -ArgumentList $args

Write-Host "`n-----------------------------------------------"
Write-Host "✔ Scan completed." -ForegroundColor Green
