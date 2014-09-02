# Redis Server (gewo/redis)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN mkdir /data
RUN mkdir /logs
VOLUME ["/data"]
VOLUME ["/logs"]
ADD redis.conf redis.conf
EXPOSE 6379
