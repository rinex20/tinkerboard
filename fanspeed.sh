#!/bin/bash 

# fan speed gpio: #158
# 0 - low speed  
# 1 - high speed 
SPEED=0 
 
echo 158 >/sys/class/gpio/export 
 
if [ $1 = "low" ];then 
  SPEED=0 
elif [ $1 = "high" ];then 
  SPEED=1 
fi 
 
echo $SPEED >/sys/class/gpio/gpio158/value 
echo 158 >/sys/class/gpio/unexport
                                                                                                                                                                                                                                       16        1,1           All
