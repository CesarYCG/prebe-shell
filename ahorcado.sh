#!bin/bash

echo "Bienvenido a Ahorcado!!"
pa=$((( $RANDOM%4 ) + 1 ))
case $pa in
1)op="Linux"
echo "Kernel del sistema GNU/Linux"
;;
2)op="Linus Torvalds"
echo "Creador del kernel Linux"
;;
3)op="Shell Script"
echo "Lenguaje utilizado en la creacion de este programa"
;;
4)op="SSH"
echo "Siglas de una shell segura"
;;
esac
k="${op:0:1}"
x=${#op}

for n in $(seq 2 1 $x)
do
    k=$k" _"
done
echo ""
echo "$k"
intentos=3

while [ "$xd" != "$op" ] && [ "$intentos" != "0" ]
do
echo "Te quedan $intentos intentos"
let intentos--
echo "$k"
read -r xd
done
if [ "$intentos" = "0" ]
then
	echo -e "Haz perdido ):"
else
	echo -e "Alto crack en el Linux sos, haz acertado :)"
fi