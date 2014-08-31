PREFIX = /usr
SYSTEMD_UNITDIR = $(PREFIX)/lib/systemd/system
SYSCONFDIR ?= /etc/sysconfig
VERSION=1.0.0
SRC_FILES=Makefile README.md zram zram.service zram.spec zramstart zramstat zramstop

target: zram zramstart zramstat zramstop zram.service

install:
	
	if [ -f /etc/gentoo-release ];then
		PREFIX = $(install_prefix)usr
		SYSCONFDIR = $(install_prefix)etc/sysconfig
	fi
	
	install -c -d $(PREFIX)
	
	install -c -d $(PREFIX)/sbin
	install -c -m 0755 zramstart $(PREFIX)/sbin
	install -c -m 0755 zramstop $(PREFIX)/sbin
	
	install -c -d $(PREFIX)/bin
	install -c -m 0755 zramstat $(PREFIX)/bin
	
	install -c -d $(PREFIX)/lib
	install -c -d $(PREFIX)/lib/systemd
	install -c -d $(SYSTEMD_UNITDIR)
	install -c -m 0644 zram.service $(SYSTEMD_UNITDIR)

	install -c -d $(install_prefix)etc
	install -c -d $(SYSCONFDIR)
	install -c -m 0644 zram $(SYSCONFDIR)
