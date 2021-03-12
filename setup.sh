#!/bin/bash

sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install sed mate-desktop-environment-core lightdm -y
sudo sed -i 's/#autologin-user=/autologin-user=pi/' /etc/lightdm/lightdm.conf
sudo apt-get install chromium-browser -y
sudo apt-get install xdotool unclutter -y
sudo chmod a+x run.sh
sudo chmod a+x kiosk.sh
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
sudo cp servicedef.txt /lib/systemd/system/kiosk.service
sudo cp flaskservicedef.txt /lib/systemd/system/flask.service

sudo systemctl enable flask.service
sudo systemctl start flask.service
sudo systemctl enable kiosk.service
sudo systemctl start kiosk.service

sudo reboot now
