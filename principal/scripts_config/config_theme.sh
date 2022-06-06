#!/bin/bash
#
# config.theme.sh
#
#
# Configura a aparência substituindo alguns arquivos na pasta /home/menezes/.config/xfce4/xfconf/xfce-perchannel-xml/
#
# Estilo    - Mint-Y-Aqua
# Icone     - Moka
# Desktop smscamboriu   - tara_wjusten_machu_picchu.jpg
# Desktop Embracore     - wallpaper_embracore.jpg
#
#
# Menezes 11/10/2019
#

#----------------------------------CONFIGURANDO O TEMA -----------------------

# SMS-Camboriú

cp principal/mod_xfce/sms/* /home/$USUARIO/.config/xfce4/xfconf/xfce-perchannel-xml/

# Embracore

cp principal/mod_xfce/embracore/* /home/embracore/.config/xfce4/xfconf/xfce-perchannel-xml/



