FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
ENTRYPOINT syslogd -p /syslog/socket && klogd
