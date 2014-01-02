# MySQL 5.5 (gewo/mysql)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.5 || true && \
  apt-get clean

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" \
  /etc/mysql/my.cnf
RUN sed -i -e"s/^log_error\s*=.*$/log_error = \/logs\/mysql.log/" \
  /etc/mysql/my.cnf
RUN sed -i -e"s/^datadir\s*=.*$/datadir = \/data/" \
  /etc/mysql/my.cnf

ADD start_mysqld /usr/local/bin/start_mysqld
RUN chmod 755 /usr/local/bin/start_mysqld

RUN mkdir /data
RUN mkdir /logs
VOLUME ["/data"]
VOLUME ["/logs"]

EXPOSE 3306
CMD ["start_mysqld"]
