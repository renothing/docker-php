# About this Repo
----

This repository contains **Dockerfile** of [PHP](http://www.php.net) for [Docker](https://www.docker.com/)'s automated build.


### Base Docker Image

* [dockerfile/alpine](http://dockerfile.github.io/#/alpine)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/renothing/php/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull renothing/php:tag`

   (alternatively, you can build an image from Dockerfile: `docker build -t="php:5.6-fpm" github.com/renothing/docker-php.git#:Dockerfile.5`)

3. default environments supported,you can change them before building or running.   
   the php-fpm start with port 9000
```
    TIMEZONE=Asia/Shanghai
    PHP_MAX_EXECUTION=900
    PHP_MEMORY_LIMIT=256m
    PHP_MAX_UPLOAD_SIZE=50m
    PHP_MAX_UPLOAD=200
    PHP_MAX_POST=100m 
    FPM_RESTART_THRESHOLD=30
    FPM_RESTART_INTERVAL=30s 
    FPM_MAX=512  #fpm max process 
    FPM_MAX_REQUESTS=8192 #max requests per process
```
### Supported tags and respective 
* 5.6-fpm,5.6.26-fpm

### Usage

```
docker run -dit --env-file /path/yourenv --name php -v yourapppath:/var/www renothing/php:tag
#link with nginx or database container
docker run -dit --env-file /path/yourenv --name php -v yourapppath:/var/www --link yourdbserver:dbhost renothing/php:tag
#check logs
docker logs php
```
