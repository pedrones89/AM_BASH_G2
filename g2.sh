#!/bin/bash
clear
Menu(){
   echo "-------------------------------------------------"
   echo "|                   Grau 2                      |"
   echo "-------------------------------------------------"
   echo " Aluno:   Pedro Teixeira                        |"
   echo "-------------------------------------------------"
   echo "-------------------------------------------------"
   echo " Prof.:   Diego Tumelero                        |"
   echo "-------------------------------------------------"
   echo "Data 10/12/2018 - Prog. em Redes de Computadores|           "
   echo "-------------------------------------------------"
   echo "-------------------------------------------------"
   echo "|         tecle enter para continuar...         |"
   echo "-------------------------------------------------"
read
clear
   echo "------------------------------------------------"
   echo "|         Script Para Cópia de arquivos        |"
   echo "------------------------------------------------"
   echo "|         Remoto > local | local > Remoto      |"
   echo "------------------------------------------------"
   echo "|        Código Fonte auto-explicativo         |"
   echo "------------------------------------------------"
   echo "------------------------------------------------"
   echo "|         tecle enter para continuar...        |"
   echo "------------------------------------------------"
read
clear
   echo "------------------------------------------------"
   echo "|                     MENU                     |"
   echo "------------------------------------------------"
   echo "|       Escolha uma das Opções abaixo:         |"
   echo "------------------------------------------------"
   echo "[ 1 ] Realizar Cópia Utilizando o SCP   "
   echo "[ 2 ] Realizar Cópia Utilizando Rsync   "
   echo "[ 3 ] Listar Diretório com Rsync        "
   echo "[ 4 ] Sair"
   echo
   echo -n "Qual a opcao desejada ? "
   read opcao
   case $opcao in
      1) cp_r_r_scp;;
      2) cp_r_l_rsync;;
      3) list_rsync ;;
      4) exit ;;
      *) "Opcao desconhecida." ; echo ; Principal ;;
   esac
}
cp_r_r_scp() {
echo "================================================="
echo "=                                               ="
echo "=      Iremos direcionar sua cópia via SCP      ="
echo "=                                               ="
echo "================================================="
echo "=        Tecle enter para continuar...          ="
echo "================================================="
read 
clear
echo "================================================="
echo "=                                               ="
echo "=          Digite a origem do arquivo:          ="
echo "=                                               ="
echo "= Qual Path está o arquivo? Ex.: /home/user/Xyz ="
echo "= Obs.: Possuí CASE SENSITIVE                   ="
echo "================================================"
read origem_scp
clear
echo "==========================================================="
echo "=                                                         ="
echo "=           Digite o destino do arquivo:                  ="
echo "=                                                         ="
echo "= Qual Path deverá receber o arquivo? Ex.: /home/user/Xyz ="
echo "= Obs.: Possuí CASE SENSITIVE                             ="
echo "==========================================================="
read dest_scp
clear
echo "====================================================================================="
echo "=                                                                                   ="
echo "= Digite o IP da estação/servidor(remoto ou não) Origem:  | formato xxx.xxx.xxx.xxx ="
echo "=                                                                                   ="
echo "====================================================================================="
read ip_origem
clear
echo "========================================================================================"
echo "=                                                                                      ="
echo "= Digite o IP da estação/servidor(remoto ou não) Destino:  | formato xxx.xxx.xxx.xxx   ="
echo "=                                                                                      ="
echo "========================================================================================"
read ip_dest
clear
echo "================================================"
echo "=                                              ="
echo "= Digite a porta do serviço SSH:               ="
echo "=                                              ="
echo "================================================"
read porta
clear
echo "================================================"
echo "                                                "
echo "Deseja Copiar todos as pastas e sub-pastas? s/n "
echo "                                                "
echo "================================================"
read copia_geral
clear
echo "================================================="
echo "=                                               ="
echo "= Digite o usuário de acesso:                   ="
echo "=                                               ="
echo "================================================="
read usr_scp
clear
par="-r" #parametro de cópia de todos arquivos, -r para recursivo
por="-P" #adição da porta para conexão
parameters=`echo "$par $por $porta"`
parameters2=`echo "$por $porta"`
login=`echo "$usr_scp@$ip_dest"`
if [ $copia_geral == "s" ]; then
	scp $parameters $origem_scp $login:$dest_scp
	echo "=========================================================="
	echo "=                                                        ="
	echo "=     Cópia bem sucedida para: $dest_scp                 ="
	echo "=                                                        ="
	echo "=========================================================="
elif [ $copia_geral == "n"] ; then
	echo "================================================"
	echo "= Digite o nome do arquivo que deseja copiar:  ="
	echo "=                                              ="
	echo "= Ex.: /home/user/meu_arquivo.conf             ="
	echo "================================================"
read arquivo_scp
    scp $parameters2 $arquivo_scp $login:$dest_scp
	echo "==========================================================="
	echo "=                                                         ="
	echo "=     Cópia bem sucedida para: $dest_scp                  ="
	echo "=                                                         ="
	echo "==========================================================="
elif [$copia_geral =! "s"] || [$copia_geral =!"n" ] ; then
	echo "================================================"
	echo "=                                              ="
	echo "=        Nenhum arquivo foi copiado            ="
	echo "=                                              ="
	echo "================================================"
fi
	Menu
}

cp_r_l_rsync() {
echo "================================================="
echo "=                                               ="
echo "=      Iremos direcionar sua cópia via Rsync    ="
echo "=                                               ="
echo "================================================="
echo "=        Tecle enter para continuar...          ="
echo "================================================="
read 
clear
echo "================================================="
echo "=                                               ="
echo "=          Digite a origem do arquivo:          ="
echo "=                                               ="
echo "= Qual Path está o arquivo? Ex.: /home/user/Xyz ="
echo "= Obs.: Possuí CASE SENSITIVE                   ="
echo "================================================"
read origem_rsync
clear
echo "==========================================================="
echo "=                                                         ="
echo "=           Digite o destino do arquivo:                  ="
echo "=                                                         ="
echo "= Qual Path deverá receber o arquivo? Ex.: /home/user/Xyz ="
echo "= Obs.: Possuí CASE SENSITIVE                             ="
echo "==========================================================="
read dest_rsync
clear
echo "====================================================================================="
echo "=                                                                                   ="
echo "= Digite o IP da estação/servidor(remoto ou não) Origem:  | formato xxx.xxx.xxx.xxx ="
echo "=                                                                                   ="
echo "====================================================================================="
read ip_origem
clear
echo "========================================================================================"
echo "=                                                                                      ="
echo "= Digite o IP da estação/servidor(remoto ou não) Destino:  | formato xxx.xxx.xxx.xxx   ="
echo "=                                                                                      ="
echo "========================================================================================"
read ip_dest
clear
echo "================================================="
echo "=                                               ="
echo "= Digite o usuário de acesso:                   ="
echo "=                                               ="
echo "================================================="
read usr_rsync
clear
echo
echo "Tecle enter para prosseguir..."
echo
echo
echo "Iniciar Cópia? s/n "
read inicio
par="-Cravzp" 
parameters=`echo "$par"`
login=`echo "$usr_rsync@$ip_dest"`
if [ $inicio == "s" ]; then
	rsync $parameters $origem_rsync $login:$dest_rsync
	echo "=========================================================="
	echo "=                                                        ="
	echo "=     Cópia bem sucedida para: $dest_rsync               ="
	echo "=                                                        ="
	echo "=========================================================="
elif [ $inicio == "n"] ; then
	echo "================================================"
	echo "= Digite o nome do arquivo que deseja copiar:  ="
	echo "=                                              ="
	echo "= Ex.: /home/user/meu_arquivo.conf             ="
	echo "================================================"
read arquivo_scp
    rsync $parameters $arquivo_rsync $login:$dest_rsync
	echo "==========================================================="
	echo "=                                                         ="
	echo "=     Cópia bem sucedida para: $dest_rsync                  ="
	echo "=                                                         ="
	echo "==========================================================="
elif [$inicio =! "s"] || [$inicio =!"n" ] ; then
	echo "================================================"
	echo "=                                              ="
	echo "=     DEU RUIM CAMPEÃO, NADA FOI COPIADO       ="
	echo "=                                              ="
	echo "================================================"
fi
	Menu
}

list_rsync() {
echo "================================================="
echo "=                                               ="
echo "=          Listagem de Diretórios               ="
echo "=                                               ="
echo "================================================="
echo "=        Tecle enter para continuar...          ="
echo "================================================="
read 
clear
clear
echo "==========================================================="
echo "=                                                         ="
echo "=           Digite o destino da Pasta:                    ="
echo "=                                                         ="
echo "= Qual Path deverá receber o arquivo? Ex.:/home;/etc;/var;="
echo "= Obs.: Possuí CASE SENSITIVE                             ="
echo "==========================================================="
read dest_list
clear
echo "========================================================================================"
echo "=                                                                                      ="
echo "= Digite o IP da estação/servidor(remoto ou não) Destino:  | formato xxx.xxx.xxx.xxx   ="
echo "=                                                                                      ="
echo "========================================================================================"
read ip_dest
clear
echo "================================================="
echo "=                                               ="
echo "= Digite o usuário de acesso:                   ="
echo "=                                               ="
echo "================================================="
read usr_list
clear
echo "================================================="
echo "=                                               ="
echo "=           Iniciar Listagem? s/n               ="
echo "=                                               ="
echo "================================================="
read begin
par="-Cravzp" 
parameters=`echo "$par"`
login=`echo "$usr_rsync@$ip_dest"`
if [ $begin == "s" ]; then
	rsync $parameters  $login:$dest_list
else [$begin =! "n"];
echo "Voltaremos ao Menu principal..."
echo
echo "Tecle enter para prosseguir...."
echo
read
fi
Menu
}
Menu