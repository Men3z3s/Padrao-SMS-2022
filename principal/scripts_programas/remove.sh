#!/bin/bash
#
# remove.sh
# Criado em 09/10/2019
#
# remove desnecessarios do sistema afim de evitar atualização dos mesmos.
#     #---Removidos---# 
#     /  LibreOffice  /
#     /  ThunderBird  /
#     /     Plank     /  
#
#
# Atualizado para funcionar com loop. 06/05/2020
# Atualizado para funcionar na versão mint Ulyana 2020 que precisa do --purge para funcionar corretamente.  
# Atualizado para remover o plank (versões antigas tinha isso)
#
# Menezes 06/10/2020
#
#
#
#--------------------------REMOVE-----------------------------



       
       
       PROGRAMA=("libreoffice*" "thunderbird*" "plank*"  "google-chrome*") # programas a serem removidos 




for i in "${PROGRAMA[@]}"

do

echo -e "\033[40;33;1m removendo $i \033[0m"

sleep 1

        #if !  apt remove $i -y
        if !  apt-get remove --purge $i -y


then
                echo -e "\033[40;31;1m Não foi possivel remover $i\033[0m"
	else
                echo -e "\033[40;32;1m $i removido com  sucesso! \033[0m"
sleep 2

echo ""
fi
done

	
		

#-----------------------------------------------------------------
