FROM php:8.2-apache

# PDO va PostgreSQL kutubxonalarini o‘rnatamiz
RUN docker-php-ext-install pdo pdo_pgsql

# Composer o‘rnatamiz
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Loyihani konteyner ichiga nusxalaymiz
COPY . /var/www/html/

# Apache avtomatik 80-portda ishlaydi
EXPOSE 80
