# The Linux Terminal in Depth

# Table of Contents

- [The Linux Terminal in Depth](#the-linux-terminal-in-depth)
- [Table of Contents](#table-of-contents)
  - [Getting Help, Man Pages (man, type, help, apropos)](#getting-help-man-pages-man-type-help-apropos)
  - [Linux Command Structure](#linux-command-structure)
  - [Terminal - Keyboard Shortcuts](#terminal---keyboard-shortcuts)
    - [Navigation Shortcuts:](#navigation-shortcuts)
    - [Text Manipulation Shortcuts:](#text-manipulation-shortcuts)
    - [Command History Shortcuts:](#command-history-shortcuts)
    - [Terminal Multiplexer (tmux) Shortcuts (if tmux is installed):](#terminal-multiplexer-tmux-shortcuts-if-tmux-is-installed)
    - [Copy-Paste Shortcuts (when using a terminal emulator that supports them):](#copy-paste-shortcuts-when-using-a-terminal-emulator-that-supports-them)
  - [Mastering the Terminal - the Bash History](#mastering-the-terminal---the-bash-history)
    - [Commands for Interacting with the History:](#commands-for-interacting-with-the-history)
    - [Customizing the History:](#customizing-the-history)
    - [Tips and Tricks:](#tips-and-tricks)
  - [Mastering the Terminal - The TAB Key](#mastering-the-terminal---the-tab-key)
    - [1. **Auto-Completion:**](#1-auto-completion)
    - [2. **Auto-Completion for Commands:**](#2-auto-completion-for-commands)
    - [3. **Auto-Completion for File and Directory Paths:**](#3-auto-completion-for-file-and-directory-paths)
    - [4. **Auto-Completion for Filenames with Spaces:**](#4-auto-completion-for-filenames-with-spaces)
    - [5. **Listing Available Options:**](#5-listing-available-options)
    - [6. **Auto-Completion for Command Options:**](#6-auto-completion-for-command-options)
    - [7. **Auto-Completion for Variable Names:**](#7-auto-completion-for-variable-names)
    - [8. **Auto-Completion for Environment Variables:**](#8-auto-completion-for-environment-variables)
    - [9. **Command Substitution:**](#9-command-substitution)
    - [10. **File and Directory Listing:**](#10-file-and-directory-listing)
    - [Tips:](#tips)
  - [Recording the Date and Time for Each line in History](#recording-the-date-and-time-for-each-line-in-history)
    - [1. Enabling Timestamps for History Entries](#1-enabling-timestamps-for-history-entries)
      - [**Step 1: Set the `HISTTIMEFORMAT` Variable**](#step-1-set-the-histtimeformat-variable)
        - [**Example:**](#example)
      - [**Step 2: Reload `.bashrc` or `.bash_profile`**](#step-2-reload-bashrc-or-bash_profile)
      - [**Step 3: View History with Timestamps**](#step-3-view-history-with-timestamps)
    - [2. Making the Configuration Persistent](#2-making-the-configuration-persistent)
    - [3. Using Timestamps with `history` Command](#3-using-timestamps-with-history-command)
    - [4. Formatting and Customization](#4-formatting-and-customization)
    - [5. Caveats and Tips](#5-caveats-and-tips)
      - [**History File (`.bash_history`)**](#history-file-bash_history)
      - [**Appending to History Across Sessions**](#appending-to-history-across-sessions)
      - [**Limiting History Size**](#limiting-history-size)
    - [6. Example: Combining Timestamp and History Control](#6-example-combining-timestamp-and-history-control)
    - [7. Viewing Timestamped History in `.bash_history`](#7-viewing-timestamped-history-in-bash_history)
  - [root vs. non-Privileged Users. Getting root Access (sudo, su, passwd)](#root-vs-non-privileged-users-getting-root-access-sudo-su-passwd)
    - [1. **Root User vs. Non-Privileged Users**](#1-root-user-vs-non-privileged-users)
      - [**Root User:**](#root-user)
      - [**Non-Privileged Users:**](#non-privileged-users)
    - [2. **Getting Root Access**](#2-getting-root-access)
      - [**2.1 `sudo` (Superuser Do)**](#21-sudo-superuser-do)
      - [**2.2 `su` (Switch User)**](#22-su-switch-user)
      - [**2.3 `passwd` Command**](#23-passwd-command)
      - [**Using `sudo` vs. `su`**](#using-sudo-vs-su)
      - [**Configuring `sudo` Access:**](#configuring-sudo-access)
      - [**Granting `sudo` Access:**](#granting-sudo-access)
    - [3. **Security Best Practices for Root Access**](#3-security-best-practices-for-root-access)
  - [Running Commands Without Leaving a Trace](#running-commands-without-leaving-a-trace)
    - [1. **Using a Space Before the Command**](#1-using-a-space-before-the-command)
      - [Example:](#example-1)
      - [Setting `HISTCONTROL`:](#setting-histcontrol)
    - [2. **Clearing Command History Immediately After Running a Command**](#2-clearing-command-history-immediately-after-running-a-command)
      - [Clearing Entire History:](#clearing-entire-history)
      - [Deleting the Last Entry:](#deleting-the-last-entry)
    - [3. **Using `unset HISTFILE`**](#3-using-unset-histfile)
      - [Example:](#example-2)
    - [4. **Setting `HISTSIZE` to 0**](#4-setting-histsize-to-0)
      - [Example:](#example-3)
    - [5. **Temporarily Disabling History Logging (`set +o history`)**](#5-temporarily-disabling-history-logging-set-o-history)
      - [Example:](#example-4)
    - [6. **Using a Subshell to Run Commands**](#6-using-a-subshell-to-run-commands)
      - [Example:](#example-5)
    - [7. **Redirecting Output to `/dev/null`**](#7-redirecting-output-to-devnull)
      - [Example:](#example-6)
    - [8. **Running a Command Without History in Zsh (`setopt NO_HIST_IGNORE_SPACE`)**](#8-running-a-command-without-history-in-zsh-setopt-no_hist_ignore_space)
      - [Example:](#example-7)
    - [9. **Completely Disabling History for a Session**](#9-completely-disabling-history-for-a-session)
    - [10. **Modifying `~/.bashrc` or `~/.bash_profile` for Persistent Settings**](#10-modifying-bashrc-or-bash_profile-for-persistent-settings)
    - [**Best Practices for Running Commands Without a Trace**](#best-practices-for-running-commands-without-a-trace)
  - [Terminals, Consoles, Shells and Commands](#terminals-consoles-shells-and-commands)
    - [**1. Terminals**](#1-terminals)
      - [Types of Terminals:](#types-of-terminals)
      - [Example:](#example-8)
    - [**2. Consoles**](#2-consoles)
      - [Example of Virtual Consoles:](#example-of-virtual-consoles)
    - [**3. Shells**](#3-shells)
      - [Common Shells in Linux:](#common-shells-in-linux)
      - [Example:](#example-9)
    - [**4. Commands**](#4-commands)
      - [Command Structure:](#command-structure)
      - [Example of a Basic Command:](#example-of-a-basic-command)
      - [Wildcards:](#wildcards)
      - [Example:](#example-10)
      - [Piping Commands:](#piping-commands)
      - [Command Redirection:](#command-redirection)
    - [**5. Shell Scripting**](#5-shell-scripting)
      - [Example of a Simple Shell Script:](#example-of-a-simple-shell-script)
    - [**6. Interacting with the Shell: Built-in vs External Commands**](#6-interacting-with-the-shell-built-in-vs-external-commands)
      - [Example of Built-in Command:](#example-of-built-in-command)
      - [Example of External Command:](#example-of-external-command)

## Getting Help, Man Pages (man, type, help, apropos)

- man: This command is short for "manual". It provides detailed manual pages for other commands. For example, man ls will provide a detailed manual for the ls command. It's a comprehensive source of information, but can be overwhelming for beginners.

- type: This command is used to describe how its argument would be interpreted if used as a command. It can tell you whether a command is built-in, an alias, a file, a function, etc. For example, type ls might output "ls is aliased to ls --color=auto", indicating that ls is an alias.

- help: This command is used to get a short description of a built-in command. It's less comprehensive than man, but can be easier to understand for beginners. For example, help cd will provide a short description of the cd command.

- apropos: This command is used to search the man page descriptions for instances of a keyword. It's useful when you know what you want to do, but you don't know the command. For example, apropos copy will list all commands that have the word "copy" in their description.

## Linux Command Structure

```
command [options] [arguments]
```

1. **Command:**
   - This is the actual executable or script that performs a specific operation. For example, `ls`, `cp`, `mkdir`, etc.

2. **Options:**
   - Options modify the behavior of the command. They are preceded by a hyphen (`-`) or a double hyphen (`--`). Options are often single characters or short words. For example:
     - Single character: `-l` (list in long format)
     - Full word: `--help` (display help information)

3. **Arguments:**
   - Arguments are the targets or inputs for the command. They can be file names, directories, or other data that the command needs to operate on. For example:
     - File name: `file.txt`
     - Directory: `~/Documents`

```bash
ls -l /home/user/Documents
```

- `ls` is the command.
- `-l` is an option that tells `ls` to list in long format.
- `/home/user/Documents` is an argument specifying the directory for which to list the contents.

Some commands may not require options or arguments, and some may accept multiple options or arguments.

Additionally, there are a few special characters and symbols used in Linux commands:

- **Wildcards:**
  - `*` (asterisk): Represents any number of characters.
  - `?` (question mark): Represents a single character.
  - `[ ]` (square brackets): Represents a range of characters.

  Example using wildcards with the `ls` command:

  ```bash
  ls *.txt
  ```

  This command lists all files with a `.txt` extension in the current directory.

- **Redirection:**
  - `>` (greater than): Redirects standard output to a file, overwriting its contents.
  - `>>` (double greater than): Redirects standard output to a file, appending to its contents.
  - `<` (less than): Takes input from a file and provides it as standard input to a command.

  Example using redirection with the `echo` command:

  ```bash
  echo "Hello, World!" > output.txt
  ```

  This command writes the text "Hello, World!" to a file named `output.txt`.

- **Pipes:**
  - `|` (pipe): Sends the output of one command as the input to another command.

  Example using pipes with the `ls` and `grep` commands:

  ```bash
  ls -l | grep "file"
  ```

  This command lists files in long format and filters the output to display only lines containing the word "file."

- The `man` command (manual pages) provides detailed information about individual commands and their usage. For example:

```bash
man ls
```

## Terminal - Keyboard Shortcuts

### Navigation Shortcuts:

- **Ctrl + A:** Move to the beginning of the line.
- **Ctrl + E:** Move to the end of the line.
- **Ctrl + U:** Delete from the cursor to the beginning of the line.
- **Ctrl + K:** Delete from the cursor to the end of the line.
- **Ctrl + W:** Delete the word before the cursor.
- **Ctrl + L:** Clear the terminal screen.
- **Ctrl + R:** Search command history (reverse search).
- **Ctrl + S:** Stop output to the screen (used to pause terminal output).
- **Ctrl + C:** Terminate the current command.
- **Ctrl + D:** Log out of the current session (or end input for some commands).
- **Ctrl + Z:** Suspend the current process (move it to the background).

### Text Manipulation Shortcuts:

- **Ctrl + Y:** Paste the most recently cut text.
- **Alt + D:** Delete the word after the cursor.
- **Alt + Backspace:** Delete the word before the cursor.

### Command History Shortcuts:

- **Up Arrow or Ctrl + P:** Move to the previous command in history.
- **Down Arrow or Ctrl + N:** Move to the next command in history.
- **Ctrl + R:** Search backward through the command history.
- **Ctrl + G:** Escape from history searching mode.
- **!!:** Repeat the last command.
- **!n:** Repeat the nth command in history.

### Terminal Multiplexer (tmux) Shortcuts (if tmux is installed):

- **Ctrl + B, %:** Split the terminal vertically.
- **Ctrl + B, ":** Split the terminal horizontally.
- **Ctrl + B, Arrow keys:** Navigate between panes.
- **Ctrl + B, c:** Create a new window.
- **Ctrl + B, n:** Move to the next window.
- **Ctrl + B, p:** Move to the previous window.
- **Ctrl + B, d:** Detach from the current session.

### Copy-Paste Shortcuts (when using a terminal emulator that supports them):

- **Ctrl + Shift + C:** Copy selected text.
- **Ctrl + Shift + V:** Paste copied text.

## Mastering the Terminal - the Bash History

1. **Command History Size:**
   - The number of commands stored in the history can be set using the `HISTSIZE` environment variable. For example:
     ```bash
     export HISTSIZE=1000
     ```

2. **History File:**
   - The history is usually saved to a file called `.bash_history` in the user's home directory.

### Commands for Interacting with the History:

1. **`history` Command:**
   - Displays the command history along with line numbers.
     ```bash
     history
     ```

2. **`!!` (Double Bang):**
   - Repeats the last command.
     ```bash
     !!
     ```

3. **`!n` (History Expansion):**
   - Repeats the nth command from the history.
     ```bash
     !42
     ```

4. **`!-n` (Relative History):**
   - Repeats the command that appeared n commands ago.
     ```bash
     !-2
     ```

5. **`!string` (Search and Execute):**
   - Repeats the most recent command starting with "string."
     ```bash
     !ls
     ```

6. **`Ctrl + R` (Reverse Search):**
   - Initiates a reverse search in the history. Start typing a command, and it will find the most recent match.
     ```bash
     # Type Ctrl + R, then start typing
     ```

7. **`history -c` (Clear History):**
   - Clears the entire command history.
     ```bash
     history -c
     ```

8. **`history -d n` (Delete Entry):**
   - Deletes the entry at position n from the history.
     ```bash
     history -d 42
     ```

### Customizing the History:

1. **`HISTCONTROL` Variable:**
   - Controls how commands are saved to the history. Common values include `ignorespace` (commands starting with a space are not saved) and `ignoredups` (ignores duplicate commands).

2. **`HISTFILE` Variable:**
   - Specifies the location of the history file. You can change it to use a different file.
     ```bash
     export HISTFILE=~/.my_custom_history
     ```

3. **`HISTTIMEFORMAT` Variable:**
   - If set, adds a timestamp to each history entry.
     ```bash
     export HISTTIMEFORMAT="%F %T "
     ```

### Tips and Tricks:

1. **Persistent History Across Sessions:**
   - To ensure that history is saved and loaded between sessions, add the following to your `.bashrc` or `.bash_profile`:
     ```bash
     shopt -s histappend
     PROMPT_COMMAND="history -a"
     ```

2. **Ignore Commands from History:**
   - To prevent specific commands from being added to the history, precede them with a space.
     ```bash
     # This command won't be saved to history
      ls -l
     ```

3. **Execute a Command Without Saving to History:**
   - Use the `HISTCONTROL` variable with the value `ignorespace` or precede the command with a space.
     ```bash
     # This command won't be saved to history
      ls -l
     ```
## Mastering the Terminal - The TAB Key

### 1. **Auto-Completion:**
   - One of the primary functions of the `TAB` key is auto-completion. When you start typing a command, file, or directory name and press `TAB`, the terminal will attempt to complete the entry based on the available options.
     ```bash
     ls Do<TAB>
     # Result: ls Documents/
     ```

### 2. **Auto-Completion for Commands:**
   - Pressing `TAB` after typing a partial command will attempt to complete it, helping you avoid typing the full command.
     ```bash
     su<TAB>
     # Result: sudo
     ```

### 3. **Auto-Completion for File and Directory Paths:**
   - Auto-completion works for file and directory paths, making it easier to navigate the filesystem.
     ```bash
     cd /ho<TAB>
     # Result: cd /home/
     ```

### 4. **Auto-Completion for Filenames with Spaces:**
   - If a filename contains spaces, the `TAB` key will automatically escape the spaces, allowing you to continue typing.
     ```bash
     cat My\ Docu<TAB>
     # Result: cat My\ Documents/
     ```

### 5. **Listing Available Options:**
   - Pressing `TAB` twice after a partial entry will display a list of available options, helping you choose from the available matches.
     ```bash
     ls D<TAB><TAB>
     # Result: Display list of options starting with D
     ```

### 6. **Auto-Completion for Command Options:**
   - When typing command options, pressing `TAB` will auto-complete the option if there is a unique match.
     ```bash
     ls -l --h<TAB>
     # Result: ls -l --help
     ```

### 7. **Auto-Completion for Variable Names:**
   - In some shells, pressing `TAB` can auto-complete variable names.
     ```bash
     $MY_VA<TAB>
     # Result: $MY_VARIABLE
     ```

### 8. **Auto-Completion for Environment Variables:**
   - Environment variables can be auto-completed by pressing `TAB` after the `$` symbol.
     ```bash
     echo $HOM<TAB>
     # Result: echo $HOME
     ```

### 9. **Command Substitution:**
   - When using command substitution with `$(...)`, pressing `TAB` can auto-complete the command within the substitution.
     ```bash
     ls -l $(echo /u<TAB>)
     # Result: ls -l $(echo /usr/)
     ```

### 10. **File and Directory Listing:**
   - Pressing `TAB` after a command that expects a file or directory as an argument will list available options.
     ```bash
     cat /etc/p<TAB>
     # Result: cat /etc/passwd
     ```

### Tips:
- **Double-Tap TAB:**
  - Double-tapping `TAB` will show a list of available options if there are multiple matches.
  
- **Cycle Through Options:**
  - If there are multiple matches, pressing `TAB` multiple times will cycle through the available options.

- **Case Sensitivity:**
  - `TAB` key completion is case-sensitive. Be aware of the case when using it.

- **Customization:**
  - The behavior of `TAB` completion can be customized using shell options and configuration files, such as `.bashrc` or `.bash_profile`.

## Recording the Date and Time for Each line in History

### 1. Enabling Timestamps for History Entries

#### **Step 1: Set the `HISTTIMEFORMAT` Variable**
To store timestamps with each command in your history, you can set the `HISTTIMEFORMAT` variable. This tells Bash to record the date and time along with each command.

You can set this directly in the terminal or, to make it persistent across sessions, add it to your `.bashrc` or `.bash_profile` file.

##### **Example:**
```bash
export HISTTIMEFORMAT="%F %T "
```

- `%F` will format the date as `YYYY-MM-DD`.
- `%T` will format the time as `HH:MM:SS`.

You can also customize this format to your liking using different placeholders:
- `%F` — Full date (`YYYY-MM-DD`).
- `%T` — Full time (`HH:MM:SS`).
- `%D` — Date in MM/DD/YY format.
- `%H` — Hour (24-hour clock).
- `%I` — Hour (12-hour clock).
- `%M` — Minutes.
- `%S` — Seconds.
- `%p` — AM/PM indicator.

#### **Step 2: Reload `.bashrc` or `.bash_profile`**
After adding this to your `.bashrc` or `.bash_profile`, reload the configuration with:
```bash
source ~/.bashrc
# or
source ~/.bash_profile
```

#### **Step 3: View History with Timestamps**
Once `HISTTIMEFORMAT` is set, you can view your command history with timestamps by using the `history` command:
```bash
history
```

Each command will now appear with its associated timestamp. For example:
```bash
1001  2024-10-13 10:45:12 ls -l
1002  2024-10-13 10:46:30 cd ~/Documents
1003  2024-10-13 10:47:05 echo "Hello, World!"
```

### 2. Making the Configuration Persistent
To ensure that the timestamp format is always used when recording commands to history, you need to permanently add it to your Bash configuration file.

1. Open your `.bashrc` or `.bash_profile` file in a text editor (e.g., `nano` or `vim`).
   ```bash
   nano ~/.bashrc
   ```

2. Add the following lines:
   ```bash
   export HISTTIMEFORMAT="%F %T "
   ```

3. Save the file and exit the editor.

4. Reload the configuration:
   ```bash
   source ~/.bashrc
   ```

Now, every command you enter will have a timestamp attached in your history file.

### 3. Using Timestamps with `history` Command
After enabling timestamps, you can use the `history` command to see commands along with the recorded date and time:
```bash
history
```

You can also specify a range of history entries:
```bash
history 10
# Shows the last 10 commands along with timestamps.
```

### 4. Formatting and Customization
You can customize the timestamp format to your needs. Here are a few more examples:

- **Display only the time:**
   ```bash
   export HISTTIMEFORMAT="%T "
   ```

- **Display only the date:**
   ```bash
   export HISTTIMEFORMAT="%F "
   ```

- **Include day of the week:**
   ```bash
   export HISTTIMEFORMAT="%A %F %T "
   # Example output: Monday 2024-10-13 10:45:12
   ```

### 5. Caveats and Tips

#### **History File (`.bash_history`)**
It’s important to note that the timestamps are **not** stored directly in the `.bash_history` file. When you view the history in the terminal, the shell reads the timestamp from an internal memory buffer and formats it accordingly.

#### **Appending to History Across Sessions**
To ensure that your Bash history, including timestamps, is saved across different sessions and appended correctly:
1. Add the following lines to your `.bashrc`:
   ```bash
   shopt -s histappend
   PROMPT_COMMAND="history -a; history -c; history -r"
   ```

   - `shopt -s histappend`: Ensures that history is appended to the history file rather than overwriting it.
   - `history -a`: Writes the current session’s history to the history file.
   - `history -c`: Clears the current history in memory.
   - `history -r`: Reloads the history from the history file.

#### **Limiting History Size**
You can control how many commands are stored in your history by setting the `HISTSIZE` and `HISTFILESIZE` variables:
```bash
export HISTSIZE=1000          # Number of commands in memory
export HISTFILESIZE=2000      # Number of commands in the history file
```

This prevents the history file from growing indefinitely.

### 6. Example: Combining Timestamp and History Control

Here’s a practical example of combining all these elements in your `.bashrc` file:
```bash
# Enable timestamped history
export HISTTIMEFORMAT="%F %T "

# Append to history file, don't overwrite
shopt -s histappend

# Save history after every command
PROMPT_COMMAND="history -a; history -c; history -r"

# Limit history size
export HISTSIZE=1000
export HISTFILESIZE=2000
```

With this setup:
- All commands will be saved with timestamps.
- Your history will be saved across sessions.
- You’ll maintain a limited, manageable history size.

### 7. Viewing Timestamped History in `.bash_history`

While timestamps are not stored directly in the `.bash_history` file by default, you can modify Bash to save them by configuring the file itself. This is not recommended for general use because it will make `.bash_history` less readable, but it can be done by writing your own custom solution to parse and store both commands and timestamps in a custom log.

---

## root vs. non-Privileged Users. Getting root Access (sudo, su, passwd)

In Linux, there are two primary types of user accounts: **root** (the superuser) and **non-privileged users** (regular users). The root user has full control over the system, whereas non-privileged users have limited permissions.

### 1. **Root User vs. Non-Privileged Users**

#### **Root User:**
- The root user is the **superuser** in Linux, with **unrestricted access** to all system files, configurations, and commands.
- The root user can perform any operation, such as installing software, modifying system files, creating or deleting users, and changing file permissions.
- The root user account should be used with caution, as it can directly affect the system's functionality. A small mistake can potentially break the system.

#### **Non-Privileged Users:**
- Non-privileged (regular) users have limited access to the system, primarily restricted to their own files and certain parts of the system.
- Regular users can read files from most system directories, but they cannot modify system files or execute administrative commands.
- Non-privileged users cannot install software, change network settings, or perform other administrative tasks without elevating their privileges.

The separation of these roles helps protect the system from accidental changes or malicious attacks. Regular users can work in their own space without the risk of compromising the entire system.

### 2. **Getting Root Access**

In most Linux distributions, it's rare to log in as the root user directly. Instead, users elevate their privileges only when necessary, typically by using commands like `sudo` or `su`. This limits the risk of accidental damage while still allowing administrative tasks when needed.

#### **2.1 `sudo` (Superuser Do)**

The `sudo` command allows a permitted user to **run specific commands as the root user** (or another user, depending on the configuration) without logging in as root. 

- **How `sudo` Works:**
  - When you run a command prefixed by `sudo`, it is executed with root privileges.
  - The system checks the `/etc/sudoers` file to verify whether the user has permission to run `sudo` commands.
  - After verifying the user's credentials, `sudo` will prompt for the user's password, not the root password.
  
- **Example of `sudo` Usage:**
  ```bash
  sudo apt update
  sudo systemctl restart apache2
  ```

In the examples above:
- `sudo apt update` updates the package list, a task requiring administrative rights.
- `sudo systemctl restart apache2` restarts the Apache server.

- **Common `sudo` Options:**
  - `sudo -s`: Starts a root shell session.
  - `sudo -u <user> <command>`: Runs the specified command as another user (not just root).
  - `sudo -l`: Lists the commands you are permitted to run using `sudo`.

- **Benefits of Using `sudo`:**
  - Limits root access: Users only gain elevated privileges for the specific command they're running.
  - Logged actions: All `sudo` commands are logged in `/var/log/auth.log`, providing an audit trail.
  - Password expiration: Users need to re-authenticate after a certain time (usually 15 minutes), reducing the risk of someone else running commands if the user leaves the terminal open.

#### **2.2 `su` (Switch User)**

The `su` command allows you to **switch to a different user account** (by default, root). Unlike `sudo`, which elevates privileges for a single command, `su` opens a new shell session under the specified user's identity.

- **How `su` Works:**
  - Running `su` switches to the root user (or any other user if specified).
  - You will be prompted to enter the **target user's password** (e.g., the root password if switching to root).
  - After entering the password, you will have a shell session as that user.

- **Example of `su` Usage:**
  ```bash
  su
  su -l username
  ```

In the examples:
- `su`: Switches to the root user and requires the root password.
- `su -l username`: Switches to the specified user, requiring that user's password.

- **Common `su` Options:**
  - `su -l` (or `su -`): Starts a login shell with the target user’s environment variables (e.g., `$PATH`, home directory, etc.). Without `-l`, it only switches the user but retains the original environment.
  - `su <user>`: Switches to a specific user (instead of root).

- **When to Use `su`:**
  - `su` is useful when you need to perform multiple root-level tasks without prefixing each command with `sudo`.
  - Use `sudo` for one-off administrative tasks, and `su` when you need extended access as another user.

#### **2.3 `passwd` Command**

The `passwd` command is used to **change a user's password**. Both the root user and regular users can change their own passwords, but only the root user can change passwords for other users.

- **How `passwd` Works:**
  - When a regular user runs `passwd`, they are prompted to enter their current password, followed by a new password.
  - When the root user runs `passwd`, they can change the password for any user on the system.

- **Example of `passwd` Usage:**
  - To change your own password:
    ```bash
    passwd
    ```
  - To change another user's password (as root):
    ```bash
    sudo passwd username
    ```

- **Common `passwd` Options:**
  - `passwd -l <user>`: Locks the user account (disables login).
  - `passwd -u <user>`: Unlocks the user account.
  - `passwd -d <user>`: Deletes the password, leaving the account without a password (not recommended for regular users).
  
#### **Using `sudo` vs. `su`**

- **`sudo`:**
  - Ideal for **single administrative tasks**.
  - Safer for beginners since each command requires password confirmation.
  - Limits the exposure to root privileges.
  - Logs each action for auditing purposes.

- **`su`:**
  - Used to **switch entirely to the root account** or another user.
  - More convenient when multiple administrative tasks need to be performed.
  - Should be used cautiously since you remain in root mode until you manually exit.

#### **Configuring `sudo` Access:**

To control which users can use `sudo`, the system uses the `/etc/sudoers` file. It's important to edit this file carefully (preferably using the `visudo` command, which checks for syntax errors before saving).

Here’s an example of a line in the `/etc/sudoers` file:
```bash
username ALL=(ALL:ALL) ALL
```
This line grants the user `username` permission to run any command as any user on any machine.

#### **Granting `sudo` Access:**
To give a user `sudo` privileges, add them to the `sudo` group (on most distributions):
```bash
sudo usermod -aG sudo username
```
This adds `username` to the `sudo` group, allowing them to run commands with `sudo`.

---

### 3. **Security Best Practices for Root Access**

- **Minimize root usage:** Only use root privileges when absolutely necessary.
- **Use `sudo` instead of `su`:** `sudo` is safer because it limits the scope of root access and logs all commands.
- **Log out of root promptly:** If you use `su`, log out (with `exit`) once you're done with root tasks to avoid accidental system changes.
- **Use strong passwords:** Ensure both root and user accounts use strong, unique passwords.
- **Limit `sudo` privileges:** Only grant `sudo` access to trusted users, and restrict which commands they can run in `/etc/sudoers` if necessary.

---

## Running Commands Without Leaving a Trace

In Linux, there are times when you might want to run commands without leaving a trace in your **command history** for privacy or security reasons. By default, most shell environments, such as **Bash**, keep a record of all commands executed by the user. However, there are several ways to run commands without them being saved to the history file. 

### 1. **Using a Space Before the Command**

In **Bash**, one of the simplest ways to prevent a command from being recorded in the history is by **starting the command with a space**. This works if your `HISTCONTROL` environment variable includes the `ignorespace` setting.

#### Example:
```bash
  ls -l
```

In the above example, the leading space ensures that the `ls -l` command will not be recorded in the shell's history.

#### Setting `HISTCONTROL`:
To ensure this feature is enabled, you can check or set the `HISTCONTROL` variable in your shell:
```bash
export HISTCONTROL=ignorespace
```
You can also add this line to your `.bashrc` or `.bash_profile` to make it permanent.

Additionally, you can use the value `ignoreboth` to combine `ignorespace` and `ignoredups` (ignore duplicate commands):
```bash
export HISTCONTROL=ignoreboth
```

### 2. **Clearing Command History Immediately After Running a Command**

After running a command, you can clear the entire command history or delete the last entry to ensure it’s not recorded.

#### Clearing Entire History:
```bash
history -c
```
This command clears the entire history for the current session.

#### Deleting the Last Entry:
```bash
history -d $((HISTCMD-1))
```
This deletes the last command executed from the history. `$HISTCMD` refers to the number of the current command in the history, so subtracting `1` targets the previous command.

### 3. **Using `unset HISTFILE`**

The `HISTFILE` variable determines where the command history is saved (usually `~/.bash_history` in Bash). You can prevent the current session's commands from being written to the history file by **unsetting** the `HISTFILE` variable.

#### Example:
```bash
unset HISTFILE
```
After running this command, no commands in the current session will be saved to the history file, though they may still be retained in memory until the session ends.

### 4. **Setting `HISTSIZE` to 0**

Another method to avoid saving command history is to set the `HISTSIZE` variable to `0`. This will prevent the shell from keeping any history.

#### Example:
```bash
export HISTSIZE=0
```
With this setting, no command history is saved for the current session.

### 5. **Temporarily Disabling History Logging (`set +o history`)**

Bash provides a command to **temporarily disable** history logging within a session. Using `set +o history`, you can disable the recording of commands into history, and then re-enable it when needed with `set -o history`.

#### Example:
```bash
set +o history  # Disable history
ls -l
set -o history  # Enable history again
```
In this example, the `ls -l` command will not be recorded in the history.

### 6. **Using a Subshell to Run Commands**

You can also run commands in a **subshell**. Commands executed inside a subshell will not be added to the parent shell's history.

#### Example:
```bash
( ls -l )
```
The above command runs `ls -l` inside a subshell, so it won't be recorded in the history of the parent shell.

### 7. **Redirecting Output to `/dev/null`**

If you're concerned about logging command output or avoiding traces in log files, you can redirect the output of a command to `/dev/null`, which is a special device that discards all data written to it. This method does not directly affect the shell history, but it ensures no output is stored in any file.

#### Example:
```bash
ls -l > /dev/null 2>&1
```
This command redirects both the standard output (`>`) and standard error (`2>&1`) to `/dev/null`.

### 8. **Running a Command Without History in Zsh (`setopt NO_HIST_IGNORE_SPACE`)**

In **Zsh** (another popular shell), you can use a similar approach by setting the `NO_HIST_IGNORE_SPACE` option, which allows commands starting with a space not to be logged in the history.

#### Example:
```bash
setopt NO_HIST_IGNORE_SPACE
```
After setting this option, any command you execute with a leading space will not be saved to the history.

### 9. **Completely Disabling History for a Session**

You can **completely disable history** for an entire session by using the following command:
```bash
export HISTFILE=/dev/null
```
This sends the command history to `/dev/null`, effectively preventing it from being written to a file. Once the session ends, the history is gone forever.

### 10. **Modifying `~/.bashrc` or `~/.bash_profile` for Persistent Settings**

If you want to make these changes persistent across sessions, you can modify your `.bashrc` or `.bash_profile` file. For example, to always prevent commands starting with a space from being recorded, you could add the following line:
```bash
export HISTCONTROL=ignorespace
```
This ensures that any command prefixed with a space will not be saved in future sessions.

---

### **Best Practices for Running Commands Without a Trace**

1. **Use caution with these methods**: Running commands without leaving a trace can be useful for protecting sensitive information or performing temporary tasks, but it also makes it harder to track errors or diagnose issues later.
   
2. **Log critical administrative actions**: For system administrators, logging administrative actions is crucial for accountability and auditing. While it may be tempting to run commands without leaving a trace, always ensure critical actions are properly logged in secure environments.

3. **Consider other security measures**: If privacy and security are important, in addition to not leaving traces in history, also consider secure shell configurations, proper user permissions, encrypted communications, and secure log file handling.

## Terminals, Consoles, Shells and Commands

In Linux and other Unix-like systems, the terms **terminal**, **console**, **shell**, and **command** represent essential concepts for interacting with the operating system. Understanding the distinction between them will improve your proficiency in using and managing Linux systems.

---

### **1. Terminals**

A **terminal** (also known as a terminal emulator) is a software interface that allows users to interact with the shell through a text-based input/output environment. The terminal was originally a physical device (e.g., Teletype terminals) that enabled users to input text commands and receive text output from a computer system. Today, terminal emulators are software programs that replicate this functionality on modern machines.

#### Types of Terminals:

- **Physical Terminals (Consoles)**: Older computers used dedicated physical devices with keyboards and monitors. These are rarely seen today but were once the primary way to interact with Unix-based systems.
  
- **Virtual Terminals (TTY)**: Modern Linux systems have multiple virtual consoles (TTYs) that can be accessed by pressing `Ctrl + Alt + F1` to `Ctrl + Alt + F6`. These are purely text-based and don't require a graphical user interface (GUI).

- **Terminal Emulators**: These are programs that provide the terminal interface in graphical desktop environments. Some popular terminal emulators include:
  - **GNOME Terminal**
  - **Konsole**
  - **XTerm**
  - **Alacritty**
  - **Terminator**

#### Example:
To open a terminal in Ubuntu, you can press `Ctrl + Alt + T` or search for "Terminal" in the application menu.

---

### **2. Consoles**

A **console** is often used interchangeably with **terminal**, but it more specifically refers to the **physical or virtual device** used to interact with the computer. In older mainframes, the console was a physical device used to control the machine, and in modern Linux, **virtual consoles** (or **virtual terminals**) can be used when working outside of the GUI.

#### Example of Virtual Consoles:

- **Switching Between Virtual Consoles**:
  You can switch to a virtual console in most Linux distributions by using the following key combinations:
  - `Ctrl + Alt + F1` to `Ctrl + Alt + F6` – Switch to different TTYs (text-based terminals).
  - `Ctrl + Alt + F7` (or `F8`) – Switch back to the graphical desktop.

Each TTY allows you to log in and perform text-based operations, often useful for troubleshooting when the graphical desktop is not functioning properly.

---

### **3. Shells**

A **shell** is the command-line interpreter that provides a user interface for accessing the system’s services. It allows users to type commands that the shell translates into instructions the operating system can execute. While the terminal provides the interface for typing commands, the **shell** is the software that processes and executes those commands.

#### Common Shells in Linux:

- **Bash (Bourne Again Shell)**: The default and most widely used shell in Linux distributions. It provides features like scripting, history, tab completion, and more.
- **Zsh (Z Shell)**: A highly customizable shell that includes features similar to Bash but adds many powerful user-friendly capabilities like better autocompletion, spell correction, and theming.
- **Ksh (KornShell)**: Another powerful shell used primarily in Unix environments, known for its scripting capabilities.
- **Fish (Friendly Interactive Shell)**: Designed for ease of use, Fish includes interactive help, syntax highlighting, and robust auto-suggestions out of the box.
- **Dash**: A lightweight shell that is often used in minimal environments, such as scripts that require less overhead.

#### Example:
```bash
echo "Hello, World!"
```
This command runs in the **Bash** shell (or any other shell), which interprets the command and prints "Hello, World!" to the terminal.

---

### **4. Commands**

A **command** is an instruction given by the user, typically typed into the shell, for the operating system to perform a specific task. Commands can be standalone, or they can include options, arguments, and special characters to modify their behavior.

#### Command Structure:

```bash
command [options] [arguments]
```

- **Command**: The program or utility being executed (e.g., `ls`, `cp`, `mkdir`).
- **Options**: Modify the behavior of the command (e.g., `-l` for long listing in `ls`).
- **Arguments**: Specify the target for the command, such as a file or directory.

#### Example of a Basic Command:

```bash
ls -l /home/user/Documents
```

- `ls` is the command to list files and directories.
- `-l` is an option to display the list in long format (including permissions, size, and other details).
- `/home/user/Documents` is the argument specifying which directory to list.

Commands can be combined with special characters such as wildcards (`*`), pipes (`|`), redirection (`>`), and more to perform more advanced operations.

#### Wildcards:

- `*`: Matches any number of characters in a file name or directory.
- `?`: Matches exactly one character.

#### Example:
```bash
ls *.txt
```
Lists all files in the current directory that end with `.txt`.

#### Piping Commands:

Pipes (`|`) allow the output of one command to be used as the input of another command.

```bash
ls -l | grep "file"
```
The output of the `ls -l` command is piped to the `grep` command, which filters for lines containing the word "file."

#### Command Redirection:

- `>`: Redirects the output to a file (overwrites the file).
- `>>`: Appends the output to a file.
- `<`: Takes input from a file.

```bash
echo "Hello" > output.txt
```
This command writes "Hello" to the file `output.txt`, creating the file if it doesn't exist or overwriting it if it does.

---

### **5. Shell Scripting**

A **shell script** is a file that contains a series of commands executed by the shell. Scripts allow automation of repetitive tasks and provide a powerful way to combine commands and logic.

#### Example of a Simple Shell Script:

```bash
#!/bin/bash
echo "Hello, World!"
```

The first line (`#!/bin/bash`) specifies the interpreter for the script, and the second line prints "Hello, World!" to the terminal. The script can be saved to a file (e.g., `script.sh`), and then made executable:

```bash
chmod +x script.sh
./script.sh
```

---

### **6. Interacting with the Shell: Built-in vs External Commands**

Shell commands can be classified into two main categories:

- **Built-in Commands**: Commands that are part of the shell itself, such as `cd`, `exit`, `export`, and `alias`. These are not external programs, but rather internal functions of the shell.
  
- **External Commands**: These are commands that are not part of the shell but are executable files stored in the file system, such as `ls`, `cat`, `grep`, and `cp`.

#### Example of Built-in Command:
```bash
cd /home/user
```
This changes the current directory to `/home/user`. `cd` is built into the shell.

#### Example of External Command:
```bash
ls
```
The `ls` command is an external command that lists directory contents.

---