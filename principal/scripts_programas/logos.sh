#!/bin/bash
#
# copia_imagens.sh
#
#
# Copia pasta imagens para imagens e deixa oculta no sistema
#
# Menezes 09/10/2019
#

#----------------------------------CONFIGURANDO O TEMA -----------------------



cp -r logos /home/$USUARIO/Imagens/
mv /home/$USUARIO/Imagens/logos  /home/$USUARIO/Imagens/.logos

