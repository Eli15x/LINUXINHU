
#Lembrar executar arquivo cd até o diretorio depois ./proj.txt
#lembrar alterar permissoes chmod +x (execução) proj.txt

while [ true ]; do
clear
echo "--------Grupos-------"
echo " "
echo "1 - Criar novo grupo."
echo "2 - Alterar o nome de um grupo criado."
echo " "
echo "--------Usuário--------"   
echo "3 - Criar novo usuário."
echo " "
echo "------Permissões-------"
echo " "
echo "4 - Modificar o dono de um arquivo ou diretório."
echo "5 - Modificar o grupo do dono de um arquivo ou diretório."
echo "6 - Modificar as permissões de um grupo ou diretório separadamente"
echo "para o dono,para o grupo e para outros:"
echo " "
echo "---------------------------------------"
echo "digite o Número do que você quer fazer:"

read opcao_escolhida
clear
case $opcao_escolhida in

  1) echo "Qual será o nome do novo grupo?"
  read nomeGrupo
  groupadd $nomeGrupo
  echo
  echo "Grupo '$nomeGrupo' criado com sucesso! (Caso não tenha mostrado uma mensagem de erro acima)"
  echo
  echo "Pressione [ENTER] para voltar"
  read
  ;;

  2) /etc/group 
  echo 
  echo "Grupos existentes acima"
  echo
  echo "Deseja alterar o nome de qual grupo?"
  read nomeGrupoAlterar
  echo
  echo "Qual será o novo nome?"
  read nomeGrupoNovo
  
  groupmod -n $nomeGrupoNovo $nomeGrupoAlterar
  
  echo
  echo "Nome de grupo alterado com sucesso para $nomeGrupoNovo (Caso não tenha mostrado uma mensagem de erro acima)"
  echo
  echo "Pressione [ENTER] para voltar"
  read
  ;;

  3)
     echo "Qual o Nome do novo usuário?"
     read nomeUsuario
     adduser $nomeUsuario
     echo "Usuário criado com sucesso"
     echo "Pressione [ENTER] para voltar"  
     read
     ;;


  4) 
     echo "(ESSE COMANDO NÃO FUNCIONA COM PASTA ROOT OU ARQUIVOS DENTRO DELA!)"
     echo " "
     echo "Sintaxe para caminho do arquivo:"
     echo "(nomeX/nomeY/NomeZ.txt ->se arquivo)"
     echo "(nomeX/nomeY/NomeZ ->se diretório) :"
     echo "Caso o arquivo esteja no sistema de arquivos sintaxe será:"
     echo "(/nomeX/nomeY...)"
     echo " "
     echo "Selecione o caminho para o arquivo com a seguinte sintaxe" 
     
     read caminho
     echo "Quem será o novo dono desse arquivo ou diretório?"
     read usuario
     chown $usuario $caminho
     echo "Dono do arquivo/diretório modificado com sucesso"
     echo "Pressione [ENTER] para voltar"  
     read
     ;;
     

  5) echo "Pressione [ENTER] para voltar"  
     read
     ;;
 
 6)  echo "Digite o caminho que deseja mudar a permissão:(ex. /eu/eula.txt)"
     read arquivo
     echo "--------------------------------------------"
     echo "A quem voce deseja dar permissão? (g/u/o). g para grupo,"
     echo "u pra usuario e o para outros"
     read  opcao_tipo
     echo "Oque você deseja dar ao dono/usuario/grupo?"
     echo "1 - Nenhuma permissão"
     echo "2 - Execução"
     echo "3 - Escrita"
     echo "4 - Escrita e execução"
     echo "5 - Leitura"
     echo "6 - Leitura e execução"
     echo "7 - Leitura e escrita"
     echo "8 - Leitura,escrita e execução"
     echo "Digite o número correspondente:"
     read opcao

echo "$opcao_tipo"
case $opcao in
 

   1) chmod $opcao_tipo-rwx arquivo
      echo "Pressione [ENTER] para voltar"
      read
      ;;   

   2) echo "Pressione [ENTER] para voltar"
      read
       ;;   



   3)  echo "Pressione [ENTER] para voltar"
      read
      ;;   



   4) 
      echo "Pressione [ENTER] para voltar"
      read
      ;;   



   5) chmod $opcao_tipo+r arquivo
      echo "Pressione [ENTER] para voltar"
      read
      ;;   



   6) chmod $opcao_tipo+rx arquivo
      echo "Pressione [ENTER] para voltar"
      read
      ;;   



   7) chmod $opcao_tipo+rw arquivo
      echo "Pressione [ENTER] para voltar"
      read
      ;;   



   8) chmod $opcao_tipo+rwx arquivo
      echo "Pressione [ENTER] para voltar"
      read
      ;;   

esac

esac
done





