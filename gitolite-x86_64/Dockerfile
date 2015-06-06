FROM ubuntu:14.04
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>

ENV HOME /root
ENV PATH $PATH:$HOME/gitolite/bin
ENV USER root
ENV LC_ALL fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LANG fr_FR.UTF-8
ENV LC_TYPE fr_FR.UTF-8

WORKDIR /tmp

RUN apt-get update \
	&& apt-get install nano git openssh-server -y \
	&& locale-gen fr_FR.UTF-8 \
	&& dpkg-reconfigure locales \
	&& git clone git://github.com/sitaramc/gitolite \
	&& mkdir -p $HOME/gitolite/bin \
	&& ./gitolite/install -to $HOME/gitolite/bin \
	&& mkdir -p /var/run/sshd \
	&& rm -rf gitolite \
	&& apt-get clean

COPY .gitolite.rc $HOME/.gitolite.rc

ONBUILD COPY admin.pub $HOME/.ssh/admin.pub
ONBUILD RUN gitolite setup -pk $HOME/.ssh/admin.pub

WORKDIR /

CMD ["/usr/sbin/sshd", "-D"]
