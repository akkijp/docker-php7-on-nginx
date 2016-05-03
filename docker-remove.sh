#!/bin/sh

if [ -f docker-nginx.pid ]; then
  pid=$(cat docker-nginx.pid)
else
  echo "pid file Not foud!" >&2
  exit -1
fi

docker rm $pid

