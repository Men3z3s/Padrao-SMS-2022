#!/bin/bash
#
# wpsoffice.sh
#
# Instala o WPS-OFFICE atravez de pacote ja baixado no diretório /home/smscamboriu/Downloads/padrao_sms/principal/scripts_programas/
# Instala a tradução do WPSOFFICE atraves de pacote ja baixado no diretório /home/smscamboriu/Downloads/padrao_sms/principal/scripts_programas/
# Adicionado inicialização do WPSOFFICE afim de criar caminho necessário usado no plank
# Nova Versão 28/02/2020
# Comentado linhas de inicialização automática do programa (ridículo isso) 24/09/2020
#
#
# Menezes 20/08/2019
#
#
#
#---------------------------WPS-OFFICE-----------------------------
echo -e "\033[40;33;1m Instalando o WPS-Office. \033[0m"
sleep 1
#removendo instalações antigas
#       sudo apt remove wpsoffice
#       sudo    rm -rf /opt/wpsoffice*
#       sudo    rm -rf /opt/share/applications/wpswriter.desktop
#       sudo    rm -rf /opt/share/applications/wpspresentation.desktop
#       sudo    rm -rf /opt/share/applications/wpsspreadsheets.desktop

# Instalando via pacote gdeb 




         if ! dpkg -i principal/pacotes/wps-office.deb            
              dpkg -i principal/pacotes/wps-office-language-pt-br-osistematico_4.0.deb	 #tradução

#-----------------------------------------------------------------------------------------
    




#------------------------------Outras possibilidades de instalação------------------------

# Instalando via pacote compactado
#download 64 bits

#if ! wget http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_10.1.0.6757_x86_64.tar.xz -O wpsoffice.tar.xz

#if ! /home/smscamboriu/Downloads/Linux/instala_programas/wpsoffice.tar.xz

#Descompactar 
#       tar Jxf wpsoffice.tar.xz -C /opt/

#Renomear
#       mv /opt/wps*/ /opt/wpsoffice

# Criando Lançadores
#       sudo echo -e '[Desktop Entry]\n Version=1.0\n Name=wpswriter\n Exec=/opt/wpsoffice/wps\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wpsmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpswriter.desktop
#       sudo echo -e '[Desktop Entry]\n Version=1.0\n Name=wpspresentation\n Exec=/opt/wpsoffice/wpp\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-wppmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpspresentation.desktop
#       udo echo -e '[Desktop Entry]\n Version=1.0\n Name=wpsspreadsheets\n Exec=/opt/wpsoffice/et\n Icon=/opt/wpsoffice/resource/icons/hicolor/256x256/apps/wps-office-etmain.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/wpsspreadsheets.desktop


        then
                echo -e "\033[40;31;1m Não foi possivel instalar o WPS-Office. \033[0m"
	else
                echo -e "\033[40;32;1m WPS-Office instalado com  sucesso! \033[0m"
sleep 2


 	#echo -e "\033[40;34;1m Iniciando o WPSOFFICE. \033[0m"
	#if ! wpsoffice &		
	
	#then		
	#echo -e "\033[40;31;1m Não foi possivel iniciar o WPSOFFICE. \033[0m"
	
	#fi 
	#echo -e "\033[40;32;1m WPSOFFICE iniciado. \033[0m"
		








echo ""
fi
#------------------------------------------------------------------



