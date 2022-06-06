#!/bin/bash
#
# Criado em 09/09/2019
#
#
#
# Sistema de gestao de rede EmbraLINUX
#
# 1. Copiar o arquivo (embrafire) para /etc/init.d/
# 2. No caminho /etc/init.d/  executar os seguintes comandos :
#                   cd /etc/init.d
#                   chmod +x embrafire
#                   update-rc.d embrafire defaults
#
# 3. Para ativar o embrafire, use o comando:
#                    /etc/init.d/embrafire
#
#    Para desativar o embrafire, use o comando:
#                    /etc/init.d/embrafire --stop
#
# Vale lembrar que uma vez que os passos 1 e 2 tenham sido feitos, o computador ativará automaticamente o embrafire na inicialização.
# Atualizado para REMOVER o EMBRAFIRE de maquinas com instalações mais antigas.
#
# Menezes 06/10/2020
#


#echo -e "\033[40;33;1m Configurando o Firewall\033[0m"
#if ! 

    #sudo cp -r  /home/smscamboriu/Downloads/padrao_sms/principal/inicializadores/embrafire.sh /etc/init.d/ 
    #sudo chmod +x /etc/init.d/embrafire.sh
    #sudo chmod 777 /etc/init.d/embrafire.sh    #nao precisa
    #sudo update-rc.d embrafire.sh defaults     #Não funciona no mint 
    #ln -s /etc/init.d/embrafire.sh /etc/rc2.d/S99embrafire.sh 

#then 
#echo -e "\033[40;31;1m Não foi possível configurar o Firewall\033[0m"
#else 
#echo -e "\033[40;32;1m Firewall configurado e será ativado na proxima reinicialização\033[0m"
#fi


echo -e "\033[40;33;1m Removendo EMBRAFIRE\033[0m"
if ! 

    sudo rm -rf /etc/init.d/embrafire.sh
    sudo rm -rf /etc/rc2.d/S99embrafire.sh
   
then 
echo -e "\033[40;31;1m EMBRAFIRE não estava instalado no sistema\033[0m"
else 
echo -e "\033[40;32;1m EMBRAFIRE removido com sucesso\033[0m"
fi



























