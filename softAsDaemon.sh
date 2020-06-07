 #!/bin/sh

####### Instructions #######
#1) Copier softAsDeamon.sh dans /etc/init.d/ (en tant que root)
#2) Mettre les bon droits (700 ou 755)
#3) Vérifier que /etc/init.d/softAsDeamon.sh start (stop et restart) fonctionnent
#4) Ajouter le service : sudo update-rc.d softAsDeamon.sh defaults
#Remarque : Pour retirer le service : sudo update-rc.d -f softAsDeamon.sh remove

#Mettre le nom du fichier/programme à lancer au démarrage
nomProgramme="test.py"
#Mettre le chemin absolu d'accès au programme à lancer
chemin="/home/hack/Bureau"

start()
{
        echo "******* Démarrage $nomProgramme *******"
	$chemin/$nomProgramme &
}

stop()
{
        echo "******* Arrêt $nomProgramme *******"
	pkill  $nomProgramme 
}

restart()
{
	echo "******* Redémarrage $nomProgramme *******"
	stop
	sleep 2
	start
}

case $1 in
	start)
		start;;
	stop)
		stop;;
	restart)
		restart;;
	*)	
		start;;
esac
