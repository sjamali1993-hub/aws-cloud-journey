# AWS Cloud Engineering Portfolio
**Salah Jamali** — [www.jamalicloud.com](https://jamalicloud.com)  
Cloud Engineer — AWS Operations Specialist

---

## About

AWS Cloud Engineer with hands-on experience building and operating 
production infrastructure on AWS. Background in network administration 
(TCP/IP, DNS, routing, firewalls) — a strong foundation for cloud operations.

Currently building toward AWS certifications while delivering real 
infrastructure projects.

---

## Infrastructure Built

### vpc-jamali — Custom VPC (10.0.0.0/16)

- Public/private subnets across 2 Availability Zones
- Internet Gateway, NAT Gateway, Route Tables
- Bastion Host for secure private instance access
- Security Groups and NACLs
- VPC Peering with default VPC

### Database Layer

- RDS MySQL 8.4 in private subnet
- Accessible only from within VPC (no public exposure)
- Connected via VPC Peering from web server

### Web Infrastructure

- Static website on S3 + CloudFront + ACM (HTTPS)
- Custom domain jamalicloud.com via DNS (Hostinger)
- Auto Scaling Group with Application Load Balancer
- SSL Termination on ALB
- Health Checks across multiple AZ

### Monitoring & Security

- CloudWatch dashboards and alarms
- SNS alerting
- IAM users, groups, roles — least privilege principle
- MFA enabled on Root and admin accounts
- Private hosted zone (Route 53) — jamali.internal

---

## Skills

### AWS Services

| Service | Level |
|---------|-------|
| EC2 | Operational |
| S3 + CloudFront | Operational |
| VPC + Networking | Operational |
| IAM | Operational |
| RDS | Operational |
| CloudWatch | Operational |
| Auto Scaling + ALB | Operational |
| Route 53 | Operational |
| ACM | Operational |
| AWS CLI | Operational |

### Tools & Technologies

- Linux (Amazon Linux 2023) — Nginx, systemctl, bash
- Git + GitHub
- SSH, SCP, Bastion Host
- DNS — A, CNAME, hosted zones
- MySQL client

---

## Certifications

- [ ] AWS Cloud Practitioner (CLF-C02) — in progress
- [ ] AWS Solutions Architect Associate (SAA-C03) — planned

---

## Key Architecture

User
↓
www.jamalicloud.com
↓
CloudFront (CDN + HTTPS via ACM)
↓
S3 (static website)
User
↓
ALB (HTTPS + SSL Termination)
↓
Auto Scaling Group (EC2 × 2, multi-AZ)
↓
RDS MySQL (private subnet)

## Contact

- **Website:** [jamalicloud.com](https://jamalicloud.com)
- **GitHub:** [github.com/jamalicloud](https://github.com/jamalicloud)
- **Email:** contact@jamalicloud.com

---

