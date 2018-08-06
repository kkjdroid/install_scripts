#!/bin/sh

#Copyright 2018 Kenny Jackson

#Don't use this unless you understand why it works.
#This is for people who have installed AUR helpers before and want to save time.

#Borrows heavily from tadly/pacaur_install.sh on Github

#update
sudo pacman -Syu

#install build tools
sudo pacman -S --noconfirm --needed binutils make gcc fakeroot

#install dependencies
sudo pacman -S --noconfirm --needed --asdeps git go sudo

#make temp folder
mkdir -p /tmp/yay_install
cd /tmp/yay_install

#install
if [ ! -n "$(pacman -Qs yay)" ]; then
    curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay
    makepkg PKGBUILD --install --needed
fi

#delete temp folder
cd ~
rm -r /tmp/yay_install
