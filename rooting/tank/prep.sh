#!/bin/sh

apt update
add-apt-repository universe
apt install python3 python3-serial android-tools-adb android-tools-fastboot

systemctl stop ModemManager
systemctl disable ModemManager