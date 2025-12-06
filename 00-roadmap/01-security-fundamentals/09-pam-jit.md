# PAM (Privileged Access Management) + JIT (Just-in-Time Access)

> **Short idea:**  
> PAM controls and protects privileged accounts, while JIT provides privileged access only when needed and only for a limited time.

---

## 1. What Is PAM?

**PAM – Privileged Access Management** is the set of tools, policies, and processes that control and protect privileged accounts such as:

- Domain Admins  
- Local Administrators  
- Cloud Administrators  
- Service Accounts  
- Database Admins  
- Network and Security Admins  

Privileged accounts are the most dangerous accounts in an organization because they have the ability to:
- Access sensitive data  
- Change system configurations  
- Disable security controls  
- Take over the domain  

PAM’s goal is to **limit**, **monitor**, and **protect** privileged access.

---

## 2. Why PAM Is Important

Privileged accounts are the #1 target in attacks.

If an attacker steals an admin account, they can:
- Move laterally  
- Escalate privileges  
- Deploy ransomware  
- Exfiltrate data  
- Disable security systems  

PAM reduces these risks by:
- Limiting who is an admin  
- Reducing how long they stay admins  
- Recording and auditing admin actions  
- Requiring approval workflows  
- Applying least privilege to privileged users  

---

## 3. Core Components of PAM

### 1) Credential Vaulting
Stores admin passwords securely so users never see the actual credentials.

### 2) Session Recording
Records admin sessions for audit and incident response.

### 3) Just Enough Administration (JEA)
Gives only the specific commands or permissions required — not full admin rights.

### 4) Just-in-Time Access (JIT)
Grants admin privileges **only when needed**, for **a limited time**, and then removes them.

### 5) Approval Workflows
High-risk actions must be approved by a manager or security.

---

## 4. What Is JIT (Just-in-Time Access)?

**JIT Access** gives users privileged access only:
- For a specific task  
- For a limited time window  
- After the time expires, access is automatically removed  

This prevents permanent admin accounts and reduces the attack surface.

Example:
- Instead of being Domain Admin 24/7  
- You become Domain Admin for 30 minutes  
- After the task, privileges expire  

---

## 5. JIT vs Permanent Privilege

| Permanent Admin | JIT Admin |
|-----------------|-----------|
| Always has privileges | Only has privileges temporarily |
| High-risk | Low-risk |
| Easy to steal | Harder to steal |
| No expiration | Auto-expiring access |
| Privilege creep | Prevents privilege creep |

JIT is one of the strongest security controls in modern enterprise security.

---

## 6. PAM + JIT in Zero Trust

Zero Trust says:
- Never trust by default  
- Continuously verify  
- Assume breach  

PAM + JIT support Zero Trust by:
- Making admin privileges temporary  
- Reducing lateral movement  
- Enforcing least privilege  
- Monitoring privileged actions  
- Removing standing privileges (Zero Standing Privileges – ZSP)  

---

## 7. PAM and JIT in Active Directory (AD)

In AD, PAM can be implemented through:
- Tier model (Tier 0, 1, 2)
- Admin groups separation  
- Dedicated admin accounts  
- Privileged Access Workstations (PAW)  
- Just Enough Administration (JEA)  
- Time-based membership using tools or Azure AD  

---

## 8. PAM + JIT in Azure / Entra ID

Azure has a built-in PAM/JIT system:

### Privileged Identity Management (PIM)
PIM allows:
- Just-in-Time elevation  
- Approval workflows  
- Access expiration  
- Access justification  
- MFA enforcement  
- Notifications and auditing  

Example JIT roles in Azure:
- Global Admin (eligible, not permanent)  
- User Administrator  
- Security Administrator  
- VM Contributor  

Azure PIM is one of the strongest PAM solutions in the cloud.

---

## 9. How to Explain PAM/JIT in an Interview

### Short version:
“PAM protects privileged accounts and JIT ensures that admin privileges are temporary instead of permanent.”

### Strong version:
“PAM controls and monitors privileged accounts to reduce the risk of misuse or compromise. JIT extends this by granting admin privileges only when needed and for a limited time. This eliminates permanent privilege, prevents privilege creep, reduces lateral movement, and directly supports Zero Trust.”

---

## 10. Key Takeaways

- PAM protects privileged accounts  
- JIT eliminates permanent admin privileges  
- Temporary elevation reduces risk  
- Admin sessions can be audited and recorded  
- Core part of Zero Trust and enterprise security  
- Azure PIM is the best example of PAM + JIT  
- Great for interviews in SOC, Cloud, Security Analyst roles  

---
