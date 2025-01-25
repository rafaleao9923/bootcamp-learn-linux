## **Challenge #1**

### **Problem Identification**:
- Create a new user using the `useradd` command with no additional options.
- Check if the home directory was created.
- Set a password for the user.
- Log in as the new user.

### **Solution Proposal**:
1. Use the `useradd` command to create a new user.
2. Check if the home directory was created.
3. Set a password using the `passwd` command.
4. Log in as the new user.

### **Implementation Guidance**:
```bash
# Step 1: Create a new user
sudo useradd newuser

# Step 2: Check if the home directory was created
ls /home/newuser  # This should fail because the home directory is not created by default

# Step 3: Set a password for the user
sudo passwd newuser

# Step 4: Log in as the new user
su - newuser
```

### **Optimization**:
- Use the `-m` option with `useradd` to ensure the home directory is created automatically:
  ```bash
  sudo useradd -m newuser
  ```

---

## **Challenge #2**

### **Problem Identification**:
- Create a new user with a specific home directory, Bash shell, and a comment.
- Set a password for the user.
- Create a new group and add the user to it.
- Check the user's group memberships.

### **Solution Proposal**:
1. Use `useradd` with the `-m`, `-d`, `-s`, and `-c` options to create the user.
2. Set a password using `passwd`.
3. Create a new group using `groupadd`.
4. Add the user to the group using `usermod`.
5. Check the user's group memberships using `groups`.

### **Implementation Guidance**:
```bash
# Step 1: Create a new user with a home directory, Bash shell, and a comment
sudo useradd -m -d /home/newuser -s /bin/bash -c "New User" newuser

# Step 2: Set a password for the user
sudo passwd newuser

# Step 3: Create a new group
sudo groupadd newgroup

# Step 4: Add the user to the new group
sudo usermod -aG newgroup newuser

# Step 5: Check the user's group memberships
groups newuser
```

### **Optimization**:
- Use `id` to display detailed information about the user, including group memberships:
  ```bash
  id newuser
  ```

---

## **Challenge #3**

### **Problem Identification**:
- Attempt to execute a command as root (e.g., `sudo cat /etc/shadow` or `sudo ls -l /root`) as a non-admin user.
- Make the user an admin and retry the command.

### **Solution Proposal**:
1. Attempt to run a command as root using `sudo`.
2. Add the user to the `sudo` group to grant admin privileges.
3. Retry the command.

### **Implementation Guidance**:
```bash
# Step 1: Attempt to run a command as root (this should fail)
sudo cat /etc/shadow

# Step 2: Add the user to the sudo group
sudo usermod -aG sudo newuser

# Step 3: Retry the command (this should succeed)
sudo cat /etc/shadow
```

### **Optimization**:
- Verify the user's sudo privileges using:
  ```bash
  sudo -l -U newuser
  ```

---

## **Challenge #4**

### **Problem Identification**:
- Create two new groups.
- Add the user to these groups without removing them from existing groups.

### **Solution Proposal**:
1. Create two new groups using `groupadd`.
2. Add the user to both groups using `usermod`.

### **Implementation Guidance**:
```bash
# Step 1: Create two new groups
sudo groupadd group1
sudo groupadd group2

# Step 2: Add the user to both groups
sudo usermod -aG group1,group2 newuser

# Step 3: Verify the user's group memberships
groups newuser
```

### **Optimization**:
- Use `id` to display detailed group information:
  ```bash
  id newuser
  ```

---

## **Challenge #5**

### **Problem Identification**:
- Remove the groups and users created in previous challenges, including their home directories.

### **Solution Proposal**:
1. Delete the user using `userdel` with the `-r` option to remove the home directory.
2. Delete the groups using `groupdel`.

### **Implementation Guidance**:
```bash
# Step 1: Delete the user and their home directory
sudo userdel -r newuser

# Step 2: Delete the groups
sudo groupdel group1
sudo groupdel group2
```

### **Optimization**:
- Verify that the user and groups have been deleted:
  ```bash
  id newuser  # Should return "no such user"
  getent group group1  # Should return nothing
  getent group group2  # Should return nothing
  ```

---

## **Challenge #6**

### **Problem Identification**:
- Understand the concept of **salting** in Linux password hashing.
- Create two users with the same password and verify that their hashed passwords in `/etc/shadow` are different.

### **Solution Proposal**:
1. Create two users using `useradd`.
2. Set the same password for both users using `passwd`.
3. Check the `/etc/shadow` file to verify that the hashed passwords are different.

### **Implementation Guidance**:
```bash
# Step 1: Create two users
sudo useradd -m user1
sudo useradd -m user2

# Step 2: Set the same password for both users
sudo passwd user1  # Set password to "password123"
sudo passwd user2  # Set password to "password123"

# Step 3: Check the /etc/shadow file
sudo cat /etc/shadow | grep -E 'user1|user2'
```

### **Optimization**:
- Explain that the hashed passwords are different due to **salting**, which adds a unique random value to each password before hashing.

---

## **Summary of Solutions**

| Challenge | Problem | Solution | Implementation |
|-----------|---------|----------|----------------|
| 1 | Create a user, set password, and log in | Use `useradd`, `passwd`, and `su` | `sudo useradd -m newuser`, `sudo passwd newuser`, `su - newuser` |
| 2 | Create a user with specific options, add to a group | Use `useradd`, `passwd`, `groupadd`, and `usermod` | `sudo useradd -m -d /home/newuser -s /bin/bash -c "New User" newuser`, `sudo groupadd newgroup`, `sudo usermod -aG newgroup newuser` |
| 3 | Grant admin privileges to a user | Add user to `sudo` group | `sudo usermod -aG sudo newuser` |
| 4 | Add user to multiple groups | Use `groupadd` and `usermod` | `sudo groupadd group1`, `sudo groupadd group2`, `sudo usermod -aG group1,group2 newuser` |
| 5 | Remove users and groups | Use `userdel` and `groupdel` | `sudo userdel -r newuser`, `sudo groupdel group1`, `sudo groupdel group2` |
| 6 | Understand password salting | Create users with the same password and check `/etc/shadow` | `sudo useradd -m user1`, `sudo useradd -m user2`, `sudo passwd user1`, `sudo passwd user2`, `sudo cat /etc/shadow` |

---