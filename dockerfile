FROM php:7.3-apache
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y libxml2-dev zlib1g-dev libzip-dev libbz2-dev unzip vim git cron \
&& docker-php-ext-install mbstring ctype bcmath pdo pdo_mysql json xml zip bz2 opcache \
&& EXPECTED_SIGNATURE=$(curl -q -sS https://composer.github.io/installer.sig) \
&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
&& ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');") \
&& if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]; then >&2 echo 'ERROR: Invalid installer signature' && rm composer-setup.php && exit 1; fi \
&& php composer-setup.php --quiet \
&& rm composer-setup.php \
&& mv composer.phar /usr/local/bin/composer \
&& composer global require laravel/installer \
&& echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc \
&& a2enmod rewrite
