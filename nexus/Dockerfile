FROM gfyrag/java8:x86_64
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
COPY nexus/nexus /nexus
COPY nexus/sonatype-work /sonatype-work

# Config of jetty
VOLUME ["/nexus/conf"]

# Logs of jetty
VOLUME ["/nexus/logs"]

# Nexus data
VOLUME ["/sonatype-work"]

ENV RUN_AS_USER root

EXPOSE 8081/tcp

ENTRYPOINT ["/nexus/bin/nexus"]
CMD ["console"]
