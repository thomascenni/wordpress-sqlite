FROM shinsenter/wordpress:php8.1

ENV WORDPRESS_LOCALE="en_US"
ENV WORDPRESS_VERSION="6.0.2"
ENV WPSQLITEDATA="/wpsqlitedata"

RUN mkdir ${WPSQLITEDATA}

COPY startup/ /startup/

RUN apt-get update && apt-get install wget curl