#!/bin/bash

# from http://qiita.com/yudoufu/items/48cb6fb71e5b498b2532
scriptDir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
nginxRoot=/usr/share/nginx
pidFile=docker-nginx.pid

do_run() {
  docker run --privileged -d -p 80:80 \
  -v $scriptDir/conf.d:/etc/nginx/conf.d \
  -v $scriptDir/certs:/etc/nginx/certs \
  -v $scriptDir/log:/var/log/nginx \
  -v $scriptDir/html:${nginxRoot}/html \
  --link apt_cacher_ng:apt_proxy -e http_proxy=http://apt_proxy:3142 \
  -e NGINX_ROOT=${nginxRoot} \
  k4zzk/php7-on-nginx > $pidFile
}

do_remove() {
  if [ -f $pidFile ]; then
    pid=$(cat $pidFile)
    docker rm $pid
    echo "" > $pidFile
  else
    echo "pid file Not foud!" >&2
    exit -1
  fi
}

do_stop() {
  if [ -f $pidFile ]; then
    pid=$(cat $pidFile)
    docker stop $pid
  else
    echo "pid file Not foud!" >&2
    exit -1
  fi
}


if [ -f $pidFile ]; then
  do_stop && do_remove && do_run
else
  do_run
fi

ret=$?
if [ ! $ret -eq 0 ] ;then
  exit $ret
fi

echo "Success!"
