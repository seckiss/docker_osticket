FROM php:7-apache
COPY src/ /var/www/html/
RUN apt-get update &&  apt-get install -y vim libc-client-dev libkrb5-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev mariadb-server net-tools
RUN docker-php-ext-install mysqli
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-configure gd --with-freetype --with-jpeg 
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache


