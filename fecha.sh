#!/bin/bash

#Obteniendo la fecha
clear
echo -e -n "La fecha es: "
cat /proc/driver/rtc | grep 'rtc_date' | grep "[0-9]*-[0-9]*-[0-9]*" -o
#Cat nos permite concatenar salida con otros archivos
#El primer grep filtra el campo que queremos de rtc, en este caso 'rtc_date'
#El segundo grep filtra mas este campo y modelamos el formato de la salida
#El formato [0-9]*-[0-9]*-[0-9]* es una expresion regular
#La bandera -o imprime solo las partes que cumplen con el formato especificado