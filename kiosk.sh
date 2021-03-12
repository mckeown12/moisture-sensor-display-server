#!/bin/bash

sleep 5

xset s noblank
xset s off
xset -dpms
unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk http://localhost:5000

#while true; do
#      xdotool keydown ctrl+r; xdotool keyup ctrl+r;
#      sleep 15
#done
