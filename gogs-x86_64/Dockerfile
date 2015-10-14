FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
# Gogs require this env variables
ENV USER root
ENTRYPOINT ["/usr/share/gogs/gogs"]
