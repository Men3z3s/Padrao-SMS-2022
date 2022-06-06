#!/bin/bash
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
#Vale lembrar que uma vez que os passos 1 e 2 tenham sido feitos, o computador ativará automaticamente o embrafire na inicialização.
#
#
#-----------------------------------------------------------
# Nome:         embrafire
# Data:         2019-09-06
# Autor:        Gerson Pereira (Embracore TI)
#-----------------------------------------------------------


sites_permitidos='
camboriu.sc.gov.br
www.camboriu.sc.gov.br
embracore.com.br
www.embracore.com.br
www.laboratoriocamboriu.com.br
laboratoriocamboriu.com.br
sys.laboratoriocamboriu.com.br
177.124.0.99
45.4.112.0/22
177.67.201.250
191.6.192.0/19
52.84.232.0/22
cadastro.saude.gov.br
saude.gov.br
camboriu.celk.com.br
8.8.8.8
8.8.4.4
177.124.0.0/21
208.67.222.222
208.67.220.220
'


# Segue lista de palavras a serem bloqueadas: 
palavras='
globoplay
cartola
xvideos
beeg
redtube
novela
facebook
twitter
instagram
torrent
porno
xxx
game
'


unifique='
	138.97.136.0/22
	143.255.220.0/22
	177.54.0.0/20
	177.74.208.0/20
	177.74.208.0/21
	177.101.96.0/19
	177.101.96.0/20
	177.104.0.0/20
	177.130.224.0/20
	177.200.192.0/19
	179.127.160.0/19
	179.127.160.0/23
	179.127.162.0/23
	179.127.164.0/24
	179.127.165.0/24
	179.127.166.0/24
	179.127.167.0/24
	179.127.168.0/23
	179.127.172.0/23
	179.127.174.0/23
	179.127.176.0/21
	179.190.96.0/19
	179.190.96.0/24
	179.190.98.0/23
	179.190.110.0/23
	179.190.112.0/20
	186.209.16.0/21
	186.209.24.0/21
	187.85.160.0/20
	187.85.176.0/20
	187.108.208.0/20
	189.45.192.0/20
	189.45.200.0/22
	189.45.206.0/24
	191.253.96.0/19
'

####################################################################
		# NÃO ALTERAR DAQUI PARA BAIXO #
####################################################################


# Carregar módulos necessários
#-----------------------------
modprobe ip_tables
modprobe ipt_LOG
modprobe ipt_limit
modprobe ipt_multiport
modprobe ipt_owner
modprobe ipt_state
modprobe ipt_tcpmss
modprobe ipt_time
modprobe iptable_filter



# limpa todas as regras
#----------------------
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F



# exclui chains criadas
#----------------------
iptables -t filter -X
iptables -t nat -X
iptables -t mangle -X



# zera contador
#--------------
iptables -t filter -Z
iptables -t nat -Z
iptables -t mangle -Z


case $1 in

	--stop)

		echo "Desativando firewall..."
		# POLITICAS
		#----------
		iptables -P INPUT ACCEPT
		iptables -P FORWARD ACCEPT
		iptables -P OUTPUT ACCEPT

		;;


	*)

		echo "ATIVANDO firewall..."

		# POLITICAS
		#----------
		iptables -P INPUT DROP
		iptables -P FORWARD DROP
		iptables -P OUTPUT ACCEPT




		# regras básicas de segurança
		#----------------------------
		echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
		echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
		echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
		echo 1 > /proc/sys/net/ipv4/tcp_syncookies




		# segurança contra spoof ip
		#--------------------------
		echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter




		# Proteção contra ping de morte | aceita ping na rede interna
		#------------------------------------------------------------
		iptables -A INPUT   -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
		iptables -A INPUT   -p icmp --icmp-type echo-reply   -m limit --limit 1/s -j ACCEPT



		# mantém as conexões já estabelecidas e relacionadas
		#---------------------------------------------------
		iptables -A   INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
		iptables -A  OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT



		# SAMBA - LAN
		iptables -A   INPUT -p udp --dport 137 -j ACCEPT
		iptables -A   INPUT -p udp --dport 138 -j ACCEPT
		iptables -A   INPUT -p tcp --dport 139 -j ACCEPT
		iptables -A   INPUT -p tcp --dport 445 -j ACCEPT



		# permite conexões loopback
		#--------------------------
		iptables -A INPUT -i lo -j ACCEPT
		iptables -A OUTPUT -o lo -j ACCEPT
		iptables -A FORWARD -i lo -j ACCEPT



		# Proibir palavras
		#-----------------
		for palavra in $palavras ; do
			iptables -I FORWARD -m string --algo bm --string "$palavra" -j DROP
			iptables -I INPUT   -m string --algo bm --string "$palavra" -j DROP
		done




		# Sites permitidos
		#-----------------
		for site in $sites_permitidos ; do
			iptables -I FORWARD -d $site -j ACCEPT
			iptables -I FORWARD -s $site -j ACCEPT
			iptables -I INPUT   -s $site -j ACCEPT
		done



		# Blocos da unifique
		#-------------------
		for bloco in $blocos ; do
			iptables -I FORWARD -d $bloco -j ACCEPT
			iptables -I FORWARD -s $bloco -j ACCEPT
			iptables -I INPUT   -s $bloco -j ACCEPT
		done


		# Liberação para resolução de nomes (DNS)
		iptables -I INPUT   -p udp --dport 53 -j ACCEPT
		iptables -I FORWARD -p udp --dport 53 -j ACCEPT



		# INÍCIO:       REGRAS ADICIONAIS DE SEGURANÇA
		#---------------------------------------------


		     # bloqueia ping das demais origens
		     #---------------------------------
		     iptables -A INPUT -p icmp --icmp-type echo-request -j DROP


		     # Bloqueia as portas UDP de 0 à 1023
		     #-----------------------------------
		     iptables -A INPUT -p udp --dport 0:1023 -j DROP


		     # bloqueia qualquer solicitação vinda de qualquer interface
		     #----------------------------------------------------------
		     iptables -A INPUT -p tcp --syn -j DROP


		     # descarta pacotes inválidos
		     #---------------------------
		     iptables -A INPUT -m state --state NEW,INVALID -j DROP

		;;
esac


