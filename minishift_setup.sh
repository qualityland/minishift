### set up KVM virtual environment

# install 'libvirt' and 'qemu-kvm' packages
sudo dnf install -y libvirt qemu-kvm

# add your user to group 'libvirt'
sudo usermod -a -G libvirt $(whoami)

# update current session to use the new group
newgrp libvirt


# start & enable libvirtd and virlogd services
sudo systemctl start virtlogd
sudo systemctl enable virtlogd
sudo systemctl start libvirtd 
sudo systemctl enable libvirtd

# install the KVM driver and make it executable
sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-centos7 -o /usr/local/bin/docker-machine-driver-kvm
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

# download and extract minishift
curl -LO https://github.com/minishift/minishift/releases/download/v1.34.3/minishift-1.34.3-linux-amd64.tgz
tar tvzf minishift-1.34.3-linux-amd64.tgz

# add minishift to your PATH
#mkdir ~/.local/bin
#echo "export PATH=~/.local/bin:$PATH" >> ~/.bashrc
cp minishift-1.34.3-linux-amd64/minishift ~/.local/bin/


