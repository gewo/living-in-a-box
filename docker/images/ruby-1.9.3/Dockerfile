# Ruby/Rails Dev Environment (gewo/ruby:1.9.3)
FROM gewo/ruby-dependencies
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

ENV APP_RUBY_VERSION 1.9.3-p392

# Install Ruby
RUN rvm install ruby-${APP_RUBY_VERSION} --default

# Install some Gems
RUN rvm-shell -c "gem install bundler"
RUN rvm-shell -c "gem install rake"
RUN rvm-shell -c "gem install rails"

CMD ["/bin/bash"]
