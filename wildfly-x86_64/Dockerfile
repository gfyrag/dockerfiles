FROM gfyrag/java-server-jre:8
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ENV VERSION 8.2.0.Final

RUN \
	curl -O http://download.jboss.org/wildfly/$VERSION/wildfly-$VERSION.zip \
	&& unzip wildfly-$VERSION.zip \
	&& mv wildfly-$VERSION /wildfly \
	&& rm wildfly-$VERSION.zip

EXPOSE 8080
EXPOSE 9990

ENV JAVA_OPTS -Xms64m -Xmx512m -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djava.awt.headless=true

ENTRYPOINT ["/wildfly/bin/standalone.sh", "-Djboss.bind.address=0.0.0.0", "-Djboss.bind.address.management=0.0.0.0"]
