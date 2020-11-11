#!/bin/bash

#Login y acceso al menu principal

#Definimos las variables para el acceso
unUsuario="";
unPassword="";
intentosRestantes="";

intentosRestantes=5; #Solo tendra 5 oportunidades para lograr accesar
while [ $intentosRestantes != 0 ]; do #Vamos a pedir usuario y contraseña conocidas
	clear;
	echo "Por favor, inicia sesión.";
	echo -n -e "\e[31mNombre de usuario: \e[0m";  #Con -n no da salto de linea
	read unUsuario;								    #Con -e (y todo lo que parece no tener sentido)
	echo -n -e "\e[31mContraseña: \e[0m";			#habilitamos el color de las letras
	read -s -e unPassword; 							#Con -s evitamos que se pueda ver la contraseña

	#buscamos el id del usuario dado
	id -u "$unUsuario" > /dev/null; 		#Si el ID no existe, lo mandamos al dump
											#No se muestra en terminal que no existe

	if [ $? -ne 0 ]; then				#Si el usuario introducido no esta registrado
		exit 1;							#Salimos del login, un error.
	fi
	export unPassword;
	ORIGPASS=`grep -w "$unUsuario" /etc/shadow | cut -d: -f2`
	export ALGO =`echo $ORIGPASS | cut -d"$" -f2`
	export SALT =`echo $ORIGPASS | cut -d"$" -f3`

	GENPASS="$(perl -e 'print crypt("$ENV{PASSWD}","\$$ENV{ALGO}\$$ENV{SALT}\$")')"

	if cat /etc/passwd | egrep -q $unUsuario
	then
	if [ "$GENPASS" == "$ORIGPASS" ]
	then
	if [ $? != "$unUsuario" | $? != "$unPassword" ]
	then
		intentosRestantes=$((intentosRestantes-1));
		echo -e "Acceso invalido, te quedan ", intentosRestantes, " intentos";
		sleep 1;
	else
		intentosRestantes=3
		break
	fi
	fi
	fi
done
if [ $intentosRestantes == 0 ]
then
	echo -e "\e[31mACCESO BLOQUEADO. CONTACTE A UN ADMINISTRADOR \e[0m";
	exit;
fi
clear
