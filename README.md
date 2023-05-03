# Odoo-pr-check
this bash script allows you to see which OCA modules have been officially released versus unofficial ones.
Structure:
PR folder -> is where unofficial modules and temporary patches are stored
OCA folder -> is where the official modules and final patches are stored
The script simply compares the contents of the two folders and notifies on screen and by mail (if set) the common folders with the same name.

It can be execute manual or scheduled control.
The ideal would be to connect it with the set of scripts "odoo-autoupdate" https://github.com/ser-tec/odoo-autoupdate.git in order to check for new releases at each OCA update
