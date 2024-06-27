# Cpp Builder v1.0 🛠️
## Description  🚩
 - This tool is a simple, easy to use c++ program compiling CLI.
 - It depends on g++, no new inventions just process automation.
 - The purpose of creating such tool is to help linux beginner to find a fast solution to run cpp files on terminal, so they can focus on cpp program functionality itself.
 - It solves the issues in the way vscode deals with cpp by default, like vscode output console does not accept any type of input.
## Usage 📃
- First run the `setup.sh` as root to install the command globally and check up the dependencies:
  &emsp;
  ```bash
  chmod +x setup.sh
  sudo ./setup.sh`
  ```
- Then after the script is done successfully, you can try:
  ```
    runcw [filename without extension]
  
  ```
  and your cpp program should start to be building and running, and you'll get the execution duration time in milliseconds.
  ## Note 📝
  - This version of the script was originally made to replace the cpp execution instructions in code runner extenstion executor map json.
  which you can access by going to `File > Extenstions > code runner > settings > executor map ` and replace the value for the key `cpp` with ` runcw $fileNameWithoutExtenstion`.
  - You know, while normal people commit mistakes, devs commit buggy codes. So if you have an issue,just open a one:
     [![Report Issue](https://img.shields.io/badge/Report%20Issue-black?style=for-the-badge&logo=github)](https://github.com/w4rdr43w4n/cpp-shell-builder/issues/new)

