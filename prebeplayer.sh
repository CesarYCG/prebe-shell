#!bin/bash

#Reproductor musical
#Colorsitos para cosas buenas y cosas malonas
rojo="\e[31m"
rojof="\e[0m"
verde="\e[32m"
verdef="\e[0m"

#Colorsitos para el menu
cmenu="\e[1;41;40m"
cmenuf="\e[0m"
clear
echo -e "
${cmenu}               _                               ${cmenuf}
${cmenu}              / /                              ${cmenuf}
${cmenu}|||| |||||  ||  ||  ||||||  ||  ||||||   |||   ${cmenuf}
${cmenu}|| |||| ||  ||  ||  |||     ||  ||      || ||  ${cmenuf}
${cmenu}|| |||  ||  ||  ||    ||||  ||  ||     ||||||| ${cmenuf}
${cmenu}||      ||  ||||||  ||||||  ||  |||||| ||   || ${cmenuf}
${cmenu}                                               ${cmenuf}
${cmenu}      ||||||  ||  ||  ||  ||||      |||        ${cmenuf}
${cmenu}      ||      ||  ||  ||  || ||    || ||       ${cmenuf}
${cmenu}      ||      ||||||  ||  ||  ||  ||   ||      ${cmenuf}
${cmenu}      ||      ||  ||  ||  || ||  |||||||||     ${cmenuf}  
${cmenu}      ||||||  ||  ||  ||  ||||   |||   |||     ${cmenuf}
${cmenu}                                               ${cmenuf}"

sleep 2

#Necesitamos mpg123, asi que verificamos su existencia

controlador=$(ls /usr/bin | grep -c mpg123)
if [ $controlador -eq 0 ] #Si no lo tiene
then
	echo -e "${rojo}Vaya, parece que no tienes mpg123, quieres instalarlo? s/n ${rojof}"
	read respuesta
	if [ "$respuesta" = "n" ] || [ "$respuesta" = "N" ]
	then
		echo -e "${rojo}mpg123 es necesario para este prebeplayer ): adiosito${rojof}"
		exit
	elif [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]
		then
			echo -e "${verde}Genial! Vamos a instalarlo, no llevara mucho :D ${verdef}"
			sudo apt-get install mpg123
			sudo apt-get install pv
			echo -e "${verde}Que buena suerte, mpg123 ya se ha instalado. ${verdef}"
			echo -e "${verde}Vuelve a ejecutar el prebeplayer para poder disfrutar tu musica${verdef}"
		else
			echo -e "${rojo}Respuesta no valida, volviendo al menu...${rojof}"
			exit
	fi
else      #Aqui va toda la maraña de codigo si ya posee mgp123...
	
	#Necesitamos pedir la ruta de la musicasa
	#clear
	echo -e "${verde}Por favor, indique la ruta absoluta donde se encuentra su musica ${verdef}"
	#cd ~/
	read -e -p ">" ruta
	while [ ! -d "$ruta" ] 
	do
		echo -e "${rojo}El directorio no existe. Por favor ingrese nuevamente la ruta absoluta${rojof}"
		read -e -p ">" ruta
	done
	cd $ruta #2>/dev/null #Cachamos un error


	echo -e "${verde}Bienvenido al prebeplayer, colega! :D a continuacion los chulos ${verdef}"
	echo -e "${verde}comandos para manejarlo, disfruta tu musica :3 ${verdef}"

	echo -e "${cmenu}     PODEROSOS COMANDOS PARA TU MUSICA      ${cmenuf}"
	echo -e "${cmenu}--------------------------------------------${cmenuf}"
	echo -e "${cmenu}1) Reproducir todas las canciones           ${cmenuf}"
	echo -e "${cmenu}2) Reproducir las canciones en aleatorio    ${cmenuf}"
	echo -e "${cmenu}9) Salir                                    ${cmenuf}"


	while [ "$respuesta" != "9" ]
	do
		#pulseaudio --kill
		#jack_control start
		echo -e "Que desea hacer, homs?"
		read respuesta

		case $respuesta in
			0)clear
				echo -e "${cmenu}     PODEROSOS COMANDOS PARA TU MUSICA      ${cmenuf}"
				echo -e "${cmenu}--------------------------------------------${cmenuf}"
				echo -e "${cmenu}D) Retrocede una cancion                    ${cmenuf}"
				echo -e "${cmenu}F) Cancion siguiente                        ${cmenuf}"
				echo -e "${cmenu}S) Pausa/Reanuda la cancio                  ${cmenuf}"
				echo -e "${cmenu}B) Repite la cancion                        ${cmenuf}"
				echo -e "${cmenu}+) Sube volumen                             ${cmenuf}"
				echo -e "${cmenu}-) Baja el volumen                          ${cmenuf}"
				echo -e "${cmenu}L) Muestra la lista de reproduccion         ${cmenuf}"
				echo -e "${cmenu}Q) Sales del prebeplayer                    ${cmenuf}"
			;;
			#Reproduccion lineal
			1) clear
				#sudo mpg123 -C --title -q $ruta/* | pv -t -p 
				echo -e "${cmenu}     PODEROSOS COMANDOS PARA TU MUSICA      ${cmenuf}"
				echo -e "${cmenu}--------------------------------------------${cmenuf}"
				echo -e "${cmenu}D) Retrocede una cancion                    ${cmenuf}"
				echo -e "${cmenu}F) Cancion siguiente                        ${cmenuf}"
				echo -e "${cmenu}S) Pausa/Reanuda la cancio                  ${cmenuf}"
				echo -e "${cmenu}B) Repite la cancion                        ${cmenuf}"
				echo -e "${cmenu}+) Sube volumen                             ${cmenuf}"
				echo -e "${cmenu}-) Baja el volumen                          ${cmenuf}"
				echo -e "${cmenu}L) Muestra la lista de reproduccion         ${cmenuf}"
				echo -e "${cmenu}Q) Sales del prebeplayer                    ${cmenuf}"
				mpg123 -C --title -q $ruta/* | pv -t -p
			;;
			#Reproduccion Aleatoria
			2) clear
								echo -e "${cmenu}     PODEROSOS COMANDOS PARA TU MUSICA      ${cmenuf}"
				echo -e "${cmenu}--------------------------------------------${cmenuf}"
				echo -e "${cmenu}D) Retrocede una cancion                    ${cmenuf}"
				echo -e "${cmenu}F) Cancion siguiente                        ${cmenuf}"
				echo -e "${cmenu}S) Pausa/Reanuda la cancio                  ${cmenuf}"
				echo -e "${cmenu}3) Muestra tu repertorio musical            ${cmenuf}"
				echo -e "${cmenu}4) Pausa/Reanuda la musica                  ${cmenuf}"
				echo -e "${cmenu}B) Repite la cancion                        ${cmenuf}"
				echo -e "${cmenu}+) Sube volumen                             ${cmenuf}"
				echo -e "${cmenu}-) Baja el volumen                          ${cmenuf}"
				echo -e "${cmenu}L) Muestra la lista de reproduccion         ${cmenuf}"
				echo -e "${cmenu}Q) Sales del prebeplayer                    ${cmenuf}"
				mpg123 -C --title -q -z $ruta/* | pv -t -p
			;;
			#Salir
			3) clear
				exit
			;;

			#Cualquier cosa no especificada
			*) echo -e "${rojo}Instruccion no reconocida, intente de nuevo.${rojof}"
		esac
	done

fi
echo -e "${rojo}Haz salido del prebeplayer${rojof}"


