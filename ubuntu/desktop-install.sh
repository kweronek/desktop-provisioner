#!/bin/bash

####### install ubuntu Desktop-Machine on premise
pwd
mkdir -pv $HOME/Downloads
sudo mkdir -pv /root/Downloads
sudo chmod 775 /root/Downloads

####### Package Manager update
sudo apt update
sudo apt-get update

# add . to PATH
echo "export PATH=$PATH:." >> $HOME/.profile
source $HOME/.profile

###### install Gnome desktop when not already installed
DIR=/etc/gnome
if [ -d  "$DIR" ];then
  echo "Gnome is already installed."
else
  sudo apt install -y tasksel
  sudo tasksel install ubuntu-desktop
  sudo reboot
fi

####### install dev tools and utils
apt-get install zip unzip -qy
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y pkg-config
sudo apt install -y libseccomp-dev
sudo apt install -y make
sudo apt install -y build-essential

####### install programming langubaes
# python is installed by default on Ubuntu 20.04 LTS
# install GCC
sudo apt install -y binutils

# install Go
sudo snap install go --classic
echo "export GOPATH=~/Public/ws/go" >> $HOME/.profile
mkdir -pv $HOME/Public/ws/go/{src,bin,pkg}

# install Java openjdk
sudo apt install -y openjdk-14-jdk

# install Protocol Buffers
sudo snap install protobuf --classic

# install Multipass
sudo snap install multipass

####### install container technologies
# install Docker
sudo snap install docker

# install different CLIs
sudo snap install kubectl --classic
sudo snap install kubeadm --classic
sudo snap install aws-cli --classic
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo snap install google-cloud-sdk --classic

# install microk8s
snap install microk8s --classic

# install rancher k3s
curl -sfL https://get.k3s.io | sh -

# install rancher k3d
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# install rancher k3c
cd $HOME/Downloads
git clone https://github.com/rancher/k3c
cd k3c
sudo make build
#./bin/k3c daemon --group=$(id -g) &

# install fluxctl
sudo snap install fluxctl --classic

####### install IaaS-technologies
# install Terraform
cd $HOME/Downloads
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip
unzip terraform_${TER_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# install Ansible
sudo apt install -y ansible

# install HELM
sudo snap install helm --classic

# install command line tools
sudo snap install tree
sudo snap install htop
sudo snap install kate
sudo snap install code -classic

sudo snap install goland --classic
sudo snap install pycharm-educational --classic
sudo snap install arduino
sudo usermod -a -G  dialout $USER
sudo snap install postman

# install Gitlab-runner
cd $HOME/Downloads
ARCH="amd64"
curl -LJO "https://s3.amazonaws.com/gitlab-runner-downloads/master/rpm/gitlab-runner_${ARCH}.rpm"
sudo dpkg -i gitlab-runner_$ARCH.deb

# ensure that arrows work in vi
echo "set nocompatible" > $HOME/.vimrc

# install Zoom-Client
cd $HOME/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y ./zoom_amd64.deb
sudo apt --fix-broken install

# install Teams-Client
sudo snap install teams
#cd $HOME/Downloads
#wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.16851_amd64.deb
#sudo dpkg -i teams_1.3.00.16851_amd64.deb

# install VPN-Client FRA-UAS fortinet
cd $HOME/Downloads

# VPN-Client FRA-UAS
wget -O - https://repo.fortinet.com/repo/6.4/ubuntu/DEB-GPG-KEY | sudo apt-key add -
sudo chmod 777 /etc/apt/sources.list
echo "deb [arch=amd64] https://repo.fortinet.com/repo/6.4/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list
sudo chmod 644 /etc/apt/sources.list
sudo apt-get update
sudo apt install forticlient

# install Thunderbird
sudo apt install -y thunderbird

# install Libre-Office
sudo snap install -y libreoffice

# install Chrome
cd $HOME/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

# install Oracle-Virtual-Box
sudo apt install -y virtualbox virtualbox-ext-pack
