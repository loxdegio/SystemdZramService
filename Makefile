DESTDIR = /
USR = $(DESTDIR)usr
ETC = $(DESTDIR)etc
LIB = $(USR)lib
SYSTEMD_UNITDIR = $(LIB)/systemd/system
SYSCONFDIR = $(ETC)/sysconfig
VERSION=1.0.0
SRC_FILES=Makefile README.md zram zram.service zram.spec zramstart zramstat zramstop

target: zram zramstart zramstat zramstop zram.service

install:
	install -c -d $(USR)
	install -c -d $(USR)/sbin
	install -c -m 0755 zramstart $(USR)/sbin
	install -c -m 0755 zramstop $(USR)/sbin	
	install -c -d $(USR)/bin
	install -c -m 0755 zramstat $(USR)/bin
	install -c -d $(LIB)
	install -c -d $(LIB)/systemd
	install -c -d $(SYSTEMD_UNITDIR)
	install -c -m 0644 zram.service $(SYSTEMD_UNITDIR)
	install -c -d $(ETC)
	install -c -d $(SYSCONFDIR)
	install -c -m 0644 zram $(SYSCONFDIR)
