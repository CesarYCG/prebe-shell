#!bin/bash

#Por si te lo preguntas, este programa busca... archivos en una ruta
verdeinicio="\e[32:30m"
verdefin="\e[0:0m"


echo -e "Por favor, dame el nombre del archivo"
read archivo
echo -e "Ahora, dame la ruta donde quieres buscarlo"
read ruta

cd ~ #Empezamos desde directorio de usuario
cd ruta 2>/dev/null #Si no existe, atrapamos un error
if [ -d "$ruta" ]
then
	cd $ruta #Vamos a la ruta 
	echo -e "${verdeinicio}La ruta existe muchacho, buscando tu archivo...${verdefin}"
	sleep 2 #Se siente la tension aqui
	if [ -f $archivo ] #Si el archivo existe
	then				#Le decimos que todo esta bien c:
		echo -e "${verdeinicio}Tu archivo existe, frutifantastico${verdefin}"
	else
		echo -e "Tu archivo no existe, F ):"
	fi
else
	echo -e "Tu ruta no existe ):"
fi