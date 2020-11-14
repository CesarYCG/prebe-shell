#!/bin/bash

#login chido

intentos=3

while [ $intentos != 0 ]; do #mientras todavia tenga intentos
	#clear
	base=$PWD 	#Obtenemos la ruta
	echo "Por favor, inicia sesión.";
	echo -n -e "\e[31mNombre de usuario: \e[0m";  #Con -n no da salto de linea
	read -e unUsuario;								    #Con -e (y todo lo que parece no tener sentido)
	echo -n -e "\e[31mContraseña: \e[0m";			#habilitamos el color de las letras
	read -s unPassword; 							#Con -s evitamos que se pueda ver la contraseña

	#buscamos el nombre de usuario en el shadow
	comprobacion=`sudo -S grep -r $unUsuario /etc/shadow`
	#echo ""
	#echo "Comprobacion"
	#echo -e "$comprobacion"

	if [ ${comprobacion} > 1 ]
	then
		#IFS = Input Field Separator, contiene caracteres que limitan un valor de otro
		IFS='$' 
		read -r -a array <<< "$comprobacion"
		#echo ""
		#echo "IFS"
		#echo -e "${array[2]}"
		#indice="\$${array[1]}\$${array[2]}"


		hash="$(openssl passwd -"${array[1]}" -salt="${array[2]}" $unPassword)"
		#echo ""
		#echo "HASH"
		#echo -e "$hash"

		#Buscamos que comprobacion sea igual a lo que hay en el hash
		existencia=`echo "$comprobacion" | grep -c "$hash"`

		if [ "$existencia" -eq 1 ] #Acceso
		then
			clear
			echo -e "\e[32mBienvenido. Accesando...\e[0m"
			Sleep 2
			
			bash $PWD/prebeshell.sh
			intentos=0;

		else
			echo -e "\e[31mContraseña incorrecta \e[0m"
			let intentos--
			echo -e "\e[31mQuedan: $(($intentos)) intentos \e[0m"
		fi
	else
		echo -e "\e[31mUsuario inexistente\e[0m"
			let intentos--
			echo -e "\e[31mQuedan $(($intentos)) intentos\e[0m"
	fi
done
clear
echo -e "\e[31mSaliendo del login... \e[0m"
echo -e "\e[31mHasta luego (: \e[0m"