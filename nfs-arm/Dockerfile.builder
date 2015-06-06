FROM gfyrag/buildroot
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD config $BUILDROOT_LOCATION/.config
RUN make oldconfig
RUN make
ENTRYPOINT cat $BUILDROOT_LOCATION/output/images/rootfs.tar
