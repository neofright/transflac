package-name = transflac
package-version = 1.0.0
INSTALL = /usr/bin/install -c

prefix = /usr/local
exec-prefix = $(prefix)
bindir = $(exec-prefix)/bin
libexecdir = $(prefix)/libexec/$(package-name)
sysconfdir = /etc
datarootdir = $(prefix)/share
docdir = $(datarootdir)/doc/$(package-name)
mandir = $(datarootdir)/man
DESTDIR =

all:

clean:

install:
	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 transflac $(DESTDIR)$(bindir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-set-colors.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-ck-codec.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-ck-input.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-ck-output.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-ck-quality.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-codec.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-figlet.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-terminal-header.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-progress-bar.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-table.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src-tf-help.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(sysconfdir)
	$(INSTALL) -m 644 transflac.conf $(DESTDIR)$(sysconfdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
	$(INSTALL) -m 644 LICENSE.md README.md contributors.txt $(DESTDIR)$(docdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -m 644 transflac.1 $(DESTDIR)$(mandir)/man1

uninstall:

	-rm -v \
	$(DESTDIR)$(bindir)/transflac \
	$(DESTDIR)$(libexecdir)/src-tf-set-colors.sh \
	$(DESTDIR)$(libexecdir)/src-tf-ck-codec.sh \
	$(DESTDIR)$(libexecdir)/src-tf-ck-input.sh \
	$(DESTDIR)$(libexecdir)/src-tf-ck-output.sh \
	$(DESTDIR)$(libexecdir)/src-tf-ck-quality.sh \
	$(DESTDIR)$(libexecdir)/src-tf-codec.sh \
	$(DESTDIR)$(libexecdir)/src-tf-help.sh \
	$(DESTDIR)$(libexecdir)/src-tf-figlet.sh \
	$(DESTDIR)$(libexecdir)/src-tf-terminal-header.sh \
	$(DESTDIR)$(libexecdir)/src-tf-progress-bar.sh \
	$(DESTDIR)$(libexecdir)/src-tf-table.sh \
	$(DESTDIR)$(sysconfdir)/transflac.conf \
	$(DESTDIR)$(docdir)/LICENSE.md \
	$(DESTDIR)$(docdir)/README.md \
	$(DESTDIR)$(docdir)/contributors.txt \
	$(DESTDIR)$(mandir)/man1/transflac.1
