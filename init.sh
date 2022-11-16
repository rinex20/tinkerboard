#!/bin/bash

# function
# set_gpio_value gpio value
# arg1: gpio# arg2: value
set_gpio_value(){
  echo $1 >/sys/class/gpio/export 
  echo $2 >/sys/class/gpio/gpio$1/value
  echo $1 >/sys/class/gpio/unexport
}

# adjust fan speed to reduce the fan noise
# monitor cpu temp. if the temp. > 60 , set fan speed to high mode
# otherwise keep low speed 
# fan speed gpio: #158
# 0 - low speed  
# 1 - high speed 
SPEED=0
GPIO=158
# echo "cpu temp."
# echo $[$(cat /sys/class/thermal/thermal_zone0/temp)/1000]°

if [ $1 = "low" ];then 
  SPEED=0 
elif [ $1 = "high" ];then 
  SPEED=1 
fi 

set_gpio_value $GPIO $SPEED

# install docker
# Install Python dependencies.
sudo python3 -m pip install pip --upgrade

sudo apt-get update
sudo apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# install tightvnc
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-debian-11
# fix issue of missing "fixed" font
# apt-get install xfonts-base


# install gpsd from source


# install rtkrcv and str2str
# config file
# systemd service


# fix xgps issue
# apt install python3-gi-cairo or python-gi-cairo
# or reinstall: apt install --reinstall python3-gi-cairo

