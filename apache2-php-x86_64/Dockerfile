FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /

# TODO : Should patch buildroot instead of running command in image. Build will not be compatible with any architecture.

# Apache not started without this : http://askubuntu.com/questions/168731/problem-to-install-apache-2-4-2-in-ubuntu-12-04
RUN sed -i 's,#LoadModule slotmem_shm_module modules/mod_slotmem_shm.so,LoadModule slotmem_shm_module modules/mod_slotmem_shm.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule cgid_module modules/mod_cgid.so,LoadModule cgid_module modules/mod_cgid.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule actions_module modules/mod_actions.so,LoadModule actions_module modules/mod_actions.so,g' /etc/apache2/httpd.conf

# Copy php cgi inside cgi bin directory
RUN cp /usr/bin/php-cgi /usr/cgi-bin/php-cgi

# Create an additional user is useless seems useless in an isolated container
RUN sed -i 's,User daemon,User root,g' /etc/apache2/httpd.conf
RUN sed -i 's,Group daemon,Group root,g' /etc/apache2/httpd.conf

# Define /var/www as directory where source files will be placed - Add a handler on php script
RUN echo DocumentRoot /var/www >> /etc/apache2/httpd.conf
RUN echo \<Directory "/var/www"\> >> /etc/apache2/httpd.conf
RUN echo DirectoryIndex index.html index.php >> /etc/apache2/httpd.conf
RUN echo AllowOverride all >> /etc/apache2/httpd.conf
RUN echo Options Indexes FollowSymLinks MultiViews >> /etc/apache2/httpd.conf
RUN echo Require all granted >> /etc/apache2/httpd.conf
RUN echo AddHandler application/x-httpd-php5 .php >> /etc/apache2/httpd.conf
RUN echo Action application/x-httpd-php5 "/cgi-bin/php-cgi" >> /etc/apache2/httpd.conf
RUN echo \</Directory\> >> /etc/apache2/httpd.conf

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
