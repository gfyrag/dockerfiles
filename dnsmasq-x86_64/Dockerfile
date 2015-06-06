FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /

EXPOSE 67/udp
EXPOSE 69/udp
EXPOSE 53/udp
EXPOSE 53/tcp

# (http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2010q2/004017.html)
ENTRYPOINT ["dnsmasq", "-d", "-u", "root"]
