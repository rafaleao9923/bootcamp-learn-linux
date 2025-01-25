### Challenge #1

**Task:**
- Run the following command both as a non-privileged user and as root: **tail -c /etc/shadow**
  - Use the **TAB** key for auto-completion.

**Solution:**
1. **As a non-privileged user:**
   - Open the terminal.
   - Type `tail -c /etc/shadow` and press **TAB** for auto-completion.
   - Press **Enter**.
   - You will likely get a "Permission denied" error because `/etc/shadow` is a sensitive file that only the root user can access.

2. **As root:**
   - Switch to the root user by typing `sudo su` and entering your password.
   - Type `tail -c /etc/shadow` and press **TAB** for auto-completion.
   - Press **Enter**.
   - This will display the last few bytes of the `/etc/shadow` file.

### Challenge #2

**Task:**
- Become root temporarily in a terminal.
- Run the following command as root: **apt update && apt install nmap**
  - Logout root from the terminal using a keyboard shortcut.

**Solution:**
1. **Become root temporarily:**
   - Open the terminal.
   - Type `sudo su` and enter your password to become root.

2. **Run the command:**
   - Type `apt update && apt install nmap` and press **Enter**.
   - This will update the package list and install the `nmap` tool.

3. **Logout from root:**
   - Press **Ctrl + D** to logout from the root shell and return to your normal user.

### Challenge #3

**Task:**
- Change the root password.
- Become root in a terminal by running the **su** command.
- Run as root the following command: **lshw**

**Solution:**
1. **Change the root password:**
   - Open the terminal.
   - Type `sudo passwd root` and press **Enter**.
   - Enter a new password for the root user when prompted.

2. **Become root:**
   - Type `su` and press **Enter**.
   - Enter the root password you just set.

3. **Run the command:**
   - Type `lshw` and press **Enter**.
   - This will display detailed information about the hardware configuration of your system.

### Challenge #4

**Task:**
- Consider the **nmap** program installed in a previous challenge. Open its man page and search for the option: **-sV**
  - **Run as root: nmap -sV -p 80 www.example.com**
  - Find the IP address of your Default Gateway running **route -n** and then run as root: **nmap -sV -p 80,443 default_gateway_ip**

**Solution:**
1. **Open the man page for nmap:**
   - Type `man nmap` and press **Enter**.
   - Search for the `-sV` option by typing `/sV` and pressing **Enter**.

2. **Run the nmap command:**
   - Switch to root by typing `sudo su` and entering your password.
   - Type `nmap -sV -p 80 www.example.com` and press **Enter**.
   - This will scan port 80 on `www.example.com` and attempt to determine the service version.

3. **Find the Default Gateway IP:**
   - Type `route -n` and press **Enter**.
   - Look for the IP address under the "Gateway" column.

4. **Run nmap on the Default Gateway:**
   - Type `nmap -sV -p 80,443 default_gateway_ip` (replace `default_gateway_ip` with the actual IP address) and press **Enter**.
   - This will scan ports 80 and 443 on your default gateway.

### Challenge #5

**Task:**
- Display the user’s history.
- Remove line no. 4 from the history.
- Run a command without being recorded in history. Check that it wasn’t saved in the shell history.
- Remove the entire history.

**Solution:**
1. **Display the user’s history:**
   - Type `history` and press **Enter**.
   - This will display a list of previously executed commands with line numbers.

2. **Remove line no. 4 from the history:**
   - Type `history -d 4` and press **Enter**.
   - This will delete the command at line 4 from the history.

3. **Run a command without being recorded in history:**
   - Type a space before the command, e.g., ` ls` (note the space before `ls`).
   - Press **Enter**.
   - The command will run but won't be saved in the history.

4. **Remove the entire history:**
   - Type `history -c` and press **Enter**.
   - This will clear the entire command history.

---