# Rails Dependencies (gewo/rails-dependencies)
FROM gewo/rvm
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update

# Nokogiri
RUN apt-get install -y libyaml-dev libxml2 libxml2-dev libxslt1-dev

# RMagick system dependencies
RUN apt-get install -y libmagickwand5 libmagickwand-dev

# ExecJS Runtime
RUN apt-get install -y nodejs

# MySQL gem dependencies and client
RUN apt-get install -y libmysqlclient-dev mysql-client

# Headless Selenium Tests
RUN apt-get install -y firefox xvfb

# Java Runtime (for Solr, ...)
RUN apt-get install -y openjdk-7-jre-headless

RUN apt-get clean
