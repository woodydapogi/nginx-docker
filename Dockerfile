FROM nginx:latest

# Create sites-available and sites-enabled for configuration files default location.
RUN mkdir /etc/nginx/sites-available/ \
    && mkdir /etc/nginx/sites-enabled/

# Copy the global-master directory and contents.
COPY ./html/global-master /usr/share/nginx/html/global-master

# Copy the configuration file to the configuration file of the nginx container.
COPY ./nginx-config_file.conf /etc/nginx/sites-available/global-master-config.conf

# Copy nginx configuration file.
COPY ./nginx.conf /etc/nginx/nginx.conf

# Creating a soft link for the default website.
RUN ln -s /etc/nginx/sites-available/global-master-config.conf /etc/nginx/sites-enabled/globale-master-config.conf
