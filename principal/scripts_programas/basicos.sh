#!/bin/bash
#
# basicos.sh
#
# Baixa e instala os programas basicos de simples instalação, usando um loop.
# Para adicionar um programa a lista, basta acrescentar o nome na lista de PROGRAMAS seguindo o padrao já existente.  
# Os programas só serão instalados se realmente existirem e o nome do pacote estiver correto
# Retirado o visualizador de imagens NOMACS
# Retirado o Synapse
# Retirado Plank    
#
# Menezes 30/01/2020
#



#------------------------------- PROGRAMAS BÁSICOS-------------------------------------


echo -e "\033[40;33;1m Instalando programas. \033[0m" 
echo ""
sleep 1



# Acrescente programas a esta lista para ser instalado 
PROGRAMA=("xcompmgr" "moka-icon-theme" "firefox-locale-pt" "vim" "samba")




for i in "${PROGRAMA[@]}"

do

echo -e "\033[40;33;1m Instalando $i \033[0m"

sleep 1

        if !  apt install $i -y


then
                echo -e "\033[40;31;1m Não foi possivel instalar $i\033[0m"
	else
                echo -e "\033[40;32;1m $i instalado com  sucesso! \033[0m"
sleep 2

echo ""
fi
done

#-----------------------------------------------------------------------------------
