#Demo Env for AppCatalyst + Vagrant within Fusion on a Mac : Owncloud and MySQL in a minute

#1. What is it?

It's a demo Env for AppCatalyst, the minimal and free Mac OS Hypervisor for developer.
AppCatalyst is a solution for DevOps and Cloud Native Apps for more flexibility and speed of development. It's really simple and quick to setup and environment and start to write lines of code. No need and no pain to install linux boxes and setup docker. Fully automated and reachable through CLI and REST API.


#2. AppCatalyst and Vagrant Installation

See the excellent blog : http://www.virtuallyghetto.com/2015/06/quickly-getting-started-with-vmware-appcatalyst-appcatalyst-vagrant-plugin.html


#3. Build en Env

. ./env.sh
./vagrantup.sh


#4. What to see?

- How to list VM
vagrant status
appcatalyst vmpower list

- How to get connected to PhotonOS
ssh -i /opt/vmware/appcatalyst/etc/appcatalyst_insecure_ssh_key photon@172.16.4.129
vagrant ssh pos-1

- How to see all API
http://localhost:8080

- How to list @IP
curl http://localhost:8080/api/vms
["vagrant-25be349e-8ef4-44ef-ae3a-b445a5cfff7d","vagrant-db787329-5553-4df1-b8a1-d420b137b8bc"]
curl http://localhost:8080/api/vms/vagrant-25be349e-8ef4-44ef-ae3a-b445a5cfff7d/ipaddress

- How to destroy the env
vagrant destroy -f



Brice Dereims | bdereims@vmware.com | @bdereims
