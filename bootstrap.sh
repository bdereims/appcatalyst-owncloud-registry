#!/bin/bash

_getip() {
	echo $(sudo su - -c "ifconfig eth0" | grep 'inet addr:' | cut -d: -f2 | cut -d' ' -f1) 	
}

_waitproc() {
	while [ "X$(pgrep $1)" == "X" ] 
	do
		echo "Waiting for $1"
		sleep 1	
	done
}

MYIP=$(_getip)
REGISTRY="172.16.41.137"

echo "I'm $HOSTNAME on $MYIP."
echo $MYIP > "IP-$HOSTNAME"

sudo su -c "cp /vagrant/docker.service /lib/systemd/system/docker.service"
sudo su -c "systemctl start docker"
sleep 5
_waitproc docker 

DATADIR="/tmp/data"
mkdir -p $DATADIR

case $HOSTNAME in
"pos-1") 
	echo "- Owncloud Container Install." 
	chown -R 33:33 $DATADIR
	chmod -R 0770 $DATADIR
	docker run -d -p 80:80 -p 443:443 -v $DATADIR:/var/www/owncloud/data $REGISTRY:5000/owncloud
	;;
"pos-2") 
	echo "- MySQL Container Install." 
	docker run -d -p 3306:3306 -p 8081:80 -v $DATADIR:/var/lib/mysql $REGISTRY:5000/mysql-phpmyadmin
	;;
*)
	echo "Nothing more to do"
esac

rm "IP-$HOSTNAME"

exit 0
