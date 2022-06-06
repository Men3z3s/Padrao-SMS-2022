#!/bin/bash
#
# atualiza.sh
#
# Atualiza o sistema 
#
#
# Menezes 19/08/2019
#
#
#
#--------------------------Atualiza-----------------------------


	echo -e "\033[40;33;1m Atualizando repositorios\033[0m"
        sleep 2
        if !  apt update ; apt upgrade -y ; apt dist-upgrade -y ; apt-get --fix-broken install -y
        then
                echo -e "\033[40;31;1m Não foi possivel atualizar os repositórios. \033[0m"
	else
                echo -e "\033[40;32;1m Atualização feita com sucesso! \033[0m"
		    	echo ""
		fi
#-----------------------------------------------------------------
