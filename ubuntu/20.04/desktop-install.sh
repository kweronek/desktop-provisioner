# install ubuntu
#
sudo apt update
sudo apt -Y install git
sudo apt -Y install curl
sudo apt -Y install binutils
sudo apt -Y install pkg-config
sudo apt -Y install libseccomp-dev
sudo apt -Y install make
sudo apt -Y install build-essential
#
sudo snap install go --classic
mkdir ~/go
mkdir ~/go/{src,bin,pkg}
echo "export GOPATH=~/go" >> $HOME/.profile
#
sudo apt install openjdk-14-jdk
sudo snap install protobuf --classic
#
sudo snap install multipass
sudo snap install docker
#
# install k3d
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
#
# install rancher k3c
git clone https://github.com/rancher/k3c
cd k3c
make build
./bin/k3c daemon --group=$(id -g) &
cd ..
#
# install k3s
curl -sfL https://get.k3s.io | sh -
#
sudo snap install tree
sudo snap install htop
sudo snap install kubectl --classic
sudo snap install kate
sudo snap install goland --classic
sudo snap install postman
#
# install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
#
## ensure that arrows work in vi
echo "set nocompatible" > $HOME/.vimrc
## add . to PATH
echo "export PATH=$PATH:." >> $HOME/.profile
source $HOME/.profile
#
# VPN-Client FRA-UAS
wget -O - https://repo.fortinet.com/repo/6.4/ubuntu/DEB-GPG-KEY | sudo apt-key add -
sudo echo "deb [arch=amd64] https://repo.fortinet.com/repo/6.4/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list
sudo apt-get update
sudo apt install forticlient
#