FROM serversideup/php:8.2-fpm-apache

LABEL maintainer="Thomas Cenni (@thomascenni)"
LABEL org.opencontainers.image.source https://github.com/thomascenni/wordpress-sqlite
LABEL org.opencontainers.image.description "Wordpress with SQLite."

ENV WORDPRESS_LOCALE="en_US"
ENV WORDPRESS_VERSION="6.3.2"
ENV APACHE_DOCUMENT_ROOT=/var/www/html/

COPY startup/ /etc/cont-init.d/

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 80