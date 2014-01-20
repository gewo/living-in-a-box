# Rails Dev Environment (gewo/rails)
FROM gewo/rvm
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV APP_RUBY_VERSION 2.0.0

RUN apt-get update

# Nokogiri
RUN apt-get install -y libyaml-dev libxml2 libxml2-dev libxslt1-dev

# RMagick system dependencies
RUN apt-get install -y libmagickwand5 libmagickwand-dev

# ExecJS Runtime
RUN apt-get install -y nodejs

# MySQL gem dependencies
RUN apt-get install -y libmysqlclient-dev

# Headless Selenium Tests
RUN apt-get install -y firefox xvfb || true

# Java Runtime (for Solr, ...)
RUN apt-get install -y openjdk-7-jre-headless || true

RUN apt-get clean

# Install Ruby
RUN rvm install ruby-${APP_RUBY_VERSION} --default

# Install some Gems
RUN rvm-shell -c "gem install bundler"
RUN rvm-shell -c "gem install rake"
RUN rvm-shell -c "gem install rails"

CMD ["/bin/bash"]
