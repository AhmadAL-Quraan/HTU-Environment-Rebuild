# HTU Environment Rebuild – Assignment Brief

## Introduction

Hello Trainee,

We are contacting you following a critical incident that recently affected one of our major clients, HTU. Due to the sudden departure of several members of the former SysAdmins team, large portions of the infrastructure were left without proper documentation or maintenance. This resulted in a major outage for HTU a few days ago.

HTU has expressed strong dissatisfaction and indicated that any similar incident in the future may lead to the termination of their contract, posing a serious risk to our business relationship and overall reputation.

We urgently require your support to rebuild and stabilize HTU’s environment from the ground up. As they operate an Enterprise Multi-User Environment, the system must be reconstructed with proper security, user access control, storage integrity, and service reliability.

Because no documentation was left behind, you must perform a complete reinstallation and reconfiguration of their RHEL server from scratch.

---

## 1. Server Rebuild Task

Rebuild HTU’s Enterprise Multi-User Environment server using the following specifications:

- 4 vCPU  
- 4 GB RAM  
- 20 GB Disk  
- 40 GB Disk  
- Operating System: Red Hat Enterprise Linux (RHEL)

---

## 2. OS Installation Requirements

After preparing the server hardware and confirming that it is ready for deployment, install Red Hat Enterprise Linux using standard installation methods.

In addition to the manual installation, configure an automated installation workflow using Kickstart to support consistent and repeatable deployments across HTU’s environment.

### 2.1 Language & Localization
- Language: English (US)  
- Keyboard: English (US)  
- Timezone: Asia/Amman  

### 2.2 Disk & Partitioning
- Select the 20 GB disk  
- Use Automatic Partitioning  

### 2.3 User Configuration
- Disable direct root login  
- Create an administrative user:
  - Username: sysadmin  
  - Add to the wheel group  
  - Use a strong password  

### 2.4 Software Selection
- Minimal Install  
- Leave all other settings as default  

### 2.5 Automated Installation (Kickstart)
Prepare a Kickstart configuration that reflects all installation settings above.

---

## 12. SSH Service Hardening

- SSH key authentication for sysadmin
- Disable password authentication
- Restrict SSH access to administrative users only
