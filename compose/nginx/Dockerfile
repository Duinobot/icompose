# use nginx base image
FROM nginx

# remove original configuration files
RUN rm /etc/nginx/conf.d/default.conf
# create folders for static files and ssl certificate
RUN mkdir -p /usr/share/nginx/html/static
RUN mkdir -p /usr/share/nginx/html/media
RUN mkdir -p /usr/share/nginx/ssl

# set media user gourp and user to www-data, give read and execute permission
RUN chown -R www-data:www-data /usr/share/nginx/html/media
RUN chmod -R 775 /usr/share/nginx/html/media

# add confi file from host nginx directory
ADD ./nginx.conf /etc/nginx/conf.d/

# prevent docker container halting after initialization, https://stackoverflow.com/questions/18861300/how-to-run-nginx-within-a-docker-container-without-halting
CMD ["nginx", "-g", "daemon off;"]

