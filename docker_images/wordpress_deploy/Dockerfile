# Environment for wordpress deploy (gewo/wordpress_deploy)
FROM gewo/python
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update
RUN apt-get -y install git lftp python-dev python-setuptools && \
  apt-get clean
RUN easy_install pip && pip install ansible

CMD ["/bin/bash"]
