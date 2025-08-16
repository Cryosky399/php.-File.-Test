FROM php:8.2-cli

# Kerakli kutubxonalarni o‘rnatamiz
RUN apt-get update && apt-get install -y \
    libpq-dev \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_pgsql

# Composer o‘rnatamiz
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Loyihani konteyner ichiga ko‘chiramiz
WORKDIR /var/www/html
COPY . .

# Composer orqali paketlarni o‘rnatamiz
RUN composer install --no-dev --optimize-autoloader

CMD [ "php", "bot.php" ]
