#!bin/bash

clear

let opcion

prompt="\e[91m"$HOSTNAME"\e[0m@\e[36m"$usuario"\e[0m {\e[92m"$PWD"\e[0m} > " 

while [ "$opcion$" != "salir" ]
do
	echo -e "\e [32mLista de comandos: \e[0m"
	echo -ne $prompt
	read -e opcion

	case $opcion in
		'ayuda')
			$PWD/ayuda.sh
		;;

		'arbol')
			$PWD/arbol.sh
		;;

		'infosis')
			$PWD/infosis.sh
		;;

		'fecha')
			$PWD/fecha.sh
		;;

		'fechuza')
			$PWD/fecha.sh
		;;

		'buscar')
			$PWD/buscar.sh
		;;

		'prebeplayer')
			$PWD/prebeplayer.sh
		;;

		'rockpaper')
			$PWD/rockpaper.sh
		;;

		'creditos')
			$PWD/creditos.sh
		;;

		'salir')
		;;	

	esac
done
echo "Ha salido de la prebeshell, ahi nos vidrios"


