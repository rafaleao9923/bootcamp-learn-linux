# The Linux Terminal in Depth

# Table of Contents

- [The Linux Terminal in Depth](#the-linux-terminal-in-depth)
- [Table of Contents](#table-of-contents)
  - [Getting Help, Man Pages (man, type, help, apropos)](#getting-help-man-pages-man-type-help-apropos)
  - [Linux Command Structure](#linux-command-structure)
  - [Mastering the Terminal - Keyboard Shortcuts](#mastering-the-terminal---keyboard-shortcuts)
    - [Navigation Shortcuts](#navigation-shortcuts)
    - [Text Manipulation Shortcuts](#text-manipulation-shortcuts)
    - [Command History Shortcuts](#command-history-shortcuts)
    - [Terminal Multiplexer (tmux) Shortcuts](#terminal-multiplexer-tmux-shortcuts)
    - [Copy-Paste Shortcuts](#copy-paste-shortcuts)
  - [Mastering the Terminal - The TAB Key](#mastering-the-terminal---the-tab-key)
    - [Auto-Completion](#auto-completion)
    - [Auto-Completion for Commands](#auto-completion-for-commands)
    - [Auto-Completion for File and Directory Paths](#auto-completion-for-file-and-directory-paths)
    - [Auto-Completion for Filenames with Spaces](#auto-completion-for-filenames-with-spaces)
    - [Listing Available Options](#listing-available-options)
    - [Auto-Completion for Command Options](#auto-completion-for-command-options)
    - [Auto-Completion for Variable Names](#auto-completion-for-variable-names)
    - [Auto-Completion for Environment Variables](#auto-completion-for-environment-variables)
    - [Command Substitution](#command-substitution)
    - [File and Directory Listing](#file-and-directory-listing)
    - [Tips](#tips)
  - [Recording the Date and Time for Each Line in History](#recording-the-date-and-time-for-each-line-in-history)
    - [Enabling Timestamps for History Entries](#enabling-timestamps-for-history-entries)
      - [Example:](#example)
    - [Making the Configuration Persistent](#making-the-configuration-persistent)
    - [Using Timestamps with `history` Command](#using-timestamps-with-history-command)
    - [Formatting and Customization](#formatting-and-customization)
    - [Caveats and Tips](#caveats-and-tips)
      - [**History File (`.bash_history`)**](#history-file-bash_history)
      - [**Appending to History Across Sessions**](#appending-to-history-across-sessions)
      - [**Limiting History Size**](#limiting-history-size)
    - [Example: Combining Timestamp and History Control](#example-combining-timestamp-and-history-control)
    - [Viewing Timestamped History in `.bash_history`](#viewing-timestamped-history-in-bash_history)
  - [root vs. non-Privileged Users. Getting root Access (sudo, su, passwd)](#root-vs-non-privileged-users-getting-root-access-sudo-su-passwd)
    - [Root User vs. Non-Privileged Users](#root-user-vs-non-privileged-users)
      - [**Root User:**](#root-user)
      - [**Non-Privileged Users:**](#non-privileged-users)
    - [Getting Root Access](#getting-root-access)
      - [**2.1 `sudo` (Superuser Do)**](#21-sudo-superuser-do)

---

## Getting Help, Man Pages (man, type, help, apropos)

- **man**: This command is short for "manual". It provides detailed manual pages for other commands. For example, `man ls` will provide a detailed manual for the `ls` command. It's a comprehensive source of information, but can be overwhelming for beginners.

- **type**: This command is used to describe how its argument would be interpreted if used as a command. It can tell you whether a command is built-in, an alias, a file, a function, etc. For example, `type ls` might output "ls is aliased to ls --color=auto", indicating that `ls` is an alias.

- **help**: This command is used to get a short description of a built-in command. It's less comprehensive than `man`, but can be easier to understand for beginners. For example, `help cd` will provide a short description of the `cd` command.

- **apropos**: This command is used to search the man page descriptions for instances of a keyword. It's useful when you know what you want to do, but you don't know the command. For example, `apropos copy` will list all commands that have the word "copy" in their description.

---

## Linux Command Structure

```bash
command [options] [arguments]
```

1. **Command**: The actual executable or script that performs a specific operation. For example, `ls`, `cp`, `mkdir`, etc.
2. **Options**: Modify the behavior of the command. They are preceded by a hyphen (`-`) or a double hyphen (`--`). For example, `-l` (list in long format) or `--help` (display help information).
3. **Arguments**: The targets or inputs for the command. They can be file names, directories, or other data that the command needs to operate on. For example, `file.txt` or `~/Documents`.

---

## Mastering the Terminal - Keyboard Shortcuts

### Navigation Shortcuts

- **Ctrl + A**: Move to the beginning of the line.
- **Ctrl + E**: Move to the end of the line.
- **Ctrl + U**: Delete from the cursor to the beginning of the line.
- **Ctrl + K**: Delete from the cursor to the end of the line.
- **Ctrl + W**: Delete the word before the cursor.
- **Ctrl + L**: Clear the terminal screen.
- **Ctrl + R**: Search command history (reverse search).
- **Ctrl + S**: Stop output to the screen (used to pause terminal output).
- **Ctrl + C**: Terminate the current command.
- **Ctrl + D**: Log out of the current session (or end input for some commands).
- **Ctrl + Z**: Suspend the current process (move it to the background).

### Text Manipulation Shortcuts

- **Ctrl + Y**: Paste the most recently cut text.
- **Alt + D**: Delete the word after the cursor.
- **Alt + Backspace**: Delete the word before the cursor.

### Command History Shortcuts

- **Up Arrow or Ctrl + P**: Move to the previous command in history.
- **Down Arrow or Ctrl + N**: Move to the next command in history.
- **Ctrl + R**: Search backward through the command history.
- **Ctrl + G**: Escape from history searching mode.
- **!!**: Repeat the last command.
- **!n**: Repeat the nth command in history.

### Terminal Multiplexer (tmux) Shortcuts

- **Ctrl + B, %**: Split the terminal vertically.
- **Ctrl + B, "**: Split the terminal horizontally.
- **Ctrl + B, Arrow keys**: Navigate between panes.
- **Ctrl + B, c**: Create a new window.
- **Ctrl + B, n**: Move to the next window.
- **Ctrl + B, p**: Move to the previous window.
- **Ctrl + B, d**: Detach from the current session.

### Copy-Paste Shortcuts

- **Ctrl + Shift + C**: Copy selected text.
- **Ctrl + Shift + V**: Paste copied text.

---

## Mastering the Terminal - The TAB Key

### Auto-Completion

- Pressing `TAB` after typing a partial command, file, or directory name will attempt to complete the entry based on the available options.

### Auto-Completion for Commands

- Pressing `TAB` after typing a partial command will attempt to complete it, helping you avoid typing the full command.

### Auto-Completion for File and Directory Paths

- Auto-completion works for file and directory paths, making it easier to navigate the filesystem.

### Auto-Completion for Filenames with Spaces

- If a filename contains spaces, the `TAB` key will automatically escape the spaces, allowing you to continue typing.

### Listing Available Options

- Pressing `TAB` twice after a partial entry will display a list of available options, helping you choose from the available matches.

### Auto-Completion for Command Options

- When typing command options, pressing `TAB` will auto-complete the option if there is a unique match.

### Auto-Completion for Variable Names

- In some shells, pressing `TAB` can auto-complete variable names.

### Auto-Completion for Environment Variables

- Environment variables can be auto-completed by pressing `TAB` after the `$` symbol.

### Command Substitution

- When using command substitution with `$(...)`, pressing `TAB` can auto-complete the command within the substitution.

### File and Directory Listing

- Pressing `TAB` after a command that expects a file or directory as an argument will list available options.

### Tips

- **Double-Tap TAB**: Double-tapping `TAB` will show a list of available options if there are multiple matches.
- **Cycle Through Options**: If there are multiple matches, pressing `TAB` multiple times will cycle through the available options.
- **Case Sensitivity**: `TAB` key completion is case-sensitive. Be aware of the case when using it.
- **Customization**: The behavior of `TAB` completion can be customized using shell options and configuration files, such as `.bashrc` or `.bash_profile`.

---

## Recording the Date and Time for Each Line in History

### Enabling Timestamps for History Entries

To store timestamps with each command in your history, you can set the `HISTTIMEFORMAT` variable. This tells Bash to record the date and time along with each command.

#### Example:
```bash
export HISTTIMEFORMAT="%F %T "
```

- `%F` will format the date as `YYYY-MM-DD`.
- `%T` will format the time as `HH:MM:SS`.

### Making the Configuration Persistent

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

### Using Timestamps with `history` Command

After enabling timestamps, you can use the `history` command to see commands along with the recorded date and time:
```bash
history
```

You can also specify a range of history entries:
```bash
history 10
# Shows the last 10 commands along with timestamps.
```

### Formatting and Customization

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

### Caveats and Tips

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

### Example: Combining Timestamp and History Control

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

### Viewing Timestamped History in `.bash_history`

While timestamps are not stored directly in the `.bash_history` file by default, you can modify Bash to save them by configuring the file itself. This is not recommended for general use because it will make `.bash_history` less readable, but it can be done by writing your own custom solution to parse and store both commands and timestamps in a custom log.

---

## root vs. non-Privileged Users. Getting root Access (sudo, su, passwd)

In Linux, there are two primary types of user accounts: **root** (the superuser) and **non-privileged users** (regular users). The root user has full control over the system, whereas non-privileged users have limited permissions.

### Root User vs. Non-Privileged Users

#### **Root User:**
- The root user is the **superuser** in Linux, with **unrestricted access** to all system files, configurations, and commands.
- The root user can perform any operation, such as installing software, modifying system files, creating or deleting users, and changing file permissions.
- The root user account should be used with caution, as it can directly affect the system's functionality. A small mistake can potentially break the system.

#### **Non-Privileged Users:**
- Non-privileged (regular) users have limited access to the system, primarily restricted to their own files and certain parts of the system.
- Regular users can read files from most system directories, but they cannot modify system files or execute administrative commands.
- Non-privileged users cannot install software, change network settings, or perform other administrative tasks without elevating their privileges.

The separation of these roles helps protect the system from accidental changes or malicious attacks. Regular users can work in their own space without the risk of compromising the entire system.

### Getting Root Access

In most Linux distributions, it's rare to log in as the root user directly. Instead, users elevate their privileges only when necessary, typically by using commands like `sudo` or `su`. This limits the risk of accidental damage while still allowing administrative tasks when needed.

#### **2.1 `sudo` (Superuser Do)**

The `sudo` command allows a permitted user to **run specific commands as the root user** (or another user, depending on the configuration) without logging in as root. 

- **How `sudo` Works:**
  - When you run a command pref