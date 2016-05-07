#
# Nginx Dockerfile
#
# https://github.com/k4zzk/docker-php7-on-nginx
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Kosuke Akizuki <thehackerslog@gmail.com>

# from http://askubuntu.com/questions/393638/unicodedecodeerror-ascii-codec-cant-decode-byte-0x-in-position-ordinal-n
ENV LANG=ja_JP.UTF-8

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  locale-gen ja_JP.UTF-8

# Install Nginx.
RUN \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  chown -R www-data:www-data /var/lib/nginx

# Install php7.
# from https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-php-7-on-ubuntu-14-04
RUN \
  add-apt-repository -y ppa:ondrej/php && \
  apt-get update && \
  apt-get install -y php7.0 php7.0-fpm && \
  sed -i -e "s/;\?mbstring[.]language.*/mbstring.language = Japanese/g" /etc/php/7.0/fpm/php.ini && \
  sed -i -e "s/;\?date[.]timezone.*/date.timezone = \"Asia\/Tokyo\"/g" /etc/php/7.0/fpm/php.ini && \
  sed -i -e "s/;\?default_charset/default_charset = \"UTF-8\"/g" /etc/php/7.0/fpm/php.ini && \
  mkdir -p /run/php

# Cleanup
RUN \
  rm -rf /var/lib/apt/lists/*

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/usr/share/nginx/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD php-fpm7.0 && nginx -g "daemon off;"

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
