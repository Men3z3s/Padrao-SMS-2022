#!/bin/bash

echo -e "\033[40;33;1m Você quer uma impressora? s/n \033[0m  "
read impressora
 
if [ "$impressora" == "s" ]; then

echo -e "Selecione a marca da impressora"
select marca in Brother HP Pular
do

    case $marca in
        Brother)
            chmod +x /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 
            
            echo -e "Selecione o modelo"
            select modelo in DCP-8112DN DCP-8157DN MFC-8712DW MFC-8912DW MFC-8952DW Outro 
            do
                case $modelo in
                    DCP-8112DN) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 DCP-8112DN ;;
                    DCP-8157DN) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 DCP-8112DN ;;
                    MFC-8712DW) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 DCP-8112DN ;;
                    MFC-8912DW) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 DCP-8112DN ;;
                    MFC-8952DW) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 DCP-8112DN ;;
                    Outro) source /home/smscamboriu/Downloads/padrao_sms/principal/impressora/brother/linux-brprinter-installer-2.2.1-1 ;;
                    *) echo "Escolha uma opção" ;;
                esac
            done
            ;;
       



         HP)

            echo "Nenhuma impressora cadastrada, fazer manualmente pelo site da HP."
            sleep 2
            exit ;;

            # PARA HP FAZER O MESMO ESQUEMA
            # chmod +x ...
            #echo -e "Selecione o modelo"
            #select modelo in :'Colocar os modelos da HP aqui' Outro 
            #do
             #   case $modelo in
              #      :'Modelo Selecionado') source :'Caminho' ;;
               #     Outro) Escreva ;;
                #esac
            #done
            #;;




        Pular) exit ;;

         *) echo "Escolha uma opção" ;;


    esac
done

else
		exit 0 
		
	fi		


