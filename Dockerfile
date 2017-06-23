FROM ubuntu:14.04
MAINTAINER Flyrainning "http://www.fengpiao.net"


RUN apt-get update -y \
  && apt-get install -y \
    php5-fpm \
    php5-cli \
    php5-imagick \
    php5-json \
    php-mail \
    php5-mcrypt \
    php5-memcached \
    php5-mongo \
    php5-redis \
    php5-curl \
    php5-gd \
    php5-mysql \
    php5-odbc \
    php5-sqlite \
    php5-xmlrpc \
    php5-sybase \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*
    
ADD etc /etc
ADD app /app
ADD bin /bin
RUN chmod a+x /bin/start.sh
WORKDIR /app

ENV VERSION 1
ENV PATH "/app:$PATH"

EXPOSE 9000
ENTRYPOINT ["/bin/start.sh"]
