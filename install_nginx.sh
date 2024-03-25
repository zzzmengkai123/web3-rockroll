#!/bin/bash

yum -y install gcc automake autoconf libtool make gcc gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel

cd /usr/local/
wget https://nginx.org/download/nginx-1.22.1.tar.gz
tar xzvf nginx-1.22.1.tar.gz
cd nginx-1.22.1

./configure --prefix=/usr/local/nginx22 \
--conf-path=/usr/local/nginx22/etc/nginx.conf \
--error-log-path=/data/nginx22/nginxlog/error.log \
--http-log-path=/data/nginx22/nginxlog/access.log \
--pid-path=/usr/local/nginx22/pids/nginx.pid \
--lock-path=/usr/local/nginx22/locks/nginx.lock \
--with-http_ssl_module \
--with-stream \
--with-http_stub_status_module \
--with-http_gzip_static_module \
--http-client-body-temp-path=/usr/local/nginx22/tmp/client \
--http-proxy-temp-path=/usr/local/nginx22/tmp/proxy \
--http-fastcgi-temp-path=/usr/local/nginx22/tmp/fastcgi \
--http-uwsgi-temp-path=/usr/local/nginx22/tmp/uwsgi \
--http-scgi-temp-path=/usr/local/nginx22/tmp/scgi

make && make install

mkdir -p /usr/local/nginx22/tmp/client

/usr/local/nginx22/sbin/nginx -t