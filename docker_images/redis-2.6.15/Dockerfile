# Redis Server (gewo/redis)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV VERSION 2.6.15

RUN wget http://download.redis.io/releases/redis-${VERSION}.tar.gz
RUN tar xvfz redis-${VERSION}.tar.gz
RUN cd redis-${VERSION} && make redis-server
RUN mv redis-${VERSION}/src/redis-server /usr/bin && rm -rf redis-${VERSION}*

CMD ["/usr/bin/redis-server", "redis.conf"]
