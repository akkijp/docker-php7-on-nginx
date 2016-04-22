#!/bin/bash

# from http://qiita.com/yudoufu/items/48cb6fb71e5b498b2532
scriptDir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

docker run --privileged -d -p 80:80 \
-v $scriptDir/conf.d:/etc/nginx/conf.d \
-v $scriptDir/certs:/etc/nginx/certs \
-v $scriptDir/log:/var/log/nginx \
-v $scriptDir/www:/var/www/html \
k4zzk/nginx
