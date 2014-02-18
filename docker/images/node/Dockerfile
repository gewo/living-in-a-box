# NodeJS (gewo/node)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common curl git socat && \
  apt-get clean

# Install NodeJS
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN sudo apt-get -y install nodejs && \
  apt-get clean

ADD docker_link /usr/local/bin/docker_link
RUN chmod 755 /usr/local/bin/docker_link
RUN echo 'docker_link' >> /etc/bash.bashrc
RUN echo 'cd /mnt' >> /etc/bash.bashrc

CMD [/bin/bash]
