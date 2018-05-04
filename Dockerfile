FROM php:7.2
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	apt-get install --no-install-recommends -y openssh-client git curl zip make rsync sshpass apt-utils build-essential
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq zlib1g zlib1g-dev libpng-dev libxml2-dev zlib1g-dev libicu-dev g++
RUN docker-php-ext-install zip && \
	docker-php-ext-install pdo_mysql && \
	docker-php-ext-install xml && \
	docker-php-ext-install gd && \
	docker-php-ext-install bcmath && \
	docker-php-ext-configure intl && \
	docker-php-ext-install intl
RUN pecl install xdebug && docker-php-ext-enable xdebug