#!/bin/bash

# Set up a default search path.
PATH="/sbin:/usr/sbin:/bin:/usr/bin"
export PATH
 
curl -O http://mirror.switch.ch/ftp/mirror/epel/epel-release-latest-7.noarch.rpm
curl -O https://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
yum -y localinstall epel-release-latest-7.noarch.rpm zabbix-release-3.0-1.el7.noarch.rpm
yum -y update
yum -y install open-vm-tools htop vim zabbix-agent net-tools
systemctl start vmtoolsd
systemctl enable vmtoolsd
systemctl start zabbix-agent
systemctl enable zabbix-agent
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
