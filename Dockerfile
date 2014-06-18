FROM phusion/baseimage
MAINTAINER combro2k

ENV HOME /root

RUN apt-get update
RUN apt-get install -y apache2 php-pear php-horde php-horde-imp php-horde-groupware

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
