FROM php:8.0-cli
RUN apt-get update && apt-get install -y gnupg git wget software-properties-common libonig-dev ca-certificates libmpdec-dev apt-transport-https gnupg2 unzip libicu-dev zlib1g-dev libzip-dev libxml2-dev libgd-dev libpng-dev curl rsync libhiredis-dev libzip-dev zip redis-server unzip libicu-dev zlib1g-dev libzip-dev libxml2-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev git curl git libhiredis-dev libzip-dev libgmp-dev rsync ssh
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN pecl install igbinary xdebug redis decimal mongodb
RUN git clone https://github.com/nrk/phpiredis.git && cd phpiredis && phpize && ./configure --enable-phpiredis && make && make install && cd ..
RUN docker-php-ext-configure gmp && docker-php-ext-install gmp
RUN docker-php-ext-configure bcmath && docker-php-ext-install bcmath
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-configure pdo_mysql && docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure xml && docker-php-ext-install xml
RUN docker-php-ext-configure mbstring && docker-php-ext-install mbstring
RUN docker-php-ext-configure iconv && docker-php-ext-install iconv
RUN docker-php-ext-configure mysqli && docker-php-ext-install mysqli
RUN docker-php-ext-configure zip && docker-php-ext-install zip
RUN docker-php-ext-enable redis phpiredis igbinary zip xdebug intl redis decimal mongodb gmp bcmath
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
