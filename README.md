# Active Directory Automation Scripts

This documentation describes a set of PowerShell scripts used to automate common Active Directory (AD DS) tasks in an enterprise-like lab environment.  
The scripts were created and tested in a Windows Server 2022 environment with the Active Directory Domain Services (AD DS) role installed.

**Domain (Fictional):** DUNNES.local  
**Domain Controller:** DC1  

The goal of this project is to simulate real-world IT operations including:

- User onboarding  
- Group management  
- OU design  
- File server permissions  
- Departmental access modeling  

---

## 📌 Scripts Included

This lab currently includes five automation scripts:

### **1. Create-ADUser.ps1**  
Creates a single Active Directory user manually by defining parameters.

### **2. Bulk-Create-ADUsers.ps1**  
Creates multiple AD users from a CSV file. Useful for onboarding large groups of employees.

### **3. Add-User-To-Group.ps1**  
Adds an existing user to a security group.

### **4. Create-Department-OUs.ps1**  
Builds a standardized OU structure per department.

### **5. Create-Department-FoldersAndPermissions.ps1**  
Creates department folders and applies NTFS permissions.

---
## 🗺️ Network & AD Topology (Home Lab Overview)

```text
                                ┌─────────────────────────────────────┐
                                │            Azure Cloud              │
                                │         VNet: 10.0.0.0/16           │
                                └─────────────────────────────────────┘
                                                │
        ┌────────────────────────────────────────────────────────────────────────────┐
        │                             Virtual Network                                │
        └────────────────────────────────────────────────────────────────────────────┘
                                                │
                                ┌──────────────────────────────────┐
                                │ Subnet-LAB (10.0.1.0/24)         │
                                │                                  │
                                │  • DC1        (10.0.1.4)         │
                                │     Windows Server 2022          │
                                │     AD DS / DNS / File Services  │
                                │                                  │
                                │  • Client01   (10.0.1.5)         │
                                │     Windows 10/11                │
                                │     Domain-joined                │
                                │                                  │
                                │  • SOC-SRV01  (10.0.1.6)         │
                                │     Ubuntu Server                │
                                │     Nmap / tcpdump / Wireshark   │
                                └──────────────────────────────────┘


                             ┌─────────────────────────────────────┐
                             │         Active Directory            │
                             │             DUNNES.local            │
                             └─────────────────────────────────────┘
                                           │
                                           │
                         ┌──────────────────────────────────────────────┐
                         │              Organizational Units            │
                         └──────────────────────────────────────────────┘
                                           │
     ┌──────────────────────────┬──────────────────────────┬──────────────────────────┐
     │ OU=FINANCE              │ OU=MARKETING             │ OU=HR                    │
     │  - USERS                │  - USERS                 │  - USERS                 │
     │  - COMPUTERS            │  - COMPUTERS             │  - COMPUTERS             │
     │  - GROUPS               │  - GROUPS                │  - GROUPS                │
     │  • FINANCE_READ         │  • MARKETING_READ        │  • HR_READ               │
     │  • FINANCE_RW           │  • MARKETING_RW          │  • HR_RW                 │
     └──────────────────────────┴──────────────────────────┴──────────────────────────┘


                           ┌────────────────────────────────────────────┐
                           │        File Server (DC1 in this lab)       │
                           └────────────────────────────────────────────┘
                                           │
     ┌─────────────────────────────────────┼────────────────────────────────────────┐
     │                                     │                                        │
┌───────────────┐                    ┌───────────────┐                    ┌───────────────┐
│  FINANCE$     │                    │ MARKETING$    │                    │ HR$           │
│ NTFS:         │                    │ NTFS:         │                    │ NTFS:         │
│ • FINANCE_RW  │                    │ • MARKETING_RW│                    │ • HR_RW       │
│ • FINANCE_READ│                    │ • MARKETING_READ│                  │ • HR_READ     │
└───────────────┘                    └───────────────┘                    └───────────────┘

                          

```

---
## 📌 Requirements

Before running any script:

- Windows Server with AD DS installed  
- PowerShell 5.1+  
- ActiveDirectory module  

Load the module:

```powershell
Import-Module ActiveDirectory
```

---

# ▶️ How to Run

---

## ### **1. Create-ADUser.ps1**

**Purpose:**  
Creates a single user by manually passing parameters.

**Parameters:**  
- `-UserName` SamAccountName of the user  
- `-GivenName` First name  
- `-Surname` Last name  
- `-OU` Target OU DN  
- `-Password` Initial password  

**Use cases:**  
- Creating test accounts  
- Provisioning a specific user in an OU  

**Example usage:**

```powershell
.\Create-ADUser.ps1 `
    -UserName "john.smith" `
    -GivenName "John" `
    -Surname "Smith" `
    -OU "OU=MARKETING,OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL" `
    -Password "P@ssword123"
```

---

## ### **2. Bulk-Create-ADUsers.ps1**

**Purpose:**  
Creates multiple AD user accounts from a CSV file.

**Parameters:**  
- `-CSVPath` Path to the CSV file  

**Use cases:**  
- Mass onboarding simulation  
- Populating a lab with realistic users  

**CSV example:**

```csv
UserName,GivenName,Surname,OU,Password
john.smith,John,Smith,"OU=MARKETING,OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL",P@ssword123
ana.silva,Ana,Silva,"OU=FINANCE,OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL",P@ssword123
```

**Execution:**

```powershell
.\Bulk-Create-ADUsers.ps1 -CSVPath ".\users-sample.csv"
```

---

## ### **3. Add-User-To-Group.ps1**

**Purpose:**  
Adds an existing user to an AD security group.

**Parameters:**  
- `-UserName` User’s SamAccountName  
- `-GroupName` Security group name  

**Use cases:**  
- Assigning department permissions  
- Granting access to file shares  
- Adjusting security during tests  

**Example usage:**

```powershell
.\Add-User-To-Group.ps1 `
    -UserName "john.smith" `
    -GroupName "GG_MARKETING_RW"
```

---

## ### **4. Create-Department-OUs.ps1**

**Purpose:**  
Automatically creates a full OU structure per department.

**Parameters:**  
- `-RootOU` Base DN where all department OUs will be created  
- `-Departments` Array of department names  

**Use cases:**  
- Standardizing departmental structure in AD DS  
- Automating OU creation for new departments  
- Creating an enterprise-style environment  
- Ensuring consistent layout for Users, Computers, and Groups  

**Generated structure:**

```text
OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL
    OU=FINANCE
        OU=USERS
        OU=COMPUTERS
        OU=GROUPS
    OU=MARKETING
        OU=USERS
        OU=COMPUTERS
        OU=GROUPS
    OU=HR
        OU=USERS
        OU=COMPUTERS
        OU=GROUPS
```

**Security groups created automatically:**

```text
<DEPT>_READ
<DEPT>_RW
```

(Examples: FINANCE_READ, FINANCE_RW, MARKETING_READ, HR_RW)

**Example usage:**

```powershell
.\Create-Department-OUs.ps1 `
    -RootOU "OU=DEPARTMENTS,OU=DUNNES,DC=DUNNES,DC=LOCAL" `
    -Departments @("FINANCE","MARKETING","HR")
```

---

## ### **5. Create-Department-FoldersAndPermissions.ps1**

**Purpose:**  
Creates departmental file share folders and applies NTFS permissions based on security groups.

**Parameters:**  
- `-BasePath` Local path where folders will be created (e.g., `C:\Shares`)  
- `-Departments` Array of department names  
- `-DomainName` Domain NetBIOS name (e.g., `DUNNES`)  

**Use cases:**  
- Automating file share creation  
- Standardizing NTFS permissions  
- Preparing folders for drive-mapping GPOs  
- Enforcing least-privilege access  

**Folder structure created:**

```text
C:\Shares
    FINANCE
    MARKETING
    HR
```

**NTFS permissions applied:**

```text
<DEPT>_READ → Read / List
<DEPT>_RW  → Modify / Write
```

**Security groups expected:**

```text
FINANCE_READ       FINANCE_RW
MARKETING_READ     MARKETING_RW
HR_READ            HR_RW
```

**Example usage:**

```powershell
.\Create-Department-FoldersAndPermissions.ps1 `
    -BasePath "C:\Shares" `
    -Departments @("FINANCE","MARKETING","HR") `
    -DomainName "DUNNES"
```

---

# 📘 End of Documentation

This repository is intended for learning, lab simulations, and interview demonstrations.  
These scripts help model real enterprise workflows involving AD DS automation and permissions management.

# 📁 SharePoint Placement (Optional)

In a real documentation workflow, this content can be stored inside a SharePoint structure such as:

**Site:** Home Lab – AD Automation  
**Sections:**  
- Documentation (README)  
- PowerShell Scripts  
- Sample CSV Files  
- OU & Group Structure Diagrams  
- Troubleshooting Notes  

This mirrors how enterprise IT teams store internal automation and AD DS documentation.

---

# 🎯 How This Is Used in My Lab

This automation is part of a complete **Active Directory + Security Home Lab**, where I practice:

- Designing enterprise-like OU and group structures  
- Automating user onboarding with PowerShell and CSV  
- Building repeatable templates for departments and shares  
- Applying NTFS permissions using least privilege principles  
- Documenting infrastructure professionally (GitHub + SharePoint)  
- Preparing for IT Support / SysAdmin / SOC interviews  

This project demonstrates real-world IT administration workflows and showcases scripting, documentation, and AD DS skills.

---

# 👤 Author

**Leonardo Lameira**  
Active Directory • Azure • Security Lab Documentation  
Dublin, Ireland  
