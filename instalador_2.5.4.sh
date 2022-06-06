#!/bin/bash
#
# instalador_2.5.2.sh
# 
# versão 2.5.2
#
# Instala automaticamente programas basicos no Linux Mint.
# Configura o Plank. 
# Coloca Plank e xcompmgr na inicialização do /etc/init.d (deu problema).
# Inicio da configuração samba.	(parado)
# Mudei o nome $USER para smscamboriu até achar uma solução plausivel para problema na instalação como root. 
# Alterado o local Area de trabalho para Downloads por questões de caminho.	
# Adicionado instalação do WINE.
# Modificado o modo de instalação do WPSOFFICE, e adicionado pacote de tradução e correções.
# Corrigido problema da inicialização.
# Mudado a forma como é instalado os programas, criado um script para cada programa (Funcional).
# Adicionado script de instalação de impressora. 
# Adicionado script de instalação do WARSAW.
# Adicionado script de configuração da aparência.
# Removido programa Nomacs.
# Adicionado Reboot no final do programa afim de configurar a aparência.
# Impressora reconfigurado e traduzido o Instalador da impressora (Comentado por não haver necessidade por enquanto). 
# Modificado o config_plank (teste).
# Inclui o EMBRAFIRE na instalação, para bloquear sites indevidos. confi
# Comentado a instalação do GOOGLE-CHROME, por nao haver necessidade. 
# Remove o LibreOffice para evitar que o mesmo seja atualizado, consome tempo.   
# Comentado linhas no instalador do wine.  
# Retirado Synapse da instalação.  
# Acrescentado configuração de pasta logo.
# Adicionado configuração do Mugshot.  
# Acrescentado ANYDESK.
# Alterado script de configuração do "config_theme" para mudar papel de parede do usuário embracore.
# Adicionados sites permitiros no embrafire.sh.
# Adicionado dependencias para o Anydesk.
# Substituido WPS-Office por nova versão.   
# 2.4.2 - Readicionada instalação do Google Chrome.  Motivo... Site da Celk apresenta problemas no FireFox
#         Comentada a linha de instalação do Embrafire. Motivo... Esta bloqueando coisas a mais.... (Corrigir)
#         Firefox substituido pelo Google Chrome no Plank
# 2.4.3 - Retirada do Plank, pois atrapalha um pouco ao trabalhar com o Google-Chrome, foi adicionado os atalhos do plank ao Desktop. Alterado papel de parede smscamboriu ("/usr/share/xfce4/backdrops/tara_msager_breathtaking_place.jpg").
# 2.4.4 - Alterado o funcionamento do script REMOVE, agora está usando loop.
#	  Retirado a função de iniciar o GOOGLE, pois o mesmo nao é mais necessario, e nunca funcionou na realidade. 	
# 2.4.5 - 07/2020
#	- Atualizado o WPS-OFFICE para nova versão 
# 2.4.6 - 24/09/2020 
#       - Atualizado o remove.sh 
#       - Retirado o WINE do instalador
#       - Adicionado apt autoremove no final do programa 
# 2.4.7 - 06/10/2020
#       - Atualizado o remove.sh para remover o plank das instalações antigas.
#       - Atualizado e e decomentado o EMBRAFIRE.sh para desistalar o mesmo de instalações antigas.
#       - Comentado a linha do Auto-start.sh do instalador.sh 
#       - Atualizado o WPS-OFFICE para nova versão. 
#2.4.8  - Instala o driver da impressora KYOCERA 
#2.4.9  - 19/02/2021
#       - Instala o Milvus 
#       - Comentado o instalador do Anydesk e do Google Chrome  
#       - Remove anydesk do computador 
#       - Atualizado WPS 
#	- Adicionado controle de usuários 
#       - Retirado caminho absoluto para executar de qualquer local
#
#2.5	-25/02/2021
#	-Corrigido caminho de instalação do milvus
#2.5.1  -22/03/2021
#	-Retornado para versão anterior do WPS-Office, pois a atual está conflitando com o pacote de tradução.
#
#2.5.2 -06/04/2021 
#	Recolocada a instalação do Anydesk, mas agora ele nao inicia com o sistema (systemctl disable anydesk.service)
#
#
#
#
#
#	Lista de programas
#
# Nomacs 		- Visualizador de imagens 	
# Synapse 		- Facilita a busca de un programa ou arquivo no sistema para usar = Ctrl+space
# Plank 		- Aba com atalhos para programas mais usados. (requer configuração)(colocar com inicio automático)
# Xcompmgr		- Extensão para deixar transparente alguns itens (Colocar como inicio automático)
# Moka-icon-theme 	- Tema de icones que será usado por padrão
# Firefox-locale-pt	- Atualiza linguagem do navegador firefox para PT
# SAMBA			- Compartilhamento de arquivos
# Google-chrome		- Navegador
# WPSOffice		- Cria e edita documentos, parecido com o Microsoft Office
# Wine		    	- Emula windows dentro do linux, colocado exclusivamente para rodar o Internet Explorer (sies.saude.gov.br) necessita deste navegador.
# WARSAW            	- Módulo de segurança para o ministério da saúde. 
# EMBRAFIRE         	- Firewall do Gerson
# ANYDESK           	- Suporte Remoto 
# Milhãovus         	- Milvus, programa de gerenciamento  
#
# Ultima Atualização -	 20/02/2021
# Criado em - 		 09/10/2019



#################################################################
#--------------------------INICIO-------------------------------#
#################################################################
if [ "$UID" -ne 0 ]
then
echo -e "\033[40;31;1m Por Favor, execute como ROOT. \033[0m"
exit 0  
fi




echo -e "\033[40;33;1m Você quer instalar os programas? s/n \033[0m  "
read pacote
 
if [ "$pacote" == "s" ]; then

#-----------------------------------------


export USUARIO="$(users)"

i=$(echo " $USUARIO" | wc -w)

if [ $i -gt 1 ]
then
	echo -e "\033[40;31;1m Por Favor, primeiro faça logoff de todos os outros usuários conectados ao sistema. \033[0m"
exit 0  

else
	echo -e "\033[40;32;1m Tudo Ok... será instalado no usuario $USUARIO.\033[0m"

	
#------------------------------------------	
		
echo -e "\033[40;33;1m Posso prosseguir? s/n \033[0m  "
read prossiga

if [ "$prossiga" == "s" ]; then


#----------------------------------------------------------------
#################################################################
#---------------------REMOVE--------------------#
#################################################################

	chmod +x principal/scripts_programas/remove.sh
	source principal/scripts_programas/remove.sh
               


#################################################################
#--------------------------EMBRAFIRE----------------------------#
#################################################################

       #chmod +x principal/scripts_config/config_embrafire.sh
       #source   principal/scripts_config/config_embrafire.sh




#################################################################
#---------------------Atualização do sistema--------------------#
#################################################################

	chmod +x principal/scripts_programas/atualiza.sh
	source principal/scripts_programas/atualiza.sh
  
  
  
  
#################################################################
#----------------------PROGRAMAS BASICOS------------------------#
#################################################################


	chmod +x principal/scripts_programas/basicos.sh
	source principal/scripts_programas/basicos.sh



#################################################################
#------------------------GOOGLE-CHROME--------------------------#
#################################################################


	#chmod +x principal/scripts_programas/googlechrome.sh
	#source principal/scripts_programas/googlechrome.sh




#################################################################
#-----------------------ANYDESK------------------------------#
#################################################################


 	chmod +x principal/scripts_programas/anydesk.sh
	source principal/scripts_programas/anydesk.sh




#################################################################
#-----------------------WPS-OFFICE------------------------------#
#################################################################


 	chmod +x principal/scripts_programas/wpsoffice.sh
	source principal/scripts_programas/wpsoffice.sh




#################################################################
#----------------------------WARSAW-----------------------------#
#################################################################


	 chmod +x principal/scripts_programas/warsaw.sh
	source principal/scripts_programas/warsaw.sh





#################################################################
#----------------------ATUALIZA NOVAMENTE-----------------------#
#################################################################

        source principal/scripts_programas/atualiza.sh


		
	
	
#---------------------------------------------------------------





#################################################################
#################################################################
##--------------------CONFIGURAÇÂO PROGRAMAS-------------------##
#################################################################
#################################################################




#################################################################
#-------------------------CONFIGURA TEMA------------------------#
#################################################################

	
	chmod +x principal/scripts_config/config_theme.sh
	source principal/scripts_config/config_theme.sh




#################################################################
#-------------------------CONFIGURA LANÇADORES------------------#
#################################################################

	
	chmod +x principal/scripts_config/config_icons.sh
	source principal/scripts_config/config_icons.sh


#################################################################
#-------------------------LOGOS------------------------#
#################################################################

	
	chmod +x principal/scripts_config/logos.sh
	source principal/scripts_config/logos.sh



#################################################################
#-------------------------AUTO START----------------------------#
#################################################################

	chmod +x principal/scripts_config/auto_start.sh
	source principal/scripts_config/auto_start.sh






#----------------------------FIM DO PROGRAMA--------------------------------------------

    echo -e "\033[40;31;1m Ajustando programas removidos 'autoremove' \033[0m"
    apt autoremove -y
    sleep 3

	unset $USUARIO
 
	echo -e "\033[40;31;1m Reiniciando o sistema \033[0m"
	sleep 6 
	reboot 


	else
		exit 0
		
	fi
fi
fi
