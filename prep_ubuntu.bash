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



update_OS_with_apt
apt_install_guest_additions
apt_install_ssh_server
configure_grub
sudo apt install grub-customizer
