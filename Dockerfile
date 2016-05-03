#
# Nginx Dockerfile
#
# https://github.com/k4zzk/docker-nginx
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Kosuke Akizuki <thehackerslog.gmail.com>

ENV LANG=en_US.UTF-8

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  locale-gen en_US.UTF-8

# Install Nginx.
RUN \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Install php7.
# from https://www.digitalocean.com/community/tutorials/how-to-upgrade-to-php-7-on-ubuntu-14-04
RUN \
  add-apt-repository -y ppa:ondrej/php && \
  apt-get update && \
  apt-get install -y php7.0 php7.0-fpm

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/usr/share/nginx/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx", "-g", "daemon off;"]

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
