# Linux File System and Commands

# Table of Contents

- [Linux File System and Commands](#linux-file-system-and-commands)
- [Table of Contents](#table-of-contents)
  - [Absolute vs. Relative Paths](#absolute-vs-relative-paths)
  - [Walking through the File System (pwd, cd, tree)](#walking-through-the-file-system-pwd-cd-tree)
  - [Command Redirection (\>, 2\>, \&\>, cut, tee)](#command-redirection--2--cut-tee)
  - [Comparing Files (cmp, diff, sha256)](#comparing-files-cmp-diff-sha256)
  - [Compressing and Archiving Files and Directories (tar, gzip)](#compressing-and-archiving-files-and-directories-tar-gzip)
  - [Copying Files and Directories (cp)](#copying-files-and-directories-cp)
  - [Creating Files and Directories (touch, mkdir)](#creating-files-and-directories-touch-mkdir)
  - [File Types in Linux (ls -l, file)](#file-types-in-linux-ls--l-file)
  - [Find and Exec](#find-and-exec)
  - [Finding Files and Directories - Part 1 (locate, which)](#finding-files-and-directories---part-1-locate-which)
  - [Finding Files and Directories - Part 2 (find)](#finding-files-and-directories---part-2-find)
  - [Hard Links and the Inode Structure](#hard-links-and-the-inode-structure)
  - [Intro to The Linux File System](#intro-to-the-linux-file-system)
  - [Moving and Renaming Files and Directories (mv)](#moving-and-renaming-files-and-directories-mv)
  - [Removing Files and Directories (rm, shred)](#removing-files-and-directories-rm-shred)
  - [Searching for String Patterns in Text Files (grep)](#searching-for-string-patterns-in-text-files-grep)
  - [Searching for Strings in Binary Files (strings)](#searching-for-strings-in-binary-files-strings)
  - [Sorting Files by Timestamp](#sorting-files-by-timestamp)
  - [The Basics of VIM Text Editor](#the-basics-of-vim-text-editor)
  - [The Filesystem Hierarchy Standard (FHS)](#the-filesystem-hierarchy-standard-fhs)
  - [The LS Command In Depth (ls)](#the-ls-command-in-depth-ls)
  - [The VIM Editor In Depth - Part 1](#the-vim-editor-in-depth---part-1)
  - [The VIM Editor In Depth - Part 2](#the-vim-editor-in-depth---part-2)
  - [Understanding File Timestamps (atime, mtime, ctime, stat, touch, date)](#understanding-file-timestamps-atime-mtime-ctime-stat-touch-date)
  - [Viewing Files - Part 1 (cat)](#viewing-files---part-1-cat)
  - [Viewing Files - Part 2 (less, more)](#viewing-files---part-2-less-more)
  - [Viewing Files - Part 3 (tail, head, watch)](#viewing-files---part-3-tail-head-watch)
  - [Working With Pipes in Linux (|, wc)](#working-with-pipes-in-linux--wc)
  - [Working With Symlinks (Symlinks vs. Hard Links)](#working-with-symlinks-symlinks-vs-hard-links)

---

## Absolute vs. Relative Paths

- **Absolute Path**: A path that starts from the root directory (`/`). Example: `/home/user/Documents/file.txt`.
- **Relative Path**: A path that starts from the current directory. Example: `Documents/file.txt`.

---

## Walking through the File System (pwd, cd, tree)

- **pwd**: Print the current working directory.
  ```bash
  pwd
  ```
- **cd**: Change the current directory.
  ```bash
  cd /home/user/Documents
  ```
- **tree**: Display directory structure in a tree-like format.
  ```bash
  tree /home/user
  ```

---

## Command Redirection (>, 2>, &>, cut, tee)

- **>**: Redirect standard output to a file.
  ```bash
  echo "Hello" > output.txt
  ```
- **2>**: Redirect standard error to a file.
  ```bash
  ls /nonexistent 2> error.txt
  ```
- **&>**: Redirect both standard output and error to a file.
  ```bash
  ls /nonexistent &> output_and_error.txt
  ```
- **cut**: Extract specific columns or fields from a file.
  ```bash
  cut -d: -f1 /etc/passwd
  ```
- **tee**: Redirect output to a file and display it on the screen.
  ```bash
  echo "Hello" | tee output.txt
  ```

---

## Comparing Files (cmp, diff, sha256)

- **cmp**: Compare two files byte by byte.
  ```bash
  cmp file1.txt file2.txt
  ```
- **diff**: Compare two files line by line.
  ```bash
  diff file1.txt file2.txt
  ```
- **sha256**: Generate a SHA-256 checksum for a file.
  ```bash
  sha256sum file.txt
  ```

---

## Compressing and Archiving Files and Directories (tar, gzip)

- **tar**: Archive files and directories.
  ```bash
  tar -cvf archive.tar /home/user/Documents
  ```
- **gzip**: Compress files.
  ```bash
  gzip file.txt
  ```

---

## Copying Files and Directories (cp)

- **cp**: Copy files or directories.
  ```bash
  cp file1.txt file2.txt
  cp -r dir1 dir2
  ```

---

## Creating Files and Directories (touch, mkdir)

- **touch**: Create an empty file or update the timestamp of an existing file.
  ```bash
  touch file.txt
  ```
- **mkdir**: Create a new directory.
  ```bash
  mkdir new_directory
  ```

---

## File Types in Linux (ls -l, file)

- **ls -l**: List files with detailed information, including file types.
  ```bash
  ls -l /home/user
  ```
- **file**: Determine the type of a file.
  ```bash
  file file.txt
  ```

---

## Find and Exec

- **find**: Search for files and directories and execute commands on them.
  ```bash
  find /home/user -name "*.txt" -exec rm {} \;
  ```

---

## Finding Files and Directories - Part 1 (locate, which)

- **locate**: Find files by name using a pre-built database.
  ```bash
  locate file.txt
  ```
- **which**: Locate the executable file associated with a command.
  ```bash
  which ls
  ```

---

## Finding Files and Directories - Part 2 (find)

- **find**: Search for files and directories based on various criteria.
  ```bash
  find /home/user -name "*.txt"
  ```

---

## Hard Links and the Inode Structure

- **Hard Links**: Multiple directory entries pointing to the same inode.
  ```bash
  ln file1.txt file2.txt
  ```
- **Inode**: A data structure that stores metadata about a file.

---

## Intro to The Linux File System

- The Linux file system is a hierarchical structure starting from the root directory (`/`).
- Common directories include `/home`, `/etc`, `/var`, and `/usr`.

---

## Moving and Renaming Files and Directories (mv)

- **mv**: Move or rename files and directories.
  ```bash
  mv file1.txt file2.txt
  mv dir1 dir2
  ```

---

## Removing Files and Directories (rm, shred)

- **rm**: Remove files or directories.
  ```bash
  rm file.txt
  rm -r dir
  ```
- **shred**: Securely delete files by overwriting them.
  ```bash
  shred -u file.txt
  ```

---

## Searching for String Patterns in Text Files (grep)

- **grep**: Search for patterns in text files.
  ```bash
  grep "pattern" file.txt
  ```

---

## Searching for Strings in Binary Files (strings)

- **strings**: Extract printable strings from binary files.
  ```bash
  strings binary_file
  ```

---

## Sorting Files by Timestamp

- **ls -lt**: List files sorted by modification time.
  ```bash
  ls -lt /home/user
  ```

---

## The Basics of VIM Text Editor

- **VIM**: A powerful text editor with multiple modes (Normal, Insert, Visual).
  ```bash
  vim file.txt
  ```

---

## The Filesystem Hierarchy Standard (FHS)

- **FHS**: A standard that defines the directory structure in Linux.
- Common directories include `/bin`, `/etc`, `/home`, `/var`, and `/usr`.

---

## The LS Command In Depth (ls)

- **ls**: List files and directories.
  ```bash
  ls -l /home/user
  ```

---

## The VIM Editor In Depth - Part 1

- **VIM**: Advanced usage, including navigation, editing, and saving files.

---

## The VIM Editor In Depth - Part 2

- **VIM**: More advanced features like macros, plugins, and customization.

---

## Understanding File Timestamps (atime, mtime, ctime, stat, touch, date)

- **atime**: Last access time.
- **mtime**: Last modification time.
- **ctime**: Last status change time.
- **stat**: Display file timestamps.
  ```bash
  stat file.txt
  ```
- **touch**: Update file timestamps.
  ```bash
  touch file.txt
  ```
- **date**: Display or set the system date and time.
  ```bash
  date
  ```

---

## Viewing Files - Part 1 (cat)

- **cat**: Display the contents of a file.
  ```bash
  cat file.txt
  ```

---

## Viewing Files - Part 2 (less, more)

- **less**: View file contents interactively.
  ```bash
  less file.txt
  ```
- **more**: View file contents page by page.
  ```bash
  more file.txt
  ```

---

## Viewing Files - Part 3 (tail, head, watch)

- **tail**: Display the last part of a file.
  ```bash
  tail file.txt
  ```
- **head**: Display the first part of a file.
  ```bash
  head file.txt
  ```
- **watch**: Execute a command repeatedly and display the output.
  ```bash
  watch -n 1 ls -l
  ```

---

## Working With Pipes in Linux (|, wc)

- **|**: Pipe the output of one command as input to another.
  ```bash
  ls -l | grep "file"
  ```
- **wc**: Count lines, words, and characters in a file.
  ```bash
  wc file.txt
  ```

---

## Working With Symlinks (Symlinks vs. Hard Links)

- **Symlinks**: A symbolic link (symlink) is a pointer to another file or directory.
  ```bash
  ln -s file1.txt symlink.txt
  ```
- **Hard Links**: Multiple directory entries pointing to the same inode.
  ```bash
  ln file1.txt file2.txt
  ```

---