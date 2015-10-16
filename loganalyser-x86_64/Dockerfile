FROM gfyrag/apache2-php:x86_64
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ADD loganalyzer-* /loganalyzer
RUN cp -rf /loganalyzer/*/src/* /var/www/
ADD config.php /var/www/config.php