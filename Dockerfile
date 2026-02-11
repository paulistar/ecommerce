FROM php:8.4-apache

RUN set -eux; \
  a2enmod rewrite headers; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libonig-dev \
    libpng-dev \
    libzip-dev \
  ; \
  docker-php-ext-configure gd --with-freetype --with-jpeg; \
  docker-php-ext-install -j"$(nproc)" \
    pdo_mysql \
    gd \
    mbstring \
    zip \
  ; \
  rm -rf /var/lib/apt/lists/*

# Allow .htaccess rewrite rules
RUN set -eux; \
  { \
    echo '<Directory /var/www/html>'; \
    echo '  AllowOverride All'; \
    echo '  Require all granted'; \
    echo '</Directory>'; \
  } > /etc/apache2/conf-available/allowoverride.conf; \
  a2enconf allowoverride

WORKDIR /var/www/html
COPY . /var/www/html

# Ensure writable dirs exist for runtime
RUN set -eux; \
  mkdir -p cache uploads; \
  chown -R www-data:www-data /var/www/html/cache /var/www/html/uploads

# Common PHP settings for uploads
RUN set -eux; \
  { \
    echo 'upload_max_filesize=64M'; \
    echo 'post_max_size=64M'; \
    echo 'memory_limit=256M'; \
    echo 'max_execution_time=120'; \
  } > /usr/local/etc/php/conf.d/app.ini
