# Python Environment

FROM python

# install netcat
RUN apt-get update && apt install netcat -y

# Author
MAINTAINER Dan

# Setup python environment
ENV PYTHONDONTWRITEBYTECODE 1 #STOP python from generating bytecode in development folder
ENV PYTHONUNBUFFERED 1 #Send output straight to container log and django log without buffering

# Add workdir path to environment variable, then create project folder.
ENV APP_HOME=/var/www/html/icompose
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Copy project from host to contariner workdir
ADD . $APP_HOME

# Upgrade pip version
RUN /usr/local/bin/python -m pip install --upgrade pip

# Install project dependancy
RUN pip install -r requirements/development.txt

# Set start script to executable
RUN chmod +x start.sh

# Start start script to migrate data and initialize uwsgi
# ENTRYPOINT https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint
ENTRYPOINT /bin/bash ./start.sh
