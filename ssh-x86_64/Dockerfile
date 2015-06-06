
FROM ubuntu:14.04
MAINTAINER Geoffrey Ragot "geoffrey.ragot@gmail.com"

# Install dependencies
RUN apt-get update -y && apt-get install openssh-server -y

# Configure SSH
RUN mkdir /var/run/sshd \
	&& cat /etc/pam.d/sshd | sed -re 
"s,required(.*)pam_loginuid.so,optional\tpam_loginuid.so,g" > /etc/pam.d/sshd \
	&& echo LANG="en_US.UTF-8" > /etc/default/local

# Add guest user
RUN adduser \
	--disabled-password \
	--gecos '' \
	guest && adduser guest sudo && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Configure port
EXPOSE 22/tcp

# Define entry point
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

# Add public key to container
ADD id_rsa.pub /home/guest/.ssh/authorized_keys
RUN chown guest:guest /home/guest/.ssh/authorized_keys
