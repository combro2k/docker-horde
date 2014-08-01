FROM phusion/baseimage:latest

MAINTAINER Martijn van Maurik <docker@vmaurik.nl>

ENV HOME /root

RUN apt-get update
RUN apt-get install -y apache2 php-pear php-horde php-horde-imp php-horde-groupware php-horde-lz4 php5-imagick php5-dev
RUN pear install Net_DNS2
RUN pecl install lzf
RUN echo extension=lzf.so > /etc/php5/mods-available/lzf.ini && php5enmod lzf

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /etc/horde /etc/.horde
ADD horde-init.sh /etc/my_init.d/horde-init.sh
RUN chmod +x /etc/my_init.d/horde-init.sh

RUN mkdir -p /etc/service/apache2
ADD run /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run
RUN a2dissite 000-default && a2disconf php-horde

RUN mkdir -p /etc/apache2/scripts
ADD proxy_client_ip.php /etc/apache2/scripts/proxy_client_ip.php

ADD horde.conf /etc/apache2/sites-available/horde.conf
RUN a2ensite horde

VOLUME /etc/horde

CMD ["/sbin/my_init"]
