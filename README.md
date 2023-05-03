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
```
$ sudo apt-get install inotify-tools
```
