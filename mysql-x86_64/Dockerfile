FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
RUN mysql_install_db
ENTRYPOINT ["mysqld_safe"]
