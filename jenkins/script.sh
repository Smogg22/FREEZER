#!/bin/bash

if ! [ -e /var/jenkins_home/$1 ]
then
	echo "Can't find ssh private key for jenkins"
	exit 1
fi

sed -i 's/${SSH_PRIVATE_KEY}/'"$1"'/g' /var/jenkins_home/casc.yaml
