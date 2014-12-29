chef-knife-scripts
==================
My knife scripts for various tasks.

Requirements
==================
- Bash, Chef Workstation.
- Many scripts require a new line delimited file called "hostlist" to parse.
- These scripts require a valid user account on the remote host for knife ssh.

Usage
==================
1. Create a file called "hostlist"
2. Add hosts you want to use these scripts for into the "hostlist" file, new line delimited.
3. Execute your desired script:
 - eg: ./bootstrap.sh
