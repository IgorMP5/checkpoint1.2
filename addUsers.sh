#!/bin/bash

#Verification de la presence d arguments
if [ $# -eq 0 ];
then
    echo "Il manque les noms d'utilisateurs en argument - fin du script"
    exit 1
fi

# Verif de l existence des noms d utlisateur
for user in "$@"
do
  if cat /etc/passwd | grep -q $user
  then
    echo "L'utilisateur $user existe déja"
  else
      # creation du new user
      useradd $user

      # verif de la creation
      if [ $? -eq 0 ];
      then
        echo "Creation de $user reussi"
      else
        echo "Erreur lors de la creation de $user"
      fi
  fi
done
