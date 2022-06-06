#!/bin/bash
#
# auto_start.sh
#
#
# Coloca programas na inicialização automatica do usuário em que é executado o script.
# Detectado problema onde o script não executava corretamente por falta do diretório autostart. 
# Adicionado função de verificação do diretório.
#
#
#
#----- PROGRAMAS----- 
# plank
# xcompmgr
# milvus - 01-03-21
#-------------------
#
#
# Menezes 20/08/2019
#

#----------------------------------AUTO START-----------------------
# echo -e "\033[40;32;1m WPS-Office instalado com  sucesso! \033[0m"



if [ -e "/home/$USUARIO/.config/autostart" ]
    then
       
	echo -e "\033[40;32;1m Pasta Autostart já existe! \033[0m"
    else
        
	echo -e "\033[40;32;1m Criando pasta Autostart! \033[0m"
    mkdir /home/$USUARIO/.config/autostart
       
	echo -e "\033[40;32;1m Autostart criado! \033[0m"
fi
#------------------------------------------------------------
#if [ -e "/home/$USUARIO/.config/autostart/milvus.desktop" ]
 #   then
  #     echo -e "\033[40;32;1m Milvus já está no Autostart! \033[0m"       
#else
 #      echo -e "\033[40;32;1m Adicionando Milvus no Autostart! \033[0m"
       
  #  cp -r principal/inicializadores/milvus.desktop /home/$USUARIO/.config/autostart
   #     echo -e "\033[40;32;1m Milvus adicionado! \033[0m"
    #   echo -e "\033[40;32;1m Configuração da inicialização bem sucedida! \033[0m"
#fi
#------------------------------------------------------------

