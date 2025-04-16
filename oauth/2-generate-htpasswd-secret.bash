#!/usr/bin/bash

# remove file if it exists
rm -f ./htpasswd || true

# create the file and add the admin user
htpasswd -c -B -b ./htpasswd admin password

# update the file and add user1
htpasswd -B -b ./htpasswd user1 password