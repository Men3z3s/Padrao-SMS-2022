#!/bin/bash
#
# anydesk.sh
#
# Instala suporte remoto anydesk apartir de um arquivo já baixado.
# COMANDO/LINK -> ( wget https://download.anydesk.com/linux/anydesk_5.1.1-1_amd64.deb -O anydesk.deb )
#
# Menezes 10-10-2019
#
# 06-04-2021 - Retirado da inicialização automatica por causa do Milvus.
#
#
#---------------------------------ANYDESK--------------------------------------

echo -e "\033[40;33;1m Instalando AnyDesk. \033[0m"
sleep 1

# Instalando via pacote gdeb


        if ! apt-get --fix-broken install -y
	         dpkg -i principal/pacotes/anydesk.deb 			 #pacote de instalação
             apt-get --fix-broken install -y
		 systemctl disable anydesk.service
 	
       	then
                echo -e "\033[40;31;1m Não foi possivel instalar AnyDesk. \033[0m"
       else
                echo -e "\033[40;32;1m AnyDesk instalado com  sucesso! \033[0m"
sleep 2
fi
