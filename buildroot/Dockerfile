FROM debian:sid
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ENV BUILDROOT_LOCATION /buildroot/
ENV BUILDROOT_REPOSITORY https://github.com/gfyrag/buildroot

RUN echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections \
    && echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y git build-essential wget python unzip bc curl cpio locales make libncurses-dev perl
RUN echo "test"
RUN git clone $BUILDROOT_REPOSITORY $BUILDROOT_LOCATION
WORKDIR /buildroot
