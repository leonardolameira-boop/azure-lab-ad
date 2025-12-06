#  Threats vs Vulnerabilities vs Risks

Understanding the difference between Threats, Vulnerabilities, and Risks is fundamental in cybersecurity. These concepts appear in interviews, SOC operations, and frameworks like NIST, CIS, and ISO 27001.

---

##  Threat (What can happen)

A threat is any actor, event, or situation that has the potential to cause harm.

### Examples
- Hackers  
- Malware (ransomware, spyware)  
- Phishing campaigns  
- Insider threats  
- Natural disasters  

A threat is the source of potential harm.

---

##  Vulnerability (Weakness)

A vulnerability is a flaw or weakness that a threat can exploit.

### Examples
- Unpatched software  
- Weak or default passwords  
- Open ports  
- Missing MFA  
- Misconfigurations  
- Outdated protocols (SMBv1, TLS 1.0)

A vulnerability is the entry point an attacker can exploit.

---

##  Risk (Threat × Vulnerability × Impact)

Risk is the likelihood and impact of a threat exploiting a vulnerability.

### Formula
Risk = Threat × Vulnerability × Impact

### Examples
**Example 1:**  
- Threat: Hacker  
- Vulnerability: RDP exposed  
- Impact: Full compromise  
→ High Risk

**Example 2:**  
- Threat: Ransomware  
- Vulnerability: No backups  
- Impact: Data loss  
→ Critical Risk

Risk answers: “How bad could it be if this happens?”

---

##  Comparison Table

| Term | Meaning | Example |
|------|---------|---------|
| Threat | Potential cause of harm | Hacker, malware |
| Vulnerability | Weakness enabling exploitation | Weak password |
| Risk | Probability + impact of exploitation | Phishing leading to compromise |

---

##  Interview Explanation

“A threat is something that can cause harm, a vulnerability is the weakness that allows it, and risk is the likelihood and impact of a threat exploiting a vulnerability.”

---

##  Summary

- Threat = potential attacker or harmful event  
- Vulnerability = weakness that can be exploited  
- Risk = likelihood + impact of exploitation

