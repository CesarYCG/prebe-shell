#!bin/bash

clear

let opcion

prompt="\e[91m"$HOSTNAME"\e[0m@\e[36m"$usuario"\e[0m {\e[92m"$PWD"\e[0m} > " 

while [ "$opcion" != "salir" ]
do
	echo -ne $prompt
	read -e opcion

	case $opcion in
		'ayuda')
			bash $PWD/ayuda.sh
		;;

		'arbol')
			bash $PWD/arbol.sh
		;;

		'infosis')
			bash $PWD/infosis.sh
		;;

		'fecha')
			bash $PWD/fecha.sh
		;;

		'hora')
			bash $PWD/hora.sh
		;;

		'buscar')
			bash $PWD/buscar.sh
		;;

		'prebeplayer')
			bash $PWD/prebeplayer.sh
		;;

		'rockpaper')
			bash $PWD/rockpaper.sh
		;;
		
		'ahorcado')
			bash $PWD/ahorcado.sh
		;;

		'creditos')
			bash $PWD/creditos.sh
		;;

		'salir')
		;;	

	esac
done
echo "Ha salido de la PROLIN_CHIDA, ahi nos vidrios al raton"

