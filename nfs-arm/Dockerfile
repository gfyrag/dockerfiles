FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
ADD rootfs-extra/* /
ENV RPC_STATD_PORT 4001
ENV RPC_MOUNTD_PORT 4002
EXPOSE $RPC_STATD_PORT/tcp
EXPOSE $RPC_STATD_PORT/udp
EXPOSE $RPC_MOUNTD_PORT/tcp
EXPOSE $RPC_MOUNTD_PORT/udp
EXPOSE 111/tcp
EXPOSE 111/udp
EXPOSE 2049/tcp
EXPOSE 2049/udp
CMD ["/_boot"]
