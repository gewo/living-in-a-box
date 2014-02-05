# PHP (gewo/php)
FROM gewo/base
MAINTAINER Gebhard Wöstemeyer <g.woestemeyer@gmail.com>

RUN apt-get update
RUN apt-get -y install curl git \
  php5-cli php5-curl php5-mysql php-apc \
  libmysqlclient-dev mysql-client \
  build-essential libxml2-dev libssl-dev \
  libcurl4-gnutls-dev libjpeg-dev libpng12-dev libmcrypt-dev \
  libreadline-dev libtidy-dev libxslt1-dev autoconf re2c bison \
  && apt-get clean

# Setup phpenv
# RUN git clone git://github.com/phpenv/phpenv.git .phpenv && \
RUN curl https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | bash # today
RUN echo 'export PATH="/.phpenv/bin:$PATH"' >> /etc/bash.bashrc
RUN echo 'eval "$(phpenv init -)"' >>  /etc/bash.bashrc

RUN mkdir /.phpenv/plugins; \
  cd /.phpenv/plugins; \
  git clone https://github.com/CHH/php-build.git

RUN curl -o .phpenv/plugins/php-build/share/php-build/after-install.d/phpunit \
  https://raw.github.com/CHH/php-build-plugin-phpunit/master/share/php-build/after-install.d/phpunit
RUN chmod +x .phpenv/plugins/php-build/share/php-build/after-install.d/phpunit

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
CMD ["/bin/bash"]
