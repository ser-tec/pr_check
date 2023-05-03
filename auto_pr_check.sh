#!/bin/bash

# Import the configuration file
. pr_check.conf

dir=$(dirname $0)
cd $dir

while true; do
    inotifywait -r -e create,delete,move,modify --exclude '\.sw.' "$OCA"
    bash "pr_check.sh"
done
