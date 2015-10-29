FROM scratch
ADD rootfs.tar /

# Non std library path for mysql client
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/mysql

# TODO : Should patch buildroot instead of running command in image. Build will not be compatible with any architecture.

# Apache not started without this : http://askubuntu.com/questions/168731/problem-to-install-apache-2-4-2-in-ubuntu-12-04
RUN sed -i 's,#LoadModule slotmem_shm_module modules/mod_slotmem_shm.so,LoadModule slotmem_shm_module modules/mod_slotmem_shm.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule cgid_module modules/mod_cgid.so,LoadModule cgid_module modules/mod_cgid.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule actions_module modules/mod_actions.so,LoadModule actions_module modules/mod_actions.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule rewrite_module modules/mod_rewrite.so,LoadModule rewrite_module modules/mod_rewrite.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#LoadModule ssl_module modules/mod_ssl.so,LoadModule ssl_module modules/mod_ssl.so,g' /etc/apache2/httpd.conf
RUN sed -i 's,#Scriptsock .*,Scriptsock /var/run/cgid.sock,g' /etc/apache2/httpd.conf

# Enable apcu extension (TODO : other method with buildroot?)
RUN echo $'extension=apcu.so\nextension=memcache.so' >> /etc/php.ini

# Change pid file (located in /var/logs...)
RUN echo PidFile /var/run/httpd.pid >> /etc/apache2/httpd.conf

# No memory limit needed, docker can handle this
RUN sed -i 's,memory_limit = .*,memory_limit = 512M,g' /etc/php.ini

# Copy php cgi inside cgi bin directory
RUN cp /usr/bin/php-cgi /usr/cgi-bin/php-cgi

# Create an additional user is useless seems useless in an isolated container
RUN sed -i 's,User daemon,User root,g' /etc/apache2/httpd.conf
RUN sed -i 's,Group daemon,Group root,g' /etc/apache2/httpd.conf

RUN echo Include /etc/apache2/configs/*.conf >> /etc/apache2/httpd.conf
RUN mkdir /etc/apache2/configs

# Define /var/www as directory where source files will be placed - Add a handler on php script
RUN echo $'DocumentRoot /var/www\n\
	<Directory "/var/www">\n\
		DirectoryIndex index.html index.php\n\
		AllowOverride all\n\
		Options Indexes FollowSymLinks MultiViews\n\
		Require all granted\n\
		AddHandler application/x-httpd-php5 .php\n\
		Action application/x-httpd-php5 "/cgi-bin/php-cgi"\n\
	</Directory>' > /etc/apache2/configs/default.conf

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
