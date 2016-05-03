## Docker: Ubuntu, Nginx and PHP Stack


This repository contains **Dockerfile** of [PHP7](http://www.php.net/) on [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://hub.docker.com/r/k4zzk/php7-on-nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/k4zzk/php7-on-nginx//) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull k4zzk/php7-on-nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="k4zzk/php7-on-nginx" github.com/k4zzk/docker-php7-on-nginx`)


### Usage

    docker run --privileged -d -p 80:80 k4zzk/php7-on-nginx

#### Attach persistent/shared directories

```bash
git clone https://github.com/k4zzk/docker-php7-on-nginx.git && cd docker-php7-on-nginx
./docker-run.sh
```

After few seconds, open `http://<host>` to see the welcome page.
