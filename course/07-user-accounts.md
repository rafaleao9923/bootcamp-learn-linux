# User Accounts Management in Linux

# Table of Contents

- [Changing and Removing User Accounts (usermod, userdel)](#changing-and-removing-user-accounts-usermod-userdel)
- [Creating Admin Users](#creating-admin-users)
- [Creating User Accounts (useradd)](#creating-user-accounts-useradd)
- [Group Management (groupadd, groupdel, groupmod)](#group-management-groupadd-groupdel-groupmod)
- [Quiz for Accounts Management](#quiz-for-accounts-management)
- [Understanding /etc/passwd and /etc/shadow files](#understanding-etcpasswd-and-etcshadow-files)
- [Understanding Linux Groups (groups, id)](#understanding-linux-groups-groups-id)
- [User Account Monitoring (whoami, who am i, who, id, w, uptime, last)](#user-account-monitoring-whoami-who-am-i-who-id-w-uptime-last)

---

## Changing and Removing User Accounts (usermod, userdel)

### **usermod**: Modify User Accounts
The `usermod` command is used to modify existing user accounts. You can change the user's home directory, login name, shell, and more.

#### Example:
```bash
# Change the user's home directory
sudo usermod -d /new/home/directory username

# Change the user's login name
sudo usermod -l new_username old_username

# Change the user's shell
sudo usermod -s /bin/bash username
```

### **userdel**: Delete User Accounts
The `userdel` command is used to delete a user account. You can also remove the user's home directory and mail spool.

#### Example:
```bash
# Delete a user account
sudo userdel username

# Delete a user account and their home directory
sudo userdel -r username
```

---

## Creating Admin Users

### **Creating Admin Users**
To create an admin user, you can add the user to the `sudo` group, which grants administrative privileges.

#### Example:
```bash
# Create a new user
sudo useradd -m adminuser

# Set a password for the user
sudo passwd adminuser

# Add the user to the sudo group
sudo usermod -aG sudo adminuser
```

---

## Creating User Accounts (useradd)

### **useradd**: Create User Accounts
The `useradd` command is used to create new user accounts. You can specify options like the home directory, shell, and more.

#### Example:
```bash
# Create a new user with a home directory
sudo useradd -m newuser

# Set a password for the user
sudo passwd newuser

# Create a user with a specific shell
sudo useradd -m -s /bin/bash newuser
```

---

## Group Management (groupadd, groupdel, groupmod)

### **groupadd**: Create Groups
The `groupadd` command is used to create new groups.

#### Example:
```bash
# Create a new group
sudo groupadd newgroup
```

### **groupdel**: Delete Groups
The `groupdel` command is used to delete existing groups.

#### Example:
```bash
# Delete a group
sudo groupdel oldgroup
```

### **groupmod**: Modify Groups
The `groupmod` command is used to modify group properties, such as the group name or GID.

#### Example:
```bash
# Change the group name
sudo groupmod -n newgroupname oldgroupname

# Change the group GID
sudo groupmod -g 1005 groupname
```

---

## Quiz for Accounts Management

### **Quiz Questions**
1. What command is used to create a new user?
2. How do you add a user to the `sudo` group?
3. What command is used to delete a user and their home directory?
4. How do you change a user's login shell?
5. What is the purpose of the `/etc/passwd` file?

---

## Understanding /etc/passwd and /etc/shadow files

### **/etc/passwd**
The `/etc/passwd` file contains user account information. Each line represents a user and includes fields like username, UID, GID, home directory, and shell.

#### Example:
```bash
cat /etc/passwd
```
Output:
```
username:x:1001:1001:User Name,,,:/home/username:/bin/bash
```

### **/etc/shadow**
The `/etc/shadow` file contains encrypted password information and password expiration details for user accounts.

#### Example:
```bash
sudo cat /etc/shadow
```
Output:
```
username:$6$randomstring$encryptedpassword:18295:0:99999:7:::
```

---

## Understanding Linux Groups (groups, id)

### **groups**: List User Groups
The `groups` command lists the groups a user belongs to.

#### Example:
```bash
groups username
```

### **id**: Display User and Group Information
The `id` command displays the user's UID, GID, and group memberships.

#### Example:
```bash
id username
```

---

## User Account Monitoring (whoami, who am i, who, id, w, uptime, last)

### **whoami**: Display Current User
The `whoami` command displays the username of the current user.

#### Example:
```bash
whoami
```

### **who am i**: Display Current User Session
The `who am i` command displays information about the current user session.

#### Example:
```bash
who am i
```

### **who**: List Logged-in Users
The `who` command lists all users currently logged into the system.

#### Example:
```bash
who
```

### **id**: Display User and Group Information
The `id` command displays the user's UID, GID, and group memberships.

#### Example:
```bash
id username
```

### **w**: Display System Uptime and Logged-in Users
The `w` command displays system uptime and information about logged-in users.

#### Example:
```bash
w
```

### **uptime**: Display System Uptime
The `uptime` command displays how long the system has been running.

#### Example:
```bash
uptime
```

### **last**: Display Login History
The `last` command displays the login history of users.

#### Example:
```bash
last
```

---