FROM combro2k/docker-nginx-php5
MAINTAINER combro2k

RUN apt-get update
RUN apt-get install -yq php5-pear
