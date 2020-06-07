#!/bin/sh

if [ $# -ne 2 ]
then
	echo "Erreur : Mauvais nombre de paramètres\n-> Usage : ./gitAutoConfig.sh nomUtilisateur email"
	exit 1
fi

git help -a > /dev/null
if [ $? -ne 0 ]
then
	echo "Erreur : Git non installé !"
	exit 2
fi
echo "---> Vérificaion installation de Git OK"

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

git config --global user.name "$1"
git config --global user.email $2


echo "---> Configuration Git OK"
echo "Etat actuel de la configuration :"
cat ~/.gitconfig 
echo "Pour visualiser/éditer la configuration : ~/.gitconfig"
exit 0
