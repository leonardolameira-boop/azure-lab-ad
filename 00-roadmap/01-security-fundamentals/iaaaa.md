# IAAA — Identification, Authentication, Authorization, Accounting

This is my personal summary of the IAAA model.  
I wrote it in a simple way so I can quickly review it and easily explain it during an interview.  
Nothing too academic — just what actually makes sense to me.

---

## 1) Identification – *Who I say I am*

This is the moment when a user **introduces themselves** to a system.

Common examples:
- Typing a username  
- Entering an email  
- Scanning a badge  
- Sending a client ID or token  

At this stage, the system hasn’t verified anything yet — it’s just an identity **claim**.

---

## 2) Authentication – *Prove it*

After identifying myself, I need to **prove** that I am really that person.

Typical ways to authenticate:
- Password  
- PIN  
- Fingerprint  
- Face ID  
- Authenticator app / SMS code (MFA)

Once authentication is successful, the system basically says:  
> “Ok, I believe you are who you claim to be.”

In my AD lab, this happens when I log in with `leonardo.admin` and my password.

---

## 3) Authorization – *What I’m allowed to do*

After I’m authenticated, the system checks **what I’m allowed to access**.

Examples that make it easy to understand:
- A standard user cannot edit GPOs  
- Finance team members only access the Finance shared folder  
- A Tier 1 SOC analyst can view dashboards but not change configurations  
- In my AD lab, permissions come from groups like `GG_FINANCE_RW` or `GG_MARKETING_RW`

In short:
- **Authentication = entering the system**  
- **Authorization = what I can do once I’m inside**

---

## 4) Accounting – *Tracking what was done*

This is the logging part.  
The system records the user's actions for auditing, monitoring, and security purposes. Accounting is also a deterrent control, because when users know their actions are being logged and monitored, they are less likely to attempt malicious behavior. The visibility itself discourages misuse.

Examples:
- Windows Event Logs (like 4624 for successful logon)  
- Logs sent to a SIEM (Sentinel, Splunk, etc.)  
- File access history  
- Admin commands recorded for auditing  

In my lab, whenever I log into DC1, that action appears in the logs — and when I send them to the SIEM, I can actually see who did what.

---

## How I would explain IAAA in a job interview (simple version)

> “IAAA stands for Identification, Authentication, Authorization, and Accounting.  
> First the user says who they are, then they prove it, the system decides what they can access, and finally everything is logged.  
> I apply this model in my Active Directory lab through group-based permissions and by monitoring events in Windows Logs and my SIEM.”

---

## Why IAAA matters to me

- Helps me understand how access control works in AD  
- Makes permission management easier  
- Supports concepts like Least Privilege and Zero Trust  
- Important for SOC/Blue Team work  
- Helps when investigating logs and security events  

---

## Small cheat sheet I use to remember it

Identification  →  Who I am  
Authentication  →  Prove it  
Authorization   →  What I can do  
Accounting      →  What I did  

---

This is my personal understanding of the IAAA model — simple, practical, and easy to review.
