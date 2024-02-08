#! /bin/bash 
# Script Billy Butcher pour exporter les plannings de TaskJuggler du fichier source vers les fichiers précisés dans les options d'export
# Par défaut, va envoyer les fichiers exportés vers le chemin d'accès par défaut des fichiers web d'Apache Web Server
# 
# Scripté avec amour par Beck 'Brookie' Brook en 2024



#Nom du fichier à compiler
FICHIER_TJP="/chemin/complet/vers/fichier.tjp"

#date de la dernière compilation du .TJP 
DATE_COMPILATION=$(tail -n 1 date.txt)

#Date de la dernière modification du fichier source : à quelle date a été modifié le fichier .tjp pour la dernière fois
DATE_MODIFICATION=$(date -r ${FICHIER_TJP} '+%d/%m/%Y %H:%M:%S')

#Comparaison entre la date de dernière modification du fichier .TJP et la date enregistrée dans le fichier date (= date du dernier export)
#
#Si les deux dates coïncident, alors Billy ne fait rien. Si elles sont différentes, alors l'export est lancé

if ["$DATE_MODIFICATION" != "$DATE_COMPILATION"];
then
	#Commande pour la compilation 
	tj3 [/chemin/complet/vers/]fichier.tjp
	
	if mv -t /var/www/html * html;
	   mv -t /var/www/html/css [/chemin/complet/vers/]BillyButcher/css/*;
	   mv -t /var/www/html/scripts [/chemin/complet/vers/]BillyButcher/scripts/*;
	   mv -t /var/www/html/icons [/chemin/complet/vers/]BillyButcher/icons/*;
	then
	

	echo "Le planning vient d'être mis à jour *sip*"
  #Rajoute la date de compilation au fichier texte
  echo ${DATE_MODIFICATION} >> date.txt

	else
	
	echo "La compilation a échoué"
	
	fi
else

	echo "le planning est déjà à jour"
fi


