# On build les deux images en se déplaçant dans les répertoires où se situe les docker build
cd nginx
docker build -t webserver .

cd ..
cd php
docker build -t phpbackend .

cd ..
docker run -d -p 9000:9000 -v ${PWD}/data/:/var/www/html/ --name phpbackend phpbackend
docker run -d -p 8000:80 -v ${PWD}/data/:/var/www/html/ --link phpbackend webserver
