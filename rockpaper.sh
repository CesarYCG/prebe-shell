#!bin/bash

#Juego de Piedra, Papel o Tijeras :O
clear
style="\e[1;95;40m"
stylef="\e[0m"

echo -e "${style} *--------------------------------------*${stylef}"
echo -e "${style} | |||||      /  |||||      /  |||||||| |${stylef}"
echo -e "${style} | ||  ||    /   ||  |     /   |||||||| |${stylef}"
echo -e "${style} | |||||    /    |||||    /       ||    |${stylef}"
echo -e "${style} | ||      /     ||      /        ||    |${stylef}"
echo -e "${style} | ||     /      ||     /         ||    |${stylef}"
echo -e "${style} | Piedra      Papel        Tijeras     |${stylef}"
echo -e "${style} *--------------------------------------*${stylef}"
sleep 2

 re='^[0-9]+$'
 partidas=-1
 while true
 do
  echo -n -e "${style}Cuantas partidas quieres jugar:${stylef}"
  read -r partidas
  if ! [[ $partidas =~ $re ]] 
  then
     echo -e "${style}No es un numero valido de partidas${stylef}"
     echo -e "${style}Porfavor intenta de nuevo\n${stylef}"
  elif [ $partidas -lt 0 ]; then
    echo "\e${style}Debes elegir al menos una ronda${stylef}"
  else
    echo -e "${style}Elegiste $partidas partidas, es hora del duelo!\n${stylef}"
    break
  fi
	done
	
	
while [ $partidas != 0 ]
do
echo -e "${style}\tPara jugar ingresaras solo el numero que corresponda a tu eleccion:\n${stylef}"
aleatorio=$(( ( RANDOM % 3 )  + 1 ))
echo -e "${style}1) Piedra\n${stylef}"
echo -e "${style}2) Papel\n${stylef}"
echo -e "${style}3) Tijeras\n${stylef}"  
read -e -p ">> " op
case $op in
	1)
	echo -e "${style}Elegiste Piedra\n${stylef}"
	if [[ $aleatorio == "1" ]]
		then
		echo -e "${style}\tLa computadora elegio Piedra\n\n${stylef}"
		echo -e "${style}\t\t\tEmpate\n\n${stylef}"
	elif [[ $aleatorio == "2" ]]
		then
			echo -e "${style}\tLa computadora eligio Papel\n\n${stylef}"
			echo -e "${style}\t\t\tGana la computadora\n\n\n${stylef}"
	elif [[ $aleatorio == "3" ]]
		then
		echo -e "\tLa computadora eligio Tijeras\n\n"
		echo -e "${style}\t\t\tTu ganas\n\n\n${stylef}"
	fi
	partidas=$(($partidas -1))
	;;
	2)
	echo -e "${style}Elegiste Papel\n${stylef}"
	if [[ $aleatorio == "1" ]]
		then
		echo -e "${style}\tLa computadora eligio Piedra\n\n${stylef}"
		echo -e "${style}\t\t\tTu ganas\n\n\n${stylef}"
	elif [[ $aleatorio == "2" ]]
		then
			echo -e "${style}\tLa computadora eligio Papel\n\n${stylef}"
			echo -e "${style}\t\t\tEmpate\n\n\n${stylef}"
	elif [[ $aleatorio == "3" ]]
		then 
		echo -e "${style}\tLa computadora eligio Tijeras\n\n${stylef}"
		echo -e "${style}\t\t\tGana la computadora\n\n\n${stylef}"
	fi
	partidas=$(($partidas -1))
	;;
	3)
	echo -e "${style}Elegiste Tijeras\n${stylef}"
	if [[ $aleatorio == "1" ]]
		then
		echo -e "${style}\tLa computadora eligio Piedra\n\n${stylef}"
		echo -e "${style}\t\t\tGana la computadora\n\n\n${stylef}"
		
	elif [[ $aleatorio == "2" ]]
		then
		echo -e "${style}\tLa computadora eligio Papel\n\n${stylef}"
		echo -e "${style}\t\t\tTu ganas\n\n\n${stylef}"
	elif [[ $aleatorio == "3" ]]
		then
		echo -e "${style}\tLa computadora eligio Tijeras\n\n${stylef}"
		echo -e "${style}\t\t\tEmpate\n\n\n${stylef}"
	fi
	partidas=$(($partidas -1))
	;;
	esac
	done 
	echo -e "${style}\t\tFin del juego, gracias por jugar :D !${stylef}" 
	exit
