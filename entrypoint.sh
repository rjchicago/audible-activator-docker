#!/usr/bin/env sh

echo && echo "STARTING APP..." && echo

if [ -z "$U" ] ; then
    read -p "Username: " U
else
    echo "Username: $U" 
fi

if [ -z "$P" ] ; then
    read -s -p "Password: " P && echo "******"
fi

echo $PATH
./audible-activator.py --username=$U --password=$P
