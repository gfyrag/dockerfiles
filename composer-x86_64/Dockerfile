FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib/mysql
RUN wget -q -O- https://getcomposer.org/installer | php
ENTRYPOINT ["/composer.phar"]
