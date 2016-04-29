#!/bin/bash

pid=$(cat docker-nginx.pid)

docker exec -i $pid /usr/sbin/nginx -t &&
docker exec -i $pid /usr/sbin/service nginx reload

