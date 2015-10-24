FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
RUN sed -i 's,memory_limit = .*,memory_limit = -1,g' /etc/php.ini
ENTRYPOINT ["/usr/bin/php"]
