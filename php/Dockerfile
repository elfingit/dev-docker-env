ARG PHP_VERSION

FROM php:$PHP_VERSION

ENV XDEBUG_VERSION=2.9.0

RUN apt-get update && apt-get install -y wget git unzip libpq-dev zlib1g-dev libzip-dev \
  && pecl install xdebug-${XDEBUG_VERSION} \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install zip \
  && docker-php-ext-enable zip \
  && docker-php-ext-install pdo \
  && docker-php-ext-install pdo_pgsql \
  && pecl install redis \
  && docker-php-ext-enable redis

RUN apt-get install -y libmagickwand-6.q16-dev --no-install-recommends \
 && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
 && pecl install imagick \
 && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

ADD ./php.ini /usr/local/etc/php/php.ini
ADD ./entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

RUN wget https://getcomposer.org/installer -O - -q \
  | php -- --install-dir=/bin --filename=composer --quiet \
  && mkdir -p /root/tmp \
  && composer global require "laravel/installer" \
  && cd /root/tmp \
  && composer create-project --prefer-dist laravel/laravel app

WORKDIR /srv/www
VOLUME /srv/www

EXPOSE 9000

STOPSIGNAL SIGQUIT

ENTRYPOINT [ "/root/entrypoint.sh" ]
