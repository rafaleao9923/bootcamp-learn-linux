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
## root vs. non-Privileged Users
## Running Commands Without Leaving a Trace
## Terminals, Consoles, Shells and Commands