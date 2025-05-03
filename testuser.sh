#!/bin/bash

<<user
get uname and pass from
argument
user

sudo useradd $1
echo -e "$2\n$2" |sudo passwd $1

echo "User created $1"
echo "Deleting user $1.."

sudo userdel $1
echo "User deleted successfully"

echo "Checking if user exist"

check=$(cat /etc/passwd | grep $1 | wc | awk '{print $1}')

if [ $check == 0 ]
then
	echo "User dne"
else
	echo "User exist"
fi
