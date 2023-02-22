FROM nginx:latest

# Create directories for the configuration files.
RUN mkdir /etc/nginx/sites-available/ \
    && mkdir /etc/nginx/sites-enabled/

# Copy directory and content of site1 to default location.
COPY ./html/global-master /usr/share/nginx/html/global-master

COPY ./nginx-config_file.conf /etc/nginx/sites-available/global-master-config.conf

# Copy nginx configuration file.
COPY ./nginx.conf /etc/nginx/nginx.conf

# Creating a soft link for the default website.
RUN ln -s /etc/nginx/sites-available/global-master-config.conf /etc/nginx/sites-enabled/globale-master-config.conf
