# install ubuntu
#
sudo apt update
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y binutils
sudo apt install -y pkg-config
sudo apt install -y libseccomp-dev
sudo apt install -y make
sudo apt install -y build-essential
#
sudo snap install go --classic
mkdir ~/go
mkdir ~/go/{src,bin,pkg}
echo "export GOPATH=~/go" >> $HOME/.profile
#
sudo apt install -y openjdk-14-jdk
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
sudo snap install pycharm-educational --classic
sudo snap install arduino
sudo usermod -a -G  dialout $USER
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
# Zoom-Client
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
cd ~
#
# Teams-Client
cd ~/Downloads
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.16851_amd64.deb
sudo dpkg -i teams_1.3.00.16851_amd64.deb
cd ~
#
# VPN-Client FRA-UAS
wget -O - https://repo.fortinet.com/repo/6.4/ubuntu/DEB-GPG-KEY | sudo apt-key add -
sudo chmod 777 /etc/apt/sources.list
echo "deb [arch=amd64] https://repo.fortinet.com/repo/6.4/ubuntu/ /bionic multiverse" >> /etc/apt/sources.list
sudo chmod 644 /etc/apt/sources.list
sudo apt-get update
sudo apt install forticlient
#
