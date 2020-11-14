#!/bin/bash

#Obteniendo la fecha

echo -e -n "La fecha es: "
cat /proc/driver/rtc | grep 'rtc_date' | grep "[0-9]*-[0-9]*-[0-9]*" -o