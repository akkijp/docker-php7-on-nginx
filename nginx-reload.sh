#!/bin/bash

if [ -f docker-nginx.pid ]; then
  pid=$(cat docker-nginx.pid)
else
  echo "pid file Not foud!" >&2
  exit -1
fi

docker exec -i $pid /usr/sbin/nginx -t &&
docker exec -i $pid /usr/sbin/service nginx reload

