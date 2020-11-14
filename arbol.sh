#!bin/bash

#Comando que muestra la jerarquia de un directorio

#Con pwd obtenemos el directorio actual y lo imprimimos
echo -e "Tu direccion actual es: "
pwd

echo -e "Deseas especificar un directorio s/n?"
read ans
if [ "$ans" != "s" ] && [ "$ans" != "S" ]
then
	echo -e "El Lorax que habla por los arboles, te dice que tu arbol es: "

	#Usamos el comando DIR para podemos movernos entre
	#directorios, '*' son todos los archivos
	for dir in *
	do
		echo "     $file" #Muestra los archivos que ve

		#Ahora, -d $dir es "SI EL DIRECTORIO EXISTE"
		if [ -d "$dir" ]
		then
			echo -e "$dir" #Me muestra el contenido de dicho directorio#
			cd "$dir" #Entra al directorio
			for dir in * #Volvemos a listar los archivos ejecutables
			do
				echo -e "     $dir"
			done
			cd .. #Barrido el contenido del directorio, salimos de el
		fi
	done
else
	echo -e "Introduce tu directorio: "
	read directorioDado
	cd ~
	cd directorioDado 2>/dev/null #Si el directorio no existe, atrapamos el error.
	echo -e "El Lorax muestra el siguiente directorio: " #A partir de aqui se hace
	if [ -d "$directorioDado" ]							 #Lo mismo que el primer IF
	then
		echo -e "$directorioDado"
		cd "$directorioDado"
		for directorioDado in *
		do
			echo -e "     $directorioDado"
		done
		cd ..
	else 
		echo -e "El lorax dice que tu directorio no existe ):"
	fi
fi