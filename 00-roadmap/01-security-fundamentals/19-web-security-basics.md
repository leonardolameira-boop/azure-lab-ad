# Web Security Basics

> **Short idea:**  
> Web Security Basics covers the fundamental concepts used to protect web applications, including authentication, authorization, input validation, secure communication, and protection against common attacks.

---

## 1. What Is Web Security?

Web security consists of practices, controls, and technologies used to protect websites and web applications from attacks.  
Its goals are to prevent unauthorized access, protect data, and maintain availability and integrity.

Web applications are highly exposed, making them primary targets for attackers.

---

## 2. Core Principles of Web Security

### 1) Authentication  
Ensures the user is who they claim to be.  
Examples: passwords, MFA, tokens, biometrics.

### 2) Authorization  
Defines what the user is allowed to do.  
Examples: RBAC, access control policies.

### 3) Input Validation  
Prevents malicious input from being processed.  
Examples: sanitization, allowlists, escaping.

### 4) Encryption  
Protects sensitive data in transit and at rest.  
Examples: HTTPS/TLS, database encryption.

### 5) Session Management  
Controls user sessions securely.  
Examples: secure cookies, session expiration, token rotation.

---

## 3. Common Web Security Threats

- SQL Injection (SQLi)
- Cross-Site Scripting (XSS)
- Cross-Site Request Forgery (CSRF)
- Broken Authentication
- Sensitive Data Exposure
- Insecure Direct Object Reference (IDOR)
- Directory Traversal
- Weak session handling
- Misconfiguration

These appear in OWASP Top 10.

---

## 4. Essential Web Security Headers

Examples:
- Content-Security-Policy (CSP)
- X-Frame-Options
- X-Content-Type-Options
- Strict-Transport-Security (HSTS)
- Referrer-Policy

These headers reduce attack surface and protect users.

---

## 5. HTTPS and TLS

HTTPS ensures:
- Confidentiality  
- Integrity  
- Authentication  

TLS prevents man-in-the-middle attacks and secures data in transit.

---

## 6. Secure Coding Practices

- Never trust user input  
- Avoid building SQL queries with string concatenation  
- Use prepared statements  
- Escape HTML output  
- Use parameterized APIs  
- Implement least privilege  
- Store passwords using hashing (bcrypt, Argon2)

---

## 7. How Attacks Typically Happen

Attackers commonly exploit:
- Poor input validation  
- Weak authentication  
- Bad session management  
- Outdated libraries  
- Misconfigured servers  
- Exposed debug endpoints  

Understanding these weaknesses is key in blue team work.

---

## 8. Web Security in SOC / Blue Team

SOC analysts monitor:
- WAF alerts  
- Suspicious authentication attempts  
- SQL Injection patterns  
- XSS attempts  
- 403/401 anomalies  
- High error-rate patterns  
- Unauthorized access attempts  

Logs from web servers (Apache/Nginx/IIS) provide critical evidence.

---

## 9. Interview Explanation

Short version:
“Web security ensures that web applications are protected from common attacks like SQL Injection, XSS, and CSRF through authentication, authorization, validation, encryption, and secure coding.”

Professional version:
“Web security is the practice of protecting web applications by enforcing authentication, authorization, input validation, encryption, and secure session management. It prevents vulnerabilities described in OWASP Top 10 and ensures data confidentiality, integrity, and availability.”

---

## 10. Key Takeaways

- Authentication verifies identity  
- Authorization defines permissions  
- Validation prevents malicious input  
- HTTPS and encryption protect data  
- OWASP Top 10 defines critical web risks  
- SOC teams continuously monitor web-layer attacks  

---
