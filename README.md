## Nginx Dockerfile


This repository contains **Dockerfile** of [Nginx](http://nginx.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/nginx/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull k4zzk/nginx`

   (alternatively, you can build an image from Dockerfile: `docker build -t="k4zzk/nginx" github.com/k4zzk/nginx`)


### Usage

    docker run -d -p 80:80 k4zzk/nginx

#### Attach persistent/shared directories

    ./docker-run.sh

After few seconds, open `http://<host>` to see the welcome page.
