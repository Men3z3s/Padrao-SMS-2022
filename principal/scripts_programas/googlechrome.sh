#!/bin/bash

# googlechrome.sh
#
# Baixa e instala o Google-Chrome
#
# Ha um problema com o /etc/apt/source.list.d/google.list ele está criando varias copias dentro do arquivo.  
# Adicionado inicialização do google-chrome afim de criar caminho necessário usado no plank
#  
#
#
# Menezes 20/08/2019
#
#-------------------------Google Chrome---------------------------              
echo -e "\033[40;33;1m Instalando o Google Chrome. \033[0m"
sleep 1
#removendo instalações antigas
# sudo apt remove google-chrome-stable/opt
# sudo rm -rf /opt/google*
#sudo rm -rf /etc/apt/sources.list.d/google*
#echo "removido"
#sleep 3 



        #Baixa e adiciona o repositório
        if !  #sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' 

        #Baixa e adiciona a key
        wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

        #Atualiza       
        apt-get update

        #Instala a versão instável
        apt-get install google-chrome-stable -y

        #        apt-get remove google-chrome-stable #(remove a instalação do chrome)

        then
                echo -e "\033[40;31;1m Não foi possivel instalar o Google Chrome. \033[0m"
        fi
                echo -e "\033[40;32;1m Google Chrome instalado com  sucesso! \033[0m"
sleep 1


 #	echo -e "\033[40;34;1m Iniciando Google-Chrome. \033[0m"
#	if ! google-chrome &		
	
#	then		
#	echo -e "\033[40;31;1m Não foi possivel iniciar o Google Chrome. \033[0m"
	
#	fi 
#	echo -e "\033[40;32;1m Google-Chrome iniciado. \033[0m"
		

echo ""

