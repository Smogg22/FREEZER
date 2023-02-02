#!/bin/bash

ssh-keygen -f jenkins_rsa -q -N ""
echo SSH_PRIVATE_KEY=\"$(cat jenkins_rsa)\" > .env
cp jenkins_rsa jenkins/jenkins_rsa
cp jenkins_rsa agent_ssh/jenkins_rsa
cp jenkins_rsa.pub agent_ssh/jenkins_rsa.pub

ssh-keygen -e -f jenkins_rsa.pub > proftpd/jenkins_rsa.pub

docker-compose up --build

