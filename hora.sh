#!bin/bash

#Muestra la hora al momento de consulta

echo -e -n "La hora actual es: "
cat /proc/driver/rtc | grep 'rtc_time' | grep "[0-9]*:[0-9]*:[0-9]*" -o
#Cat nos permite concatenar salida con otros archivos
#El primer grep filtra el campo que queremos de rtc, en este caso 'rtc_time'
#El segundo grep filtra mas este campo y modelamos el formato de la salida
#El formato [0-9]*-[0-9]*-[0-9]* es una expresion regular
#La bandera -o imprime solo las partes que cumplen con el formato especificado