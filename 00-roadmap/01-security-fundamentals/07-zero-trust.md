# Zero Trust

> **Short idea:**  
> **Zero Trust = Never trust, always verify.**  
> No device, user, network, or application is trusted by default — even if already inside the organization.

---

## 1. What Is Zero Trust?

**Zero Trust** is a modern security model based on the principle that:

- No one is trusted automatically  
- Access must be continuously verified  
- Every request is treated as if it comes from an untrusted network  

It replaces the old mindset of *“inside = trusted, outside = untrusted.”*

Zero Trust assumes breaches **will** happen, so systems are designed to reduce impact.

---

## 2. Core Principles of Zero Trust

### 📌 1. **Verify Explicitly**
Authenticate and authorize every access request using:
- MFA  
- Device health  
- IP and location checks  
- User role  
- Risk level  

Nothing is assumed to be safe.

---

###  2. **Least Privilege Access**
Give users **only the minimum permissions** required to perform their job.

- Reduces blast radius  
- Limits damage if accounts are compromised  

This often uses:
- Role-Based Access Control (RBAC)  
- Permission reviews  
- Privileged Access Management (PAM)

---

###  3. **Assume Breach**
Act as if attackers are already in the network.

This means:
- Micro-segmentation  
- Logging and monitoring everywhere  
- Strong alerts  
- Restricting internal lateral movement  
- Encryption in transit & at rest  

Zero Trust is about **limiting damage**, not pretending breaches won’t happen.

---

## 3. Zero Trust Architecture (ZTA)

A Zero Trust environment typically includes:

- Strong identity and access controls  
- Device compliance checks  
- Network segmentation  
- Authentication for every request  
- Continuous monitoring  
- Conditional access policies  
- Encryption and integrity validation  
- Least privilege applied everywhere  

ZTA is a **framework**, not a single tool.

---

## 4. Zero Trust vs. Traditional Security Model

| Traditional Model         | Zero Trust Model                    |
|---------------------------|-------------------------------------|
| “Trust but verify”        | “Never trust, always verify”         |
| Trusts internal network   | Internal network is **not trusted** |
| Strong perimeter firewall | Identity-based controls             |
| Hard to stop lateral movement | Micro-segmentation prevents spread |
| Access is granted once    | Access is continuously evaluated    |

Zero Trust protects against modern threats that bypass perimeter defenses.

---

## 5. Why Zero Trust Is Important

- Most attacks today come from **stolen credentials** or **internal movement**  
- Cloud environments don’t have clear perimeters  
- Users access resources from multiple devices and locations  
- Hybrid work makes IP-based trust impossible  
- Ransomware spreads easily in flat networks  

Zero Trust reduces exposure and impact.

---

## 6. Zero Trust in Practice (Examples)

### Example 1 — Logging into a system
A Zero Trust system checks:
- Username + password  
- MFA  
- Device compliance  
- IP location  
- Past behavior (risk score)  

If anything looks suspicious, access is blocked.

---

### Example 2 — Lateral Movement Defense
An attacker compromises one machine.  
With Zero Trust:
- They cannot automatically access internal resources  
- Micro-segmentation blocks movement  
- Privileged accounts have no standing access  
- Alerts are triggered immediately  

---

### Example 3 — File Server Access
Instead of giving full folder access, Zero Trust requires:
- Just-in-Time (JIT) access  
- Role-based privileges  
- Logging every access  
- Verification of device security  

---

## 7. Zero Trust and Other Concepts

###  **Least Privilege**
Zero Trust *requires* least privilege access.  
They always work together.

###  **PAM (Privileged Access Management)**
Controls privileged accounts so attackers can’t use admin credentials freely.

###  **JIT Access**
Admins get permissions **only for a short time** when needed.

###  **Defense in Depth**
Zero Trust adds layers of protection across identities, endpoints, networks, and applications.

---

## 8. Zero Trust in Interviews (How to Explain It)

### Short version:
> *“Zero Trust means never trust anything by default. Every request must be authenticated, authorized, and continuously evaluated — regardless of network location.”*

### Full version:
> “Zero Trust is a security model where no user, device, or network is trusted automatically.  
> Every access request must be verified using identity, device health, and context.  
> It applies least privilege and assumes breach, using segmentation, monitoring, and continuous authentication to reduce risk.  
> It helps stop lateral movement and protects against credential-based attacks.”

---

## 9. Key Takeaways

- Zero Trust is **not a tool**, it is a **security philosophy**  
- The three pillars: **verify**, **least privilege**, **assume breach**  
- It protects against internal and external threats  
- It limits the spread of attacks  
- Works hand-in-hand with MFA, PAM, JIT, and micro-segmentation  
- Ideal for cloud, hybrid, and modern enterprise environments  

---
