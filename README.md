# HTU Environment Rebuild
## Enterprise Multi-User RHEL Server

---

## 1. Project Overview

| Item | Description |
|----|----|
| Client | HTU |
| Problem | Major outage caused by missing documentation and mismanagement |
| Objective | Rebuild and stabilize the enterprise server from scratch |
| Operating System | Red Hat Enterprise Linux (RHEL) |
| Access Method | SSH only after installation |

---

## 2. Server Hardware Specifications

| Resource | Specification |
|----|----|
| vCPU | 4 |
| RAM | 4 GB |
| Disk 1 | 20 GB (Operating System) |
| Disk 2 | 40 GB (LVM, Storage, Swap) |

---

## 3. OS Installation Configuration

### 3.1 Localization Settings

| Setting | Value |
|----|----|
| Language | English (US) |
| Keyboard | English (US) |
| Timezone | Asia/Amman |

### 3.2 Disk & Partitioning

| Item | Configuration |
|----|----|
| Selected Disk | 20 GB |
| Partitioning Method | Automatic |
| Filesystem | Default |

### 3.3 User Configuration

| User | Role | Group | Root Login |
|----|----|----|----|
| root | Disabled | — | ❌ |
| sysadmin | Administrator | wheel | ✔ (sudo) |

---

## 4. Software Selection

| Option | Selection |
|----|----|
| Installation Type | Minimal Install |
| Additional Packages | Default only |

---

## 5. Automated Installation (Kickstart)

| Requirement | Status |
|----|----|
| Fully automated | ✔ |
| Matches manual installation | ✔ |
| Repeatable deployment | ✔ |

---

## 6. Remote Access Policy

| Item | Requirement |
|----|----|
| Access Method | SSH |
| Local Console Usage | Not allowed |
| Administrative Access | sysadmin only |

---

## 7. Post-Installation System Setup

### 7.1 Server Registration

| Task | Description |
|----|----|
| Registration | Red Hat Subscription Management |
| Repositories | Official RHEL repositories |

### 7.2 System Update

| Command | Purpose |
|----|----|
| dnf update -y | Update all packages |

### 7.3 Essential Packages

| Package | Purpose |
|----|----|
| nano | Text editor |
| VDO + kmod-kvdo | Storage optimization |
| rsync | Secure data migration |
| tuned | Performance tuning |
| httpd / nginx | Web server |
| net-tools | Legacy networking (optional) |

---

## 8. Storage Configuration (Disk 2 – 40 GB)

### 8.1 Disk Layout

| Item | Configuration |
|----|----|
| Partition Table | GPT |
| Partition Type | Single LVM |
| Filesystem | XFS |

### 8.2 Logical Volumes

| Mount Point | Size | Notes |
|----|----|----|
| /home | 15 GB | Migrated using rsync |
| /home.bak | — | Original home directory |
| /company | 10 GB | Department data |
| Swap (extra) | RAM-based | Added without removing default |

### 8.3 Persistence

| File | Purpose |
|----|----|
| /etc/fstab | Persistent mounts and swap |

---

## 9. Department Directory Structure

### 9.1 Directories

| Department | Path |
|----|----|
| HR | /company/hr |
| Finance | /company/finance |
| Engineering | /company/engineering |
| Management | /company/management |

### 9.2 Access Control Policy

| Rule | Applied |
|----|----|
| Department isolation | ✔ |
| Group collaboration | ✔ |
| Inherit group ownership | ✔ |
| Prevent deleting others’ files | ✔ |

---

## 10. Groups and Users

### 10.1 Groups

| Groups |
|----|
| hr |
| finance |
| engineering |
| management |
| it |

### 10.2 User Accounts

| Username | Department | Group | Admin | Password |
|----|----|----|----|----|
| sara | HR | hr | No | Htu@123 |
| huda | HR | hr | No | Htu@123 |
| ahmed | Finance | finance | No | Htu@123 |
| rami | Finance | finance | No | Htu@123 |
| omar | Engineering | engineering | No | Htu@123 |
| ali | Engineering | engineering | No | Htu@123 |
| manager | Management | management | No | Htu@123 |
| admin1 | IT | it | Yes | Htu@123 |
| admin2 | IT | it | Yes | Htu@123 |

### 10.3 Home Directory Rules

| Rule | Status |
|----|----|
| Home on Disk 2 | ✔ |
| Single department group | ✔ |
| Admin privileges for IT only | ✔ |

---

## 11. Backup Configuration

### 11.1 Backup Script

| Feature | Description |
|----|----|
| Source | /company |
| Format | Compressed .tar |
| Destination | /backup |

### 11.2 Automation

| Tool | Schedule |
|----|----|
| cron | Daily at 11:59 AM |

---

## 12. Performance Optimization (TuneD)

| Task | Status |
|----|----|
| TuneD installed | ✔ |
| Enabled at boot | ✔ |
| Active profile | virtual-guest |

---

## 13. System Identity & Repositories

### 13.1 Hostname

| Setting | Value |
|----|----|
| Hostname | htu-server.ceu.local |

### 13.2 Local Name Resolution

| File | Purpose |
|----|----|
| /etc/hosts | Local hostname resolution |

### 13.3 YUM Repositories

| Repository | URL |
|----|----|
| BaseOS | http://content.example.com/rhel8.0/x86_64/dvd/BaseOS |
| AppStream | http://content.example.com/rhel8.0/x86_64/dvd/AppStream |

---

## 14. HR Placeholder Web Application

### 14.1 Web Content

| Item | Value |
|----|----|
| Path | /opt/hr_placeholder |
| Page | Coming Soon |

### 14.2 Web Service Configuration

| Setting | Value |
|----|----|
| Web Server | Apache or Nginx |
| Port | 82 |
| Service Manager | systemd |
| Auto-start | Enabled |

### 14.3 SELinux & Firewall

| Feature | Status |
|----|----|
| SELinux Mode | Enforcing |
| Port 82 Allowed | ✔ |
| Firewall Rule | Permanent |

---

## 15. SSH Service Hardening

### 15.1 Authentication

| Rule | Applied |
|----|----|
| SSH keys for sysadmin | ✔ |
| Password login (sysadmin) | ❌ |
| Password authentication (system-wide) | ❌ |

### 15.2 Access Restrictions

| Rule | Applied |
|----|----|
| SSH access for admins only | ✔ |
| Non-admin SSH access | ❌ |

---
