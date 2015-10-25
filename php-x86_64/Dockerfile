FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/mysql
RUN sed -i 's,memory_limit = .*,memory_limit = 512M,g' /etc/php.ini
RUN echo $'extension=apcu.so\nextension=memcache.so' >> /etc/php.ini
ENTRYPOINT ["/bin/php"]
