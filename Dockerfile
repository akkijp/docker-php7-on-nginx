#
# Nginx Dockerfile
#
# https://github.com/k4zzk/docker-nginx
#

# Pull base image.
FROM ubuntu:14.04
MAINTAINER Kosuke Akizuki <thehackerslog.gmail.com>

# Install Nginx.
RUN apt-get update
RUN apt-get upgrade
RUN \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update
RUN \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/usr/share/nginx/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx", "-g", "daemon off;"]

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
