#!/bin/bash

JAVA_VERSION_MAJOR=8
JAVA_VERSION_MINOR=31
JAVA_VERSION_BUILD=13
JAVA_ARCHIVE=server-jre

[ -f "jdk.tar.gz" ] || {\
	curl -kLH "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_ARCHIVE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz > jdk.tar.gz
	tar xf jdk.tar.gz
	mv jdk1* jdk
}

docker build -t gfyrag/java8:x86_64 .
