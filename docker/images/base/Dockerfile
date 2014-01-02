# Base Image (gewo/base)
FROM ubuntu:12.10
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>
RUN \
  apt-get update && \
  apt-get install -y wget build-essential && \
  apt-get clean
RUN echo 'export HOME=/' >> /etc/bash.bashrc
