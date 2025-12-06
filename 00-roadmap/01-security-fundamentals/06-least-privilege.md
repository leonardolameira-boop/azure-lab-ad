# Least Privilege — Principle of Least Privilege (PoLP)

This is my personal summary of the Principle of Least Privilege.  
I wrote it in a simple and practical way so I can understand it quickly and explain it naturally during an interview.

Least Privilege basically means:  
**give users only the minimum access they need — nothing more.**

---

##  Why Least Privilege exists

When someone has more permissions than necessary, a few things can happen:

- They might accidentally break something  
- They might access data they shouldn't  
- Their account becomes more valuable for attackers  
- A compromised account can cause much bigger damage  

So Least Privilege reduces the impact of mistakes and attacks by keeping permissions as small and specific as possible.

---

##  How I understand it (simple version)

> “Only give access to what the person needs to do their job. If they don’t need it, they shouldn’t have it.”

This applies to users, admins, services, scripts, and applications.

---

##  Least Privilege in my AD lab

Applying this principle in my own Active Directory lab helped me understand it clearly:

- Finance users only access Finance folders  
- Marketing users only access Marketing folders  
- Only the correct groups get read/write permissions  
- Normal users are *not* local admins  
- I use separate accounts for admin tasks and daily use  

Seeing this in practice made the concept much easier to understand.

---

##  Why Least Privilege is important for security

- Reduces attack surface  
- Limits damage if a password is stolen  
- Prevents unauthorized access  
- Avoids privilege escalation  
- Helps with auditing and compliance  
- Supports Zero Trust and IAAA models  

Basically: **if a low-privilege account is compromised, the attacker can’t do much.**

---

##  Examples I can use in interviews

- “A Finance employee shouldn’t be able to modify HR files.”  
- “A regular user shouldn’t be a local admin.”  
- “Service accounts should have only the permissions needed for that service.”  
- “Admins should use separate admin and personal accounts.”

---

##  Least Privilege vs. Zero Trust

They work together:

- **Least Privilege** → restricts what a user can do  
- **Zero Trust** → doesn’t trust the user by default  

---

##  Small cheat sheet I use to remember it

```
Need it? → Yes → Give access  
Need it? → No  → Do NOT give access
```

Or even simpler:

```
Minimum required permission — nothing extra.
```

---

This is my personal understanding of Least Privilege — simple, practical, and easy to review.
