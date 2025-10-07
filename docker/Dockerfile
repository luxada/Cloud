#!/bin/bash
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install -y software-properties-common

RUN apt-get install -y mysql-client

# Install Git
RUN apt-get install -y git

# Install PHP
RUN add-apt-repository -y ppa:ondrej/php &&  apt-get update && apt-get install -y \
    php8.2 \
    php8.2-cli \
    php8.2-common \
    php8.2-opcache \
    php8.2-readline \
    php8.2-curl \
    php8.2-mysql \
    php8.2-pgsql \
    php8.2-sqlite3 \
    php8.2-zip \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-bcmath \
    php8.2-bz2 \
    php8.2-intl \
    php8.2-ldap \
    php8.2-imap \
    php8.2-imagick \
    php8.2-gmp \
    nodejs \
    composer \
    npm

RUN git clone https://github.com/laravelio/laravel.io.git ../Sites/laravel.io
WORKDIR ../Sites/laravel.io

RUN composer install
RUN npm install

# Copy start script
COPY ./script.sh .

# Add execution permission to start script
RUN chmod +x script.sh

EXPOSE 8000

CMD ./script.sh