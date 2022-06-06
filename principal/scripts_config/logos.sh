#!/bin/bash
#
# logos.sh
#
#
# Copia pasta imagens para imagens e deixa oculta no sistema
#
# Menezes 09/10/2019
#

#----------------------------------COPIANDO PASTA LOGOS -----------------------


cp -r logos /home/$USUARIO/Imagens/
mv /home/$USUARIO/Imagens/logos  /home/$USUARIO/Imagens/.logos

#------------------------------- CONFIGURANDO IMAGEM MUGSHOT------------------

#smscamboriu
cp .logos/login_sms.png /home/$USUARIO/
mv /home/$USUARIO/login_sms.png /home/$USUARIO/.face


#embracore
cp logos/login_embracore.jpg /home/embracore/
mv /home/embracore/login_embracore.jpg /home/embracore/.face

