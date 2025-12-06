# SQL & SQL Injection (SQLi)

> **Short idea:**  
> SQL is the language used to manage relational databases. SQL Injection is an attack where malicious input manipulates SQL queries, allowing unauthorized access or control of the database.

---

## 1. What Is SQL?

SQL (Structured Query Language) is the standard language used to create, manage, and query relational databases.

SQL allows you to:
- Create and modify tables
- Insert, update, and delete data
- Retrieve data using queries
- Manage users and permissions
- Analyze and filter large datasets

Common SQL commands:
- SELECT
- INSERT
- UPDATE
- DELETE
- CREATE
- DROP

SQL is used in websites, APIs, applications, banking systems, and enterprise environments.

---

## 2. Why SQL Matters in Cybersecurity

Because SQL stores sensitive information (credentials, personal data, payments), attackers target databases frequently.

Security teams must understand SQL because:
- Logs contain SQL activity
- SQL Injection creates notable SOC alerts
- Databases are a high-value target
- Vulnerabilities often stem from unsafe SQL queries

---

## 3. What Is SQL Injection (SQLi)?

SQL Injection is a vulnerability where user-controlled input is inserted into SQL queries without proper validation or sanitization.

This allows attackers to:
- Bypass authentication
- Extract sensitive data
- Modify or delete database records
- Create admin accounts
- Read system information
- Fully compromise the database

SQLi is one of the most dangerous vulnerabilities in the **OWASP Top 10**.

---

## 4. Simple SQL Injection Example

Normal login:

Username: admin  
Password: 1234

Backend query:
SELECT * FROM Users WHERE username='admin' AND password='1234';

Attacker enters:
' OR '1'='1

Query becomes:
SELECT * FROM Users WHERE username='admin' AND password='' OR '1'='1';

Because '1'='1' is always true, the attacker logs in without a password.

---

## 5. Types of SQL Injection

1. Classic (In-band) SQLi – Attacker sends malicious input and immediately receives output.
2. Error-based SQLi – Relies on forcing database error messages to leak information.
3. Blind SQLi – Application hides errors; attacker infers data via timing or boolean responses.
4. Union-based SQLi – Uses UNION SELECT to extract data from other tables.

---

## 6. What Attackers Can Do with SQLi

- Bypass logins
- Dump entire databases
- Modify or delete records
- Exfiltrate sensitive information
- Escalate privileges
- Create new admin users
- Potentially execute OS-level commands (depending on DB engine)
- Destroy or ransom database contents

---

## 7. How to Prevent SQL Injection

1. Parameterized queries (prepared statements)
2. Input validation (block dangerous characters)
3. Stored procedures (properly written)
4. Escaping special characters
5. Least-privilege access for database accounts
6. Web Application Firewall (WAF)
7. Avoid dynamic SQL (string concatenation)

Parameterized queries are the most effective protection.

---

## 8. Detecting SQL Injection (SOC Perspective)

SOC analysts detect SQLi through:
- Suspicious query patterns (' OR 1=1 --)
- High volume of failed queries
- Union SELECT attempts
- Access to system tables (information_schema)
- WAF alerts
- Application error logs
- SQL syntax injected into URL parameters or forms

SQLi produces recognizable fingerprints.

---

## 9. Safe vs Unsafe SQL Query

Unsafe:
SELECT * FROM Users WHERE username='" + user + "' AND password='" + pass + "'";

Safe (parameterized):
SELECT * FROM Users WHERE username = ? AND password = ?;

DB engine treats user input as data, not code.

---

## 10. Interview Explanation

Short version:
“SQL Injection occurs when user input is inserted into SQL queries without validation, allowing attackers to manipulate or access the database.”

Professional version:
“SQL Injection is a vulnerability caused by unsanitized input being included in SQL queries. Attackers can execute arbitrary SQL commands, bypass authentication, steal data, modify records, or fully compromise a database. The strongest defense is using parameterized queries, validation, least privilege, and WAF protections.”

---

## 11. Key Takeaways

- SQL manages relational databases.
- SQL Injection exploits unsafe input handling.
- SQLi is one of the most critical OWASP Top 10 vulnerabilities.
- Attackers can bypass authentication and steal or destroy data.
- Parameterized queries are the best defense.
- SOC teams must understand SQLi patterns to detect attacks.

---
