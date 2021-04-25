# icompose
Deploy django+uswgi+nginx+redis+MYSQL containers in a single linux host with docker compose

# Setup steps
1. Build docker images with docker compose
sudo docker-compose build

2. Start contianer services
sudo docker-compose up

# Debug

## Nginx Container: inspect error.log in mounted host volume, path: /compose/nginx/log
cd compose/nginx/log
sudo cat error.log
### 502 error or connection error is usually caused by uwsgi setting and django project issue

## Web Container: check uwsgi log, execute start script, run python manage.py command in container, check uwsgi status
docker-compose logs web
docker-compose exec web /bin/bash start.sh
docker-compose exec web /bin/bash
ps aux | grep uwsgi
cd /tmp
### exited with code 0 error
#### add following in docker-compose
stdin_open: true
tty: true
#### add following in start.sh script
tail -f /dev/null
### check settings.py database settings, check if container is communicating in db_network

## db:
docker-compose exec db /bin/bash
mysql -u usernmae -p;
USE dbname;
SHOW tables;
DELETE from tablenames;
DROP TABLE tablenames; # Django migration table
