
# On build les deux images en se déplaçant dans les répertoires où se situe les docker build
cd nginx
docker build -t webserver .

cd ..
cd php
docker build -t phpbackend .

cd ..
docker run -d -p 9000:9000 -v ${PWD}/data/:/var/www/html/ --name phpbackend phpbackend
docker run -d -p 8000:80 -v ${PWD}/data/:/var/www/html/ --link phpbackend webserver

# On peut utiliser Docker Compose pour builder et lancer les conteneurs automatiquement
# Installez docker-compose sur votre machine hôte

# Pour démarrer vos conteneurs

docker-compose up -d

# Pour les arrêter 

docker-compose down

# Vous pouvez notez :
# - qu'il n'est plus nécessaire de mettre un link, un réseau bridge inter conteneur est crée automatiquement
# - que le conteneur php est démarré avant le serveur Web, c'est la directive 'depends_on' du fichier docker-compose.yaml qui l'indique
