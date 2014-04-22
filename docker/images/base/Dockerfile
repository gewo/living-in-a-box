# Base Image (gewo/base)
FROM ubuntu:12.10
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# RUN dpkg-divert --local --rename --add /sbin/initctl && \
  # ln -s /bin/true /sbin/initctl

RUN \
  apt-get update && \
  apt-get install -y wget build-essential socat && \
  apt-get clean
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV HOME /
