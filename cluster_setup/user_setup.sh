#!/bin/bash
## script to create 40 users called testXX with a default password
## and setup up ssh logins without asking for passwords & host checking

n=40
for i in `seq -w 1 ${n}`
do
  echo $i;

  ## create n new user called testXX and create default password
  adduser --gecos "" --disabled-password test${i}
  echo test${i}:SoftwareC | chpasswd

  ## create somewhere to store ssh configuration
  mkdir -p /home/test${i}/.ssh
  echo 'Host *\n  StrictHostKeyChecking no\n  ForwardX11 yes' > /home/test${i}/.ssh/config

  ## generate a ssh key & copy to the list of authorized keys
  ssh-keygen -f /home/test${i}/.ssh/id_rsa -t rsa -N ''
  cp /home/test${i}/.ssh/id_rsa.pub /home/test${i}/.ssh/authorized_keys

  ## set new user as owner
  chown -R test${i}:test${i} /home/test${i}/.ssh
  chmod 600 /home/test${i}/.ssh/config

done
