# Risks (Risk Management & Risk Assessment)

> **Short idea:**  
> Risk Management is the **overall process** of identifying, analyzing, prioritizing, and treating risks.  
> Risk Assessment is the **step inside Risk Management** where we evaluate threats, vulnerabilities, likelihood, and impact.

---

## 1. What Is a Risk in Cybersecurity?

A **risk** is the possibility of harm or loss when a **threat** exploits a **vulnerability** in an **asset**.

Simple representation:

`Risk = Threat × Vulnerability × Impact`

If one of these factors increases, the overall risk also increases.

---

## 2. Risk Management (The Full Process)

**Risk Management** is the ongoing, strategic process of:

1. Identifying risks  
2. Assessing risks (Risk Assessment)  
3. Prioritizing risks  
4. Selecting and applying mitigation controls  
5. Monitoring and reviewing risks  

Organizations use Risk Management to ensure they are protecting what matters most.

---

## 3. Risk Assessment (Inside Risk Management)

**Risk Assessment** is the analysis stage of Risk Management.

It answers:

- Which assets do we have?  
- What threats target them?  
- What vulnerabilities exist?  
- What is the impact if something goes wrong?  
- How likely is the risk to occur?  

### 3.1 Qualitative Risk Assessment

Uses descriptive levels like:

- High  
- Medium  
- Low  

It’s simple, fast, and widely used by SOC and Blue Team analysts.

Example of a qualitative result:

- `Likelihood: High`  
- `Impact: Medium`  
- `Risk Level: High`

### 3.2 Quantitative Risk Assessment

Uses numbers and financial values:

- Monetary loss  
- Probability percentages  
- Annualized loss expectancy (ALE)  

Example of a quantitative result:

- `Annual Loss Expectancy (ALE) = $25,000`

This approach is more precise, but more complex and data-dependent.

---

## 4. Core Risk Concepts (Important for Interviews)

### Threat  
Something that can cause harm.  
Examples: malware, phishing, ransomware, insider threat, fire, human error.

### Vulnerability  
A weakness that a threat can exploit.  
Examples: misconfigurations, weak passwords, outdated systems, open ports.

### Impact  
The damage caused if the risk occurs.  
Examples: financial loss, data breach, downtime, legal penalties, reputation damage.

### Likelihood  
How probable it is that the threat will exploit the vulnerability.

Risk Assessment combines **likelihood** and **impact** to decide how serious a risk is.

---

## 5. Risk Matrix (Common Tool for Prioritization)

| Likelihood | Impact | Risk Level |
|-----------|--------|-----------|
| High      | High   | Critical  |
| High      | Medium | High      |
| Medium    | High   | High      |
| Medium    | Medium | Medium    |
| Low       | High   | Medium    |
| Low       | Low    | Low       |

This matrix helps teams visualize which risks must be mitigated first.

---

## 6. Common Cybersecurity Risks

Some typical risks in real environments:

- Misconfigurations (default settings, open ports, weak permissions)  
- Weak passwords or no MFA  
- Excessive privileges (no least privilege)  
- Outdated operating systems and applications  
- Missing security patches  
- Publicly exposed services (RDP, SSH, databases)  
- Lack of monitoring or logging  
- Phishing and social engineering  
- Ransomware and malware infections  
- Third-party and supply chain risks  

All these risks are evaluated based on **assets**, **threats**, **vulnerabilities**, **impact**, and **likelihood**.

---

## 7. How Companies Treat Risks (Risk Responses)

Organizations usually choose one of four main responses:

### 7.1 Avoid  
Eliminate the activity that creates the risk.  
Example: decommissioning an old, insecure system.

### 7.2 Mitigate  
Reduce likelihood or impact using controls.  
Examples:
- Patching and updating systems  
- Applying hardening baselines  
- Using MFA  
- Enforcing least privilege  
- Segmenting the network  

### 7.3 Transfer  
Move the risk to a third party.  
Examples:
- Cyber insurance  
- Cloud service providers  
- Outsourcing specific services  

### 7.4 Accept  
Acknowledge the risk and take no additional action.  
Used when:
- Impact is low  
- Likelihood is low  
- Cost of mitigation is higher than the potential loss  

---

## 8. Example: Risk Assessment for an AD Security Lab

Example of simple risk analysis for a small lab:

| Asset        | Threat             | Vulnerability                      | Impact                       | Risk Level |
|--------------|--------------------|------------------------------------|------------------------------|-----------|
| DC1 (AD DS)  | Credential theft   | Weak admin password                | Domain-wide compromise       | Critical  |
| Client01     | Malware            | User runs unknown executables      | Lateral movement             | High      |
| File Server  | Unauthorized access| Misconfigured NTFS permissions     | Data exposure                | High      |
| SIEM Logs    | Log tampering      | No integrity or backup             | Loss of incident visibility  | Medium    |

This shows understanding of how assets, threats, vulnerabilities, and impact work together.

---

## 9. How to Explain This in an Interview

### Short version

> “Risk Management is the continuous process of identifying and mitigating risks, and Risk Assessment is the step where we analyze likelihood and impact to prioritize them.”

### Professional version

> “In cybersecurity, risk is the potential for a threat to exploit a vulnerability and harm an asset.  
> Risk Management is the overall process of identifying, analyzing, prioritizing, and treating these risks.  
> Inside that process, Risk Assessment focuses on evaluating assets, threats, vulnerabilities, likelihood, and impact.  
> The result is a prioritized list of risks that helps the organization decide which controls to implement and where to focus its security efforts.”

You can adapt this answer depending on the job role (SOC, Blue Team, governance, cloud, etc.).

---

## 10. Key Takeaways

- **Risk Management** = strategic, ongoing process.  
- **Risk Assessment** = analytical step inside Risk Management.  
- Risks are based on assets, threats, vulnerabilities, impact, and likelihood.  
- Risk matrices help with prioritization.  
- Critical assets should receive stronger protection and monitoring.  
- Understanding risk is essential for SOC, Blue Team, cloud security, and Active Directory environments.

---
