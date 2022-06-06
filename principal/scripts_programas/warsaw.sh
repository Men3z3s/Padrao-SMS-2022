#!/bin/bash
#
# warsaw.sh
#
# Instala o WARSAW atravez de pacote ja baixado na pasta /padrao_sms/principal/pacotes/
#
#
# Menezes 20/08/2019
#
#
#
#---------------------------WARSAW-----------------------------
echo -e "\033[40;33;1m Instalando o Módulo de segurança WARSAW. \033[0m"
sleep 1

# Instalando via pacote gdeb 

        if ! dpkg -i principal/pacotes/warsaw_setup_64.deb
             

       then
                echo -e "\033[40;31;1m Não foi possivel instalar o WARSAW. \033[0m"
	else
                echo -e "\033[40;32;1m WARSAW instalado com  sucesso! \033[0m"
sleep 2

echo ""
fi
#------------------------------------------------------------------



