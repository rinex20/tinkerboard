#!/bin/bash 

# fan speed gpio: #158
# 0 - low speed  
# 1 - high speed 
SPEED=0 

sudo -i
echo "cpu temp."
echo $[$(cat /sys/class/thermal/thermal_zone0/temp)/1000]°

echo 158 >/sys/class/gpio/export 
 
if [ $1 = "low" ];then 
  SPEED=0 
elif [ $1 = "high" ];then 
  SPEED=1 
fi 
 
echo $SPEED >/sys/class/gpio/gpio158/value 
echo 158 >/sys/class/gpio/unexport

if [ $2 = "watch" ];then
  echo "watch cpu temp."
  watch -n 0.1 echo CPU: $[$(cat /sys/class/thermal/thermal_zone0/temp)/1000]°
fi
