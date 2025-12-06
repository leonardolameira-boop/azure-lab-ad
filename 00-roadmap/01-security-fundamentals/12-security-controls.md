#  Security Controls (Preventive, Detective, Corrective, Deterrent)

Security controls are mechanisms used to protect systems, data, and networks from threats.  
They are typically categorized into **Preventive**, **Detective**, **Corrective**, and **Deterrent** controls.  
These appear frequently in interviews and in frameworks like NIST, CIS Controls, and ISO 27001.

---

##  1. Preventive Controls
Preventive controls are designed to **stop an attack before it happens**.

### Examples
- MFA (Multi-Factor Authentication)  
- Firewalls  
- Encryption  
- Network segmentation  
- Least Privilege  
- Account lockout policies  
- Secure configurations (hardening)  
- Input validation (prevents SQL injection)

 Goal: Reduce the likelihood of a successful attack.

---

##  2. Detective Controls
Detective controls **identify or alert** when malicious activity occurs.

### Examples
- SIEM (Security Information and Event Management)  
- IDS/IPS alerts  
- Log monitoring  
- File integrity monitoring  
- Security audits  
- Honeypots / honeytokens  
- Detection rules and analytics

 Goal: Detect attacks as early as possible.

---

## 🔧 3. Corrective Controls
Corrective controls **resolve issues**, restore systems, and reduce the impact of security incidents.

### Examples
- Backups and restoration  
- Patching vulnerabilities  
- Removing malware  
- Resetting compromised accounts  
- Incident response procedures  
- Disaster recovery plans

 Goal: Restore normal operations after an incident.

---

##  4. Deterrent Controls
Deterrent controls **discourage or dissuade attackers** from attempting an attack.  
They do not prevent or detect directly, but they reduce the likelihood of someone even trying.

### Examples
- Security warning banners (“Authorized personnel only”)  
- CCTV cameras  
- Visible guards or security personnel  
- Policy statements  
- Legal disclaimers  
- Fines or penalties  
- Tamper-proof seals  

 Goal: Make the attacker think twice before acting.

---

##  Quick Comparison Table

| Control Type | Purpose | Examples |
|--------------|---------|----------|
| **Preventive** | Stop attacks before they happen | MFA, firewalls, hardening |
| **Detective** | Identify incidents when they occur | SIEM, logs, IDS |
| **Corrective** | Recover and fix after an attack | Backups, patching, IR |
| **Deterrent** | Discourage attackers from attempting | CCTV, banners, policies |

---

##  Interview-Ready Explanation

“Security controls are divided into preventive, detective, corrective, and deterrent controls.  
Preventive controls stop attacks (like MFA and firewalls).  
Detective controls identify them (like SIEM and logs).  
Corrective controls restore operations (like backups and patching).  
Deterrent controls discourage attackers from even trying (like CCTV or warning banners).  
Understanding these helps design a complete security posture.”

---

##  Summary

- **Preventive →** Stop attacks  
- **Detective →** Detect attacks  
- **Corrective →** Recover from attacks  
- **Deterrent →** Discourage attackers before they act  
