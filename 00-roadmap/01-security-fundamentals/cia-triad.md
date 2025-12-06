# CIA Triad (Confidentiality, Integrity, Availability)

The CIA Triad is a foundational model used to guide security decisions in any organization.  
Instead of treating the three pillars as isolated ideas, I mapped them to scenarios that I would likely face in a real SOC or IT environment.

---

## 🔒 Confidentiality  
Ensures that information is accessed only by authorized individuals.

### How I understand it  
Confidentiality is basically **“who should see what”**.  
When I'm working with Active Directory, this directly relates to permissions, group structure, and Least Privilege.

### Examples from real environments
- A Finance share (`Finance$`) accessible **only** to Finance groups (e.g., `GG_FINANCE_RW`).
- Encrypting credentials in transit (Kerberos, TLS).
- MFA to prevent credential theft attacks like phishing or password spraying.

### Common threats
- Phishing  
- Credential stuffing  
- Man-in-the-middle attacks

---

## 🧭 Integrity  
Ensures that data remains accurate, consistent, and unaltered unless changed by someone who is authorized.

### How I understand it  
Integrity is **trusting that the data you're seeing is the right data**.  
In AD or logs, even a small unauthorized modification can break authentication or affect monitoring.

### Examples
- Hashing logs to prevent tampering.
- File integrity monitoring (FIM) for critical systems.
- Version control (Git) to detect unauthorized configuration changes.

### Common threats
- Malware modifying system files  
- Unauthorized changes in GPOs  
- SQL injection altering database entries

---

## ⚙️ Availability  
Ensures that systems, services, and data are accessible when needed.

### How I understand it  
Availability is what keeps the business running.  
In SOC terms, it's about identifying anything that interrupts service — whether malicious (DDoS) or accidental.

### Examples
- Redundant domain controllers (DC1 + backup DC).
- Backups and disaster recovery plans.
- Load balancing and failover systems.

### Common threats
- DDoS attacks  
- Ransomware locking data  
- Hardware failure or misconfiguration

---

## 🧩 How the three work together  
A system is only secure when **all three** pillars are balanced.

Example using my AD lab:
- **Confidentiality:** NTFS permissions + least privilege.  
- **Integrity:** Monitoring changes in OUs, groups, and GPOs.  
- **Availability:** Snapshot recovery + multiple VMs and backups.

If one pillar fails, the others are affected.  
For example, a DDoS attack (Availability) may prevent the SOC from detecting phishing attempts (Confidentiality + Integrity).

---

## 🎙️ How I would explain it in an interview  
**“I use the CIA Triad as a mental model for everything I configure. For example, in my AD lab: confidentiality is enforced with proper group-based access control, integrity is maintained by monitoring changes through Event Viewer and PowerShell logging, and availability is ensured with VM snapshots and backup strategies. Thinking in CIA helps me understand not only how attacks work, but how to design defenses that don't break business operations.”**
