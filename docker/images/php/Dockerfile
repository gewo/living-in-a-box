# PHP (gewo/php)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update
RUN apt-get -y install \
 curl git \php5-cli php5-curl php5-mysql libmysqlclient-dev mysql-client && \
 apt-get clean

# MySQL gem dependencies and client
RUN apt-get install -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
CMD ["/bin/bash"]
