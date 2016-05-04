#!/bin/bash

# from http://qiita.com/yudoufu/items/48cb6fb71e5b498b2532
scriptDir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
nginxRoot=/usr/share/nginx

docker run --privileged -d -p 80:80 \
-v $scriptDir/conf.d:/etc/nginx/conf.d \
-v $scriptDir/certs:/etc/nginx/certs \
-v $scriptDir/log:/var/log/nginx \
-v $scriptDir/html:${nginxRoot}/html \
-e NGINX_ROOT=${nginxRoot} \
k4zzk/php7-on-nginx > docker-nginx.pid

ret=$?
if [ ! $ret -eq 0 ] ;then
  exit $ret
fi

echo "Success!"
