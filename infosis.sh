#!bin/bash

#Comando que muestra informacion del sistema
#Tal como:
#Usuario logeado
#Memoria RAM
#Arquitectura
#Version del SO
clear
echo -e "

\e[31;40m||||||  ||||||  ||||||   ||||||   ||||||    ||||||  ||  ||\e[0m
\e[31;40m|||     ||  ||  ||   ||  ||   ||  ||        |||     ||  ||\e[0m
\e[31;40m||||||  ||  ||  ||||||   ||||||   ||||      ||||||  ||  ||\e[0m
\e[31;40m    ||  ||  ||  ||   ||  ||  ||   ||            ||  ||  ||\e[0m
\e[31;40m||||||  ||||||  ||||||   ||   ||  ||||||    ||||||  ||||||\e[0m
\e[31;40m                                                          \e[0m
\e[31;40m                                                          \e[0m
\e[31;40m||||||  ||  |||||| ||||||||  ||||||  ||||  ||||     ||    \e[0m
\e[31;40m|||     ||  |||       ||     ||      || |||| ||   ||  ||  \e[0m
\e[31;40m||||||  ||  ||||||    ||     ||||    ||  ||  ||   ||||||  \e[0m
\e[31;40m    ||  ||      ||    ||     ||      ||      ||  ||    || \e[0m
\e[31;40m||||||  ||  ||||||    ||     ||||||  ||      ||  ||    || \e[0m"
echo -e "\e[93m----------------------------------------------------------\e[0m"
echo -n -e "\e[93mUsuario Conectado: \e[0m"
whoami

echo -e "\e[93mMemoria RAM disponible: \e[0m"
free -m
echo -e "\e[93mArquitectura: \e[0m"
uname -m
echo -e "\e[93mVersion del Sistema Operativo: \e[0m"
cat /proc/version