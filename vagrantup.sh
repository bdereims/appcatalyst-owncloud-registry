# $1 : ip address of registry

if [ "X$1" == "X" ]; then
	echo "Registry IP server missing."
	exit 1
fi

cat docker.service-tmp | sed -e "s/####/$1/" > docker.service
cat bootstrap.sh-tmp | sed -e "s/####/$1/" > bootstrap.sh

vagrant up --provider=vmware_appcatalyst
