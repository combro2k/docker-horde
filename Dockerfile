FROM combro2k/docker-nginx-php5
MAINTAINER combro2k

RUN apt-get update
RUN apt-get install -y php-pear php-horde php-horde-imp php-horde-groupware
