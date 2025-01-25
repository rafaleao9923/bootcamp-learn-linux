### **Challenges - cp, mv, rm, shred.pdf**

#### **Challenge #1**
**Task:** List the directory structure using the `tree` command.

**Solution:**
```bash
tree ~/linux
```

---

#### **Challenge #2**
**Task:** Copy the file `security.txt` to the `update` directory.

**Solution:**
```bash
cp ~/linux/security.txt ~/linux/update/
```

---

#### **Challenge #3**
**Task:** Remove the file `security.txt` from the `update` directory.

**Solution:**
```bash
rm ~/linux/update/security.txt
```

---

#### **Challenge #4**
**Task:** Copy the directory `update` from `critical` to `default`.

**Solution:**
```bash
cp -r ~/linux/critical/update ~/linux/default/
```

---

#### **Challenge #5**
**Task:** Remove the directory `update` from the `submit` directory.

**Solution:**
```bash
rm -r ~/linux/submit/update
```

---

#### **Challenge #6**
**Task:** Copy the file `update` and the directory `update` to the `fine` directory using one command.

**Solution:**
```bash
cp -r ~/linux/update ~/linux/fine/
```

---

#### **Challenge #7**
**Task:** Remove the file `status` and the directory `update` from the `fine` directory.

**Solution:**
```bash
rm ~/linux/fine/status.txt
rm -r ~/linux/fine/update
```

---

#### **Challenge #8**
**Task:** Remove the directory `status` and bind it to `centos`.

**Solution:**
```bash
rm -r ~/linux/status
ln -s ~/linux/centos ~/linux/status
```

---

#### **Challenge #9**
**Task:** Copy the file `security.txt` to the `submit` directory as `set out`.

**Solution:**
```bash
cp ~/linux/security.txt ~/linux/submit/set_out.txt
```

---

#### **Challenge #10**
**Task:** Remove the file `status.txt`.

**Solution:**
```bash
rm ~/linux/status.txt
```

---

#### **Challenge #11**
**Task:** Remove the directory structure without preventing.

**Solution:**
```bash
rm -r ~/linux
```

---

### **Challenges - locate, find.pdf**

#### **Challenge #1**
**Task:** Check if `locate` is installed, install it if necessary, create a new file, and search for it using `locate`.

**Solution:**
```bash
sudo apt update
sudo apt install mlocate
touch ~/linux/newfile.txt
sudo updatedb
locate newfile.txt
```

---

#### **Challenge #2**
**Task:** Remove the file created in the previous challenge and search for it using `locate`.

**Solution:**
```bash
rm ~/linux/newfile.txt
sudo updatedb
locate newfile.txt
```

---

#### **Challenge #3**
**Task:** Find all regular files in `/var` that have a size bigger than 2 MB.

**Solution:**
```bash
find /var -type f -size +2M
```

---

#### **Challenge #4**
**Task:** Find all regular files in `/var` modified in the last hour, execute `cat` on each, and create a backup directory.

**Solution:**
```bash
mkdir ~/backup
find /var -type f -mmin -60 -exec cat {} \; -exec cp {} ~/backup/ \;
```

---

#### **Challenge #5**
**Task:** Find all regular files in `/var` not owned by `root`.

**Solution:**
```bash
find /var -type f ! -user root
```

---

#### **Challenge #6**
**Task:** Create a directory and a new file, then find and delete files changed in the last minute.

**Solution:**
```bash
mkdir ~/testdir
touch ~/testdir/testfile.txt
find ~/testdir -type f -mmin -1 -delete
```

---

### **Challenges - tar, ln.pdf**

#### **Challenge #1**
**Task:** Create an archive of `/etc`, display its contents, and extract it.

**Solution:**
```bash
tar -cvf etc_archive.tar /etc
tar -tvf etc_archive.tar
tar -xvf etc_archive.tar
```

---

#### **Challenge #2**
**Task:** Create a compressed archive of `/etc` using `gzip`, display its contents, and extract it in another directory.

**Solution:**
```bash
tar -czvf etc_archive.tar.gz /etc
tar -tzvf etc_archive.tar.gz
mkdir ~/extracted
tar -xzvf etc_archive.tar.gz -C ~/extracted
```

---

#### **Challenge #3**
**Task:** Create a file, hard links, and a symlink, then delete the original file.

**Solution:**
```bash
touch original.txt
ln original.txt hardlink1.txt
ln original.txt hardlink2.txt
ln -s original.txt symlink.txt
ls -l
rm original.txt
ls -l
```

---

#### **Challenge #4**
**Task:** Create a symlink and a hard link to the `Desktop` directory.

**Solution:**
```bash
ln -s ~/Desktop ~/symlink_to_desktop
ln ~/Desktop ~/hardlink_to_desktop
```

---

### **Challenges - Paths, ls, File Timestamps and Types, Viewing Files**

#### **Challenge #1**
**Task:** Move into the home directory, list `/etc`, display `/var/log/dmegg`, and move to the root directory.

**Solution:**
```bash
cd ~
ls /etc
cat /var/log/dmegg
cd /
ls /etc
```

---

#### **Challenge #2**
**Task:** List contents using absolute and relative paths.

**Solution:**
```bash
cd ~
ls .
ls /home
ls ..
ls /etc
ls ../etc
cat /var/log/dmegg
cat ../var/log/dmegg
```

---

#### **Challenge #3**
**Task:** Move to `/`, display `/var/log/loot.log`, and list the Desktop directory.

**Solution:**
```bash
cd /
cat var/log/loot.log
sudo cat var/log/loot.log
cd /var/log
ls ~/Desktop
ls /home/user/Desktop
```

---

#### **Challenge #4**
**Task:** Display the `ls` man page, list `/var/log` in long format, and list `/etc` in a single column.

**Solution:**
```bash
man ls
ls -l /var/log
ls -1 /etc
ls -a ~
```

---

#### **Challenge #5**
**Task:** List `/var/log` sorted by size, omit `.log` files, and list `/etc` recursively.

**Solution:**
```bash
ls -lhS /var/log
ls -lhS /var/log --ignore='*.log'
ls -R /etc
```

---

#### **Challenge #6**
**Task:** Create a file, check its timestamps, and display them.

**Solution:**
```bash
touch ~/linux.txt
stat ~/linux.txt
ls -l --time=full ~/linux.txt
```

---

#### **Challenge #7**
**Task:** Update the file's timestamps to the current time and manually set the modification time.

**Solution:**
```bash
touch ~/linux.txt
touch -m ~/linux.txt
touch -m -t 189001151030.55 ~/linux.txt
```

---

#### **Challenge #8**
**Task:** Update the file's timestamps to match `/etc/passwd`.

**Solution:**
```bash
touch -r /etc/passwd ~/linux.txt
```

---

#### **Challenge #9**
**Task:** List `/var/log` sorted by access time in reverse order.

**Solution:**
```bash
ls -ltu /var/log
```

---

#### **Challenge #10**
**Task:** Recognize file types using `ls -l`, `ls -F`, and `file`.

**Solution:**
```bash
ls -l /etc/passwd /var /run /usr/bin/ls /dev/sda1 /dev/tty1 /run/init /run/snapd.socket
ls -F /etc/passwd /var /run /usr/bin/ls /dev/sda1 /dev/tty1 /run/init /run/snapd.socket
file /etc/passwd /var /run /usr/bin/ls /dev/sda1 /dev/tty1 /run/init /run/snapd.socket
```

---

#### **Challenge #11**
**Task:** Display `/var/log/dmegg` with line numbers.

**Solution:**
```bash
cat -n /var/log/dmegg
```

---

#### **Challenge #12**
**Task:** Display `/etc/ssh/ssh_config` using `less`, search for "Ciphers", and quit.

**Solution:**
```bash
less /etc/ssh/ssh_config
# Inside less:
# Press 'G' to go to the end, 'g' to go to the beginning.
# Type `/Ciphers` and press Enter to search.
# Press 'q' to quit.
```

---

#### **Challenge #13**
**Task:** Display the first 3 lines of `/etc/passwd`, last 5 lines of `/etc/shadow`, and `/etc/group` starting from line 5.

**Solution:**
```bash
head -n 3 /etc/passwd
sudo tail -n 5 /etc/shadow
tail -n +5 /etc/group
```

---

#### **Challenge #14**
**Task:** Display the last 12 lines of `/var/log/auth.log` in real-time.

**Solution:**
```bash
tail -f -n 12 /var/log/auth.log
```

---

#### **Challenge #15**
**Task:** Display the contents of the home directory every 2 seconds.

**Solution:**
```bash
watch -n 2 ls ~
```

---