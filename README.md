## 📁 PowerShell Automation Scripts

This repository includes a collection of PowerShell scripts created for my Azure-based Active Directory home lab.  
These scripts replicate real enterprise tasks such as user onboarding, OU creation, GPO automation, monitoring, and initial SOC triage.

Below is a short description of the automation scripts included:

### 🔧 Administrative & AD Automation
- **Create-ADUser.ps1** — Creates a single AD user with defined attributes.
- **Bulk-Create-ADUsers.ps1** — Imports a CSV and creates multiple AD users.
- **Add-User-To-Group.ps1** — Adds one or more users to AD security groups.
- **Create-Department-OUs.ps1** — Builds a full OU structure by department.
- **Create-Department-FoldersAndPermissions.ps1** — Creates department folders with NTFS RW/Read permissions.

### 🛡️ SOC / Security Triage Scripts
- **Find-SuspiciousProcesses.ps1** — Highlights processes with high CPU/RAM or missing executable paths.
- **Get-ADUser-Report.ps1** — Generates a full CSV report of AD users.
- **Get-TopCPUProcess.ps1** — Shows the top CPU-consuming processes.
- **Export-EventLogs.ps1** — Exports Security/System/Application logs for analysis.
- **Detect-LockedOutUsers.ps1** — Lists and timestamps recently locked-out accounts.

