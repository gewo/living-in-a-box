# Ruby/Rails Dev Environment (gewo/ruby:2.1.0)
FROM gewo/ruby-dependencies
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV APP_RUBY_VERSION 2.1.0

# Install Ruby
RUN rvm install ruby-${APP_RUBY_VERSION} --default

# Install some Gems
RUN rvm-shell -c "gem install bundler"
RUN rvm-shell -c "gem install rake"
RUN rvm-shell -c "gem install rails"

CMD ["/bin/bash"]
