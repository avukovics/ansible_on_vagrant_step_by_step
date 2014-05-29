#!/bin/sh
#!/bin/bash

logfile=/vagrant/initserver-$HOSTNAME.log
echo "Starting init script on server $HOSTNAME" >> $logfile

sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum -y install ansible



if [ ! -e /vagrant/id_rsa.pub ]
then
	echo $USERNAME >> $logfile
	ssh-keygen -N '' -f $HOME/.ssh/id_rsa #>> $logfile
	cp $HOME/.ssh/id_rsa.pub /vagrant/
        echo "192.168.0.2 devsrv" | sudo tee -a /etc/hosts
fi

