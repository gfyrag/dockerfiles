FROM ubuntu:14.04
MAINTAINER Geoffrey Ragot "geoffrey.ragot@gmail.com"

ENV VERSION 5.5

RUN apt-get update && apt-get -y install mysql-server-$VERSION

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# File system is mount as root
# So to write in volumes, mysql needs to be run as root in the container
RUN sed -i -e "s/^user\s*=\s*mysql/user = root/" /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mysqld_safe"]
