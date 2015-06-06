FROM scratch
MAINTAINER Geoffrey Ragot <geoffrey.ragot@gmail.com>
ADD rootfs.tar /
ADD dnsmasq.conf /etc/dnsmasq.conf

# PXELinux from buildroot stuck on banner (don't understand, so use a prebuilt binary instead)
# ADD syslinux/pxelinux.bin /tftp/pxelinux.0

WORKDIR /tftp/bios
ADD syslinux-6.03/bios/core/pxelinux.0 pxelinux.0
ADD syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 ldlinux.c32
ADD syslinux-6.03/bios/com32/libutil/libutil.c32 libutil.c32
ADD syslinux-6.03/bios/com32/menu/menu.c32 menu.c32
ADD syslinux-6.03/bios/com32/menu/vesamenu.c32 vesamenu.c32
ADD syslinux-6.03/bios/com32/lib/libcom32.c32 libcom32.c32

WORKDIR /tftp/efi32
ADD syslinux-6.03/efi32/efi/syslinux.efi syslinux.efi
ADD syslinux-6.03/efi32/com32/elflink/ldlinux/ldlinux.e32 ldlinux.e32
ADD syslinux-6.03/efi32/com32/libutil/libutil.c32 libutil.c32
ADD syslinux-6.03/efi32/com32/menu/menu.c32 menu.c32
ADD syslinux-6.03/efi32/com32/menu/vesamenu.c32 vesamenu.c32
ADD syslinux-6.03/efi32/com32/lib/libcom32.c32 libcom32.c32

WORKDIR /tftp/efi64
ADD syslinux-6.03/efi64/efi/syslinux.efi syslinux.efi
ADD syslinux-6.03/efi64/com32/elflink/ldlinux/ldlinux.e64 ldlinux.e64
ADD syslinux-6.03/efi64/com32/libutil/libutil.c32 libutil.c32
ADD syslinux-6.03/efi64/com32/menu/menu.c32 menu.c32
ADD syslinux-6.03/efi64/com32/menu/vesamenu.c32 vesamenu.c32
ADD syslinux-6.03/efi64/com32/lib/libcom32.c32 libcom32.c32

EXPOSE 67/udp
EXPOSE 69/udp
EXPOSE 53/udp
EXPOSE 53/tcp

# (http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2010q2/004017.html)
ENTRYPOINT ["dnsmasq", "-d", "-u", "root"]
