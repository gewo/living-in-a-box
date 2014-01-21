# MongoDB (gewo/mongodb)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV VERSION 2.4.6
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen'\
    | tee /etc/apt/sources.list.d/10gen.list
RUN apt-get update
RUN apt-get install -y mongodb-10gen=${VERSION}
RUN apt-get clean
RUN mkdir -p /data/db
RUN mkdir -p /logs
VOLUME ["/data"]
VOLUME ["/logs"]
EXPOSE 27017
EXPOSE 28017
CMD ["/usr/bin/mongod", "--logappend", "--logpath", "/logs/mongo.log", \
  "--smallfiles", "--noprealloc"]
