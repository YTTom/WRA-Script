#/bin/bash


#### Create Directory ####
mkdir agent_deb
cd agent_deb

#### Download source files ####
wget http://archive.ubuntu.com/ubuntu/pool/universe/q/qemu/qemu-guest-agent_3.1+dfsg-2ubuntu3_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/i/init-system-helpers/init-system-helpers_1.56+nmu1_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc-bin_2.29-0ubuntu2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/locales_2.29-0ubuntu2_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.29-0ubuntu2_amd64.deb

#### Install source files ####
dpkg -i libc-bin_2.29-0ubuntu2_amd64.deb
dpkg -i locales_2.29-0ubuntu2_all.deb
dpkg -i libc6_2.29-0ubuntu2_amd64.deb
dpkg -i init-system-helpers_1.56+nmu1_all.deb
dpkg -i qemu-guest-agent_3.1+dfsg-2ubuntu3_amd64.deb

#### Restart qemu-guest-agent service ####
service qemu-guest-agent restart

#### Check service status ####
if [[ $(service qemu-guest-agent status | grep running) ]];
then
    echo 'Qemu-guest-agent installed sucessfully!!'
    dpkg -l | grep qemu-guest-agent
else
    echo 'Qemu-guest-agent is not active...'
fi
