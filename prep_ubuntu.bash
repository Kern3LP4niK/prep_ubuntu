#!/bin/bash
update_OS_with_apt()
{
  sudo apt update
  sudo apt upgrade -y
}
apt_install_guest_additions()
{
  sudo apt install -y build-essential dkms linux-headers-$(uname -r)
  sudo apt install -y virtualbox-guest-additions-iso
}
apt_install_ssh_server()
{
  sudo apt install -y openssh-server
  sudo systemctl enable ssh
  sudo systemctl start ssh
}
configure_grub()
{
  sudo echo 'GRUB_GFXMODE="1600x1200x32"'  >> /etc/default/grub
  sudo echo 'GRUB_GFXPAYLOAD_LINUX="1600x1200x32"' >> /etc/default/grub
}
install_docker()
{
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo apt-get update
}
install_browsh()
{
  wget https://github.com/browsh-org/browsh/releases/download/v1.6.4/browsh_1.6.4_linux_amd64.deb
  sudo apt install ./browsh_1.6.4_linux_amd64.deb
  rm ./browsh_1.6.4_linux_amd64.deb
  browsh
}

update_OS_with_apt
apt_install_guest_additions

configure_grub
sudo apt install grub-customizer
sudo grub-customerizer
dpkg-reconfigure console-setup

apt_install_ssh_server

install_browsh
sudo usermod -a -G vboxusers $(whoami)
sudo apt install virtualbox-ext-pack
#sudo apt install hasciicam
sudo apt install vlc
#install_docker
#docker pull browsh/browsh
