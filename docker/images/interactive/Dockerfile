# Interactive Base Image (gewo/interactive)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ONBUILD RUN apt-get update && \
  apt-get install -y zsh

ONBUILD RUN echo 'docker_link' >> /etc/shell_env
ONBUILD RUN echo 'cd /mnt' >> /etc/shell_env

ONBUILD RUN echo '. /etc/shell_env' >> /etc/bash.bashrc
ONBUILD RUN echo '. /etc/shell_env' >> /etc/zsh/zshenv
