#!/bin/bash

echo -e "This script will syncronize source folder in this computer to a location in remote computer(workstation). It will remove files which is already in remote computer, but not in local computer. "

read -r -p "Are you absolutely sure you want to continue? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "Starting sync......"
    sleep 1
else
    exit 1
fi

rsync -avzhe ssh --delete --include 'src/' --exclude '*~' --progress /home/$USER/catkin_ws/src longfei@10.70.154.142:/home/longfei/catkin_ws/
