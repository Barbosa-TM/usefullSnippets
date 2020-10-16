#!/bin/bash

# This script outputs the hyperthreaded and physical cpu core id's.
# Useful for core pinning.

NRCPUS=$(lscpu | grep 'CPU(s):        ' | awk {'print $2'})
ARRAYPHYS=()
ARRAYHYPER=()
STARTID=0
ENDID=$(($NRCPUS-1))

for cpu in `seq $STARTID $ENDID`;do

    CPU=$(cat /sys/devices/system/cpu/cpu${cpu}/topology/thread_siblings_list | sed 's/,/ /g; s/-/ /g' | awk {'print $1'})

    if [[ $cpu -eq $CPU ]]
    then
       ARRAYPHYS+=($cpu)
    else
       ARRAYHYPER+=($cpu)
    fi
done

echo "Physical CPU core id's     :   "  ${ARRAYPHYS[@]}

echo "Hyperthreaded CPU core id's:   " ${ARRAYHYPER[@]}
