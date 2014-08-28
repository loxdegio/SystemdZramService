PREFIX ?= /usr
SYSTEMD_UNITDIR ?= $(PREFIX)/lib/systemd/system
SYSCONFDIR ?= /etc/sysconfig
VERSION=1.0.0
SRC_FILES=Makefile README.md zram zram.service zram.spec zramstart zramstat zramstop

target: zram zramstart zramstat zramstop zram.service

install:
	install -d $(PREFIX)/sbin
	install -m 0755 zramstart $(PREFIX)/sbin
	install -m 0755 zramstop $(PREFIX)/sbin
	install -m 0755 zramstat $(PREFIX)/sbin

	install -d $(SYSTEMD_UNITDIR)
	install -m 0644 zram.service $(SYSTEMD_UNITDIR)

	install -d $(SYSCONFDIR)
	install -m 0644 zram $(SYSCONFDIR)
