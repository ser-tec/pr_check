# Odoo-pr-check
This bash script allows you to see which OCA modules have been officially released versus unofficial ones.
The script simply compares the contents of two folders and notifies on screen and by mail (if set) the common folders with the same name.

## Structure:
* PR folder -> is where unofficial modules and temporary patches are stored
* OCA folder -> is where the official modules and final patches are stored

## Installation
```
$ git clone https://github.com/ser-tec/pr_check.git
$ cd pr_check
$ sudo chmod u+x *.sh
$ cp pr_check.example.conf pr_check.conf
```
## Settings
Define your own parameters pr_check.conf
```
$ nano update.conf
```
## Execution
It can be execute manual or automaticaly.
To run the script whenever the contents of the OCA directory change use the inotifywait program, which is part of the inotify-tools package.
inotifywait monitors changes to directories and files, taking action when it detects a specific event.

### Manual
```
$ ./path-pr-check/pr_check.sh 
```
### Automatically
This script runs in an infinite loop (while true). Use inotifywait to recursively monitor the OCA directory for create, delete, move and modify events. When it detects one of these events, it runs your main script.
```
$ sudo apt-get install inotify-tools
$ chmod +x /path/to/your/auto_pr_check.sh 
$ ./path-pr-check/auto_pr_check.sh
```
You can also add auto_pr_check script to autorun so that it starts every time your system boots.
The method to do this depends on your operating system and the shell you use.
```
$ sudo nano /etc/systemd/system/pr_check.service
```
$ Put the following content into the file, replacing /path/to/your/auto_pr_check.sh with the absolute path to your script:
```
[Unit]
Description=Odoo-pr-check

[Service]
ExecStart=/bin/bash /path/to/your/auto_pr_check.sh
Restart=always

[Install]
WantedBy=multi-user.target
```
Save the file and close the editor.
Reload the systemd daemons to get your new service loaded:
```
$ sudo systemctl daemon-reload
```
Enable the service to start automatically on boot:
```
$ sudo systemctl enable pr_check.service
```
The script will run automatically on system startup.
