# Linux File Permissions

# Table of Contents

- [Linux File Permissions](#linux-file-permissions)
- [Table of Contents](#table-of-contents)
  - [Changing File Ownership (chown, chgrp)](#changing-file-ownership-chown-chgrp)
    - [**chown**: Change File Owner](#chown-change-file-owner)
      - [Example:](#example)
    - [**chgrp**: Change File Group](#chgrp-change-file-group)
      - [Example:](#example-1)
  - [Changing File Permissions (chmod)](#changing-file-permissions-chmod)
    - [**chmod**: Change File Permissions](#chmod-change-file-permissions)
      - [Example (Symbolic Notation):](#example-symbolic-notation)
      - [Example (Octal Notation):](#example-octal-notation)
  - [Combining Find and Chmod Commands Together](#combining-find-and-chmod-commands-together)
    - [**Find and Chmod**](#find-and-chmod)
      - [Example:](#example-2)
  - [Octal (Numeric) Notation of File Permissions](#octal-numeric-notation-of-file-permissions)
    - [**Octal Notation**](#octal-notation)
      - [Example:](#example-3)
  - [The Effect of Permissions on Directories](#the-effect-of-permissions-on-directories)
    - [**Directory Permissions**](#directory-permissions)
      - [Example:](#example-4)
  - [Umask](#umask)
    - [**Umask**](#umask-1)
      - [Example:](#example-5)
  - [Understanding File Permissions](#understanding-file-permissions)
    - [**File Permissions**](#file-permissions)
      - [Example:](#example-6)
  - [Understanding Files Attributes (lsattr, chattr)](#understanding-files-attributes-lsattr-chattr)
    - [**lsattr**: List File Attributes](#lsattr-list-file-attributes)
      - [Example:](#example-7)
    - [**chattr**: Change File Attributes](#chattr-change-file-attributes)
      - [Example:](#example-8)
  - [Understanding SGID (Set Group ID)](#understanding-sgid-set-group-id)
    - [**SGID**](#sgid)
      - [Example:](#example-9)
  - [Understanding SUID (Set User ID)](#understanding-suid-set-user-id)
    - [**SUID**](#suid)
      - [Example:](#example-10)
  - [Understanding the Sticky Bit](#understanding-the-sticky-bit)
    - [**Sticky Bit**](#sticky-bit)
      - [Example:](#example-11)

---

## Changing File Ownership (chown, chgrp)

### **chown**: Change File Owner
The `chown` command is used to change the owner of a file or directory.

#### Example:
```bash
# Change the owner of a file
sudo chown newowner filename

# Change the owner and group of a file
sudo chown newowner:newgroup filename
```

### **chgrp**: Change File Group
The `chgrp` command is used to change the group of a file or directory.

#### Example:
```bash
# Change the group of a file
sudo chgrp newgroup filename
```

---

## Changing File Permissions (chmod)

### **chmod**: Change File Permissions
The `chmod` command is used to change the permissions of a file or directory. Permissions can be set using symbolic or octal notation.

#### Example (Symbolic Notation):
```bash
# Add execute permission for the owner
chmod u+x filename

# Remove read permission for others
chmod o-r filename
```

#### Example (Octal Notation):
```bash
# Set permissions to read, write, and execute for the owner, and read for others
chmod 744 filename
```

---

## Combining Find and Chmod Commands Together

### **Find and Chmod**
You can use the `find` command to locate files and then apply `chmod` to change their permissions.

#### Example:
```bash
# Find all .txt files in the current directory and set permissions to 644
find . -name "*.txt" -exec chmod 644 {} \;
```

---

## Octal (Numeric) Notation of File Permissions

### **Octal Notation**
File permissions can be represented using a 3-digit octal number, where each digit corresponds to the owner, group, and others.

| Permission | Octal Value |
|------------|-------------|
| Read (r)   | 4           |
| Write (w)  | 2           |
| Execute (x)| 1           |

#### Example:
- `755` means:
  - Owner: Read, Write, Execute (7)
  - Group: Read, Execute (5)
  - Others: Read, Execute (5)

---

## The Effect of Permissions on Directories

### **Directory Permissions**
- **Read (r)**: Allows listing the contents of the directory.
- **Write (w)**: Allows creating, deleting, or renaming files in the directory.
- **Execute (x)**: Allows accessing files or subdirectories within the directory.

#### Example:
```bash
# Set directory permissions to allow read and execute for all users
chmod 755 directoryname
```

---

## Umask

### **Umask**
The `umask` command sets default permissions for newly created files and directories. It subtracts permissions from the default (usually `666` for files and `777` for directories).

#### Example:
```bash
# Set umask to 022 (default permissions: 644 for files, 755 for directories)
umask 022
```

---

## Understanding File Permissions

### **File Permissions**
File permissions in Linux are divided into three categories:
1. **Owner**: The user who owns the file.
2. **Group**: The group that owns the file.
3. **Others**: All other users.

Permissions are represented as:
- `r` (read)
- `w` (write)
- `x` (execute)

#### Example:
```bash
# Display file permissions
ls -l filename
```

---

## Understanding Files Attributes (lsattr, chattr)

### **lsattr**: List File Attributes
The `lsattr` command lists the attributes of a file or directory.

#### Example:
```bash
# List attributes of a file
lsattr filename
```

### **chattr**: Change File Attributes
The `chattr` command changes the attributes of a file or directory.

#### Example:
```bash
# Make a file immutable (cannot be modified or deleted)
sudo chattr +i filename
```

---

## Understanding SGID (Set Group ID)

### **SGID**
The **Set Group ID (SGID)** bit ensures that files created in a directory inherit the group ownership of the directory, not the user's primary group.

#### Example:
```bash
# Set SGID on a directory
sudo chmod g+s directoryname
```

---

## Understanding SUID (Set User ID)

### **SUID**
The **Set User ID (SUID)** bit allows a user to execute a file with the permissions of the file's owner.

#### Example:
```bash
# Set SUID on a file
sudo chmod u+s filename
```

---

## Understanding the Sticky Bit

### **Sticky Bit**
The **Sticky Bit** ensures that only the owner of a file or directory can delete or rename it, even if others have write permissions.

#### Example:
```bash
# Set the sticky bit on a directory
sudo chmod +t directoryname
```

---