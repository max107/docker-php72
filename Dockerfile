FROM php:7.1
RUN DEBIAN_FRONTEND=noninteractive curl -sL https://deb.nodesource.com/setup_8.x | bash && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y openssh-client git curl zip make rsync sshpass apt-utils nodejs build-essential
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chmod +x /usr/local/bin/composer
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zlib1g zlib1g-dev
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install yarn
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq libpng-dev libxml2-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install xml
RUN docker-php-ext-install gd