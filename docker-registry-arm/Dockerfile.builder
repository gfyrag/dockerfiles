FROM gfyrag/golang-fullarch:1.4
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV GOPATH $DISTRIBUTION_DIR/Godeps/_workspace:$GOPATH

RUN git clone https://github.com/docker/distribution $DISTRIBUTION_DIR

WORKDIR $DISTRIBUTION_DIR
RUN GOOS=linux GOARCH=arm make PREFIX=/distrib clean binaries

RUN tar -cvf /rootfs.tar -C /distrib/bin --transform 's,^\.,/bin,' .

ENTRYPOINT cat /rootfs.tar
