# NodeJS (gewo/node)
FROM gewo/interactive
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN \
  apt-get update &&\
  apt-get -y install software-properties-common curl git &&\
  add-apt-repository ppa:chris-lea/node.js &&\
  apt-get update &&\
  apt-get -y install nodejs &&\
  apt-get clean

CMD ["/bin/bash"]
