#!/bin/bash

logfile=/vagrant/initslave-$HOSTNAME.log

echo "Starting init script on server $HOSTNAME" >> $logfile

if [ -e /vagrant/id_rsa.pub ]
then
	echo $USERNAME >> $logfile
	if [ ! -e $HOME/.ssh/id_rsa_vagrant.pub ]
	then
		echo "Copy the public vagrand RSA key file" >> $logfile
		cp /vagrant/id_rsa.pub $HOME/.ssh/id_rsa_vagrant.pub
		cat $HOME/.ssh/id_rsa_vagrant.pub >> $HOME/.ssh/authorized_keys
                echo "192.168.0.1 mngmntsrv" | sudo tee -a /etc/hosts
	fi
fi

