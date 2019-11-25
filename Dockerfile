FROM ubuntu:14.04
FROM php:7.2-cli


ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_SERVER_NAME localhost
 
RUN apt-get update \
 && apt-get install -y \
    apache2 \
 && rm -rf /var/lib/apt/lists/*
 

COPY ./charity/ /var/www/html
 

EXPOSE 80
 

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
