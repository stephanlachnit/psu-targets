PKGCONFIG=pkg-config
DESTDIR=

UNITDIR=$(shell $(PKGCONFIG) systemd --variable=systemdsystemunitdir)
SYSCONFDIR=/etc
ACPIDIR=$(SYSCONFDIR)/acpi
EVENTDIR=$(ACPIDIR)/events

all:

install:
	install -Dm644 'psu-adp.target' "$(DESTDIR)$(UNITDIR)/psu-adp.target"
	install -Dm644 'psu-bat.target' "$(DESTDIR)$(UNITDIR)/psu-bat.target"
	install -Dm644 'psu-targets.service' "$(DESTDIR)$(UNITDIR)/psu-targets.service"
	install -Dm644 'psu-targets' "$(DESTDIR)$(EVENTDIR)/psu-targets"
	install -Dm744 'psu-targets.sh' "$(DESTDIR)$(ACPIDIR)/psu-targets.sh"

uninstall:
	rm -fv $(DESTDIR)$(UNITDIR)/psu-adp.target
	rm -fv $(DESTDIR)$(UNITDIR)/psu-bat.target
	rm -fv $(DESTDIR)$(UNITDIR)/psu-targets.service
	rm -fv $(DESTDIR)$(EVENTDIR)/psu-targets
	rm -fv $(DESTDIR)$(ACPIDIR)/psu-targets.sh
