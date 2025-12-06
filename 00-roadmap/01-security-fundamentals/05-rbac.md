# RBAC (Role-Based Access Control)

> **Short idea:**  
> RBAC is a security model where permissions are assigned to roles, and users receive access by being added to those roles instead of receiving permissions directly.

---

## 1. What Is RBAC?

RBAC (Role-Based Access Control) is a method of managing access where:
- Permissions are assigned to roles
- Users are assigned to roles
- Users inherit the permissions of those roles

This avoids giving permissions directly to individuals and keeps access clean, consistent, and aligned with least privilege.

---

## 2. Why RBAC Is Important

RBAC solves major security problems:
- Manual permissions become chaotic over time
- Hard to audit who has access
- Users accumulate unnecessary privileges (privilege creep)
- Offboarding/onboarding becomes risky
- Permissions become inconsistent
- Higher chance of misconfiguration

RBAC makes access organized, traceable, and secure.

---

## 3. Core Components of RBAC

### 1) Users
People who need access.

### 2) Roles
A group of permissions that represent a job function.

Examples:
- Finance-ReadWrite
- HR-ReadOnly
- Server-Admin
- Helpdesk-PasswordReset

### 3) Permissions
Actions allowed for a role:
- Read or write files
- Reset passwords
- Access applications
- Manage servers
- View logs

### RBAC Structure (Concept)
Users → Roles → Permissions  
Users never receive permissions directly — only through roles.

---

## 4. RBAC and Least Privilege

RBAC enforces least privilege by:
- Giving only required access
- Reducing unnecessary permissions
- Preventing privilege escalation
- Making access predictable and auditable

Examples:
- Finance cannot view HR files
- Helpdesk cannot modify Domain Admin accounts
- Developers cannot access production databases

---

## 5. RBAC in Active Directory (AD)

AD implements RBAC using Security Groups.

Example:

Role: GG_Finance_RW  
- Permissions: Read/Write access to finance data  
- Users: Finance team  

Role: GG_HR_ReadOnly  
- Permissions: Read-only access to HR documents  
- Users: HR team  

Security groups make access centralized and easy to audit.

---

## 6. RBAC in Azure / Entra ID

Azure uses RBAC across all cloud resources.

Examples of Azure roles:
- Reader (view only)
- Contributor (modify, but cannot delete)
- Owner (full control)
- User Administrator (manage identities)
- Security Administrator (manage security settings)

You assign roles to:
- Users
- Groups
- Service principals
- Managed identities

RBAC in Azure is critical for Zero Trust and cloud governance.

---

## 7. RBAC in Other Systems

RBAC is used everywhere:
- Linux (groups, sudo rules)
- SQL databases
- Kubernetes (Roles and RoleBindings)
- Docker platforms
- AWS IAM / Google IAM
- SaaS applications
- Firewalls and security tools

It is the standard for modern access control.

---

## 8. RBAC vs ACL (Access Control Lists)

ACL = permissions to users  
RBAC = permissions to roles  

Key differences:

ACL (User-Based)
- Hard to scale
- High chance of errors
- Privilege creep common
- Difficult audits

RBAC (Role-Based)
- Easy to scale
- Standardized access
- Least privilege enforced
- Easy to audit

---

## 9. RBAC in Zero Trust

Zero Trust requires:
- Identity-based access
- Continuous verification
- Least privilege
- Segmentation

RBAC helps Zero Trust by:
- Giving users only what they need
- Reducing lateral movement
- Preventing unnecessary access
- Making permissions predictable and trackable

RBAC + MFA + Conditional Access = strong Zero Trust identity security.

---

## 10. How to Explain RBAC in an Interview

Short version:
"RBAC assigns permissions to roles, and users inherit permissions by being placed into those roles. This keeps access consistent, scalable, and aligned with least privilege."

Full version:
"RBAC—Role-Based Access Control—assigns permissions to roles that represent job functions. Users are added to roles and automatically inherit only the permissions they need. This prevents permission creep, simplifies audits, enforces least privilege, and is widely used across AD, Azure, AWS, Kubernetes, databases, and enterprise applications."

---

## 11. Key Takeaways

- RBAC assigns permissions to roles, not users
- Users inherit access through roles
- Prevents privilege creep
- Enforces least privilege
- Simplifies access management
- Essential for Zero Trust
- Works in AD, Azure, AWS, Linux, SQL, Kubernetes, and SaaS

---
