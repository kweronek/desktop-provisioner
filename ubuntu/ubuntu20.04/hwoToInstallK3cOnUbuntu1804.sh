sudo -s
apt update
apt -install make
apt install build-essential

wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
sha256sum go1.13.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
mkdir go
mkdir go/{src,bin,pkg}
export $GOPATH=$HOME/go

apt-get update -y
apt-get install -y libseccomp-dev
apt-get install -y pkg-config

sudo systemctl enable --now docker
sudo usermod -aG docker root
sudo usermod -aG docker ubuntu


git init
git clone https://github.com/rancher/k3c
cd k3c
make build
make package


docker pull rancher/k3s

# docker exec -it k3s K3C_ADDRESS=/run/k3s/containerd/containerd.sock bash
# docker exec -it K3C_ADDRESS=/run/k3s/containerd/containerd.sock k3s bash
docker exec -it -e K3C_ADDRESS=/run/k3s/containerd/containerd.sock k3s --s

./bin/k3c daemon --cni/bin=/bin --bootstrap-image=docker.io/rancher/k3c:dev


	
	