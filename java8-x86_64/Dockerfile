FROM gfyrag/busybox:x86_64
MAINTAINER Geoffrey Ragot <geoffreyr@omwave.com>
ADD jdk /usr/jvm
ENV JAVA_HOME /usr/jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin
ENTRYPOINT ["java"]
