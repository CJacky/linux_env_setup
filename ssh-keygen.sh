#!/bin/bash

case $# in
	2)
		user=$1
		host=$2
		port=22
	;;
	3)
		user=$1
		host=$2
		port=$3
	;;
	*)
		echo "$0 <user name> <host ip> [port]"
		exit 0
	;;
esac

echo "*************************************************************************"
echo "ssh keygen to $user@$host, port $port"
echo "*************************************************************************"

if [ ! -f ~/.ssh/id_rsa.pub ]; then 
	ssh-keygen -t rsa
fi
ssh-add
ssh-copy-id -i ~/.ssh/id_rsa.pub $user@$host -p $port
