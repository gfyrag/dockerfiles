FROM ubuntu:14.04
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

LABEL source=http://dave.cheney.net/2012/09/08/an-introduction-to-cross-compilation-with-go

RUN apt-get update && apt-get install binutils gcc make automake git build-essential -y

WORKDIR /
RUN git clone https://github.com/golang/go
WORKDIR /go/src
RUN git checkout go1.4.1
RUN ./make.bash

ENV PATH /go/bin:$PATH

WORKDIR /
RUN git clone https://github.com/davecheney/golang-crosscompile 
RUN bash -c ". /golang-crosscompile/crosscompile.bash && go-crosscompile-build-all"

