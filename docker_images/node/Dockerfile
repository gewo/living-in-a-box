# NodeJS (gewo/node)
FROM gewo/interactive
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common curl git && \
  apt-get clean

# Install NodeJS
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN sudo apt-get -y install nodejs && \
  apt-get clean

CMD [/bin/bash]
