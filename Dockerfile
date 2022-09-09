FROM serversideup/php:8.1-fpm-nginx

LABEL maintainer="Thomas Cenni (@thomascenni)"
LABEL org.opencontainers.image.source https://github.com/thomascenni/wordpress-sqlite
LABEL org.opencontainers.image.description "Wordpress with SQLite."

ENV WORDPRESS_LOCALE="en_US"
ENV WORDPRESS_VERSION="6.0.2"

COPY startup/ /etc/cont-init.d/
COPY sites-available/ /etc/nginx/sites-available/

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN rm /etc/cont-init.d/50-laravel-automations
