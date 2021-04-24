#!/bin/bash

# 1. Wait until MySQL server starts before running follow script
while ! nc -z db 3306 ; do
	echo "waiting for MySQL server"
	sleep 3
done
# 2. Collect static files
python manage.py collectstatic --noinput
# 3. Create migrations file and migrate to database
python manage.py makemigrations
python manage.py migrate
# 4. use uwsgi to strat Django project
uwsgi --ini /var/www/html/icompose/uwsgi.ini
# 5. tail command, prevent web container exit when after script is finished
tail -f /dev/null
# 6. point to new command line arguments
exec "$@"
