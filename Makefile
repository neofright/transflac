transflac_version = transflac-1.0.0
INSTALL = /usr/bin/install -c

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sysconfdir = /etc
datarootdir = $(prefix)/share
docdir = $(datarootdir)/doc/$(transflac_version)
mandir = $(datarootdir)/man
DESTDIR =

all:

clean:

install:
	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 transflac src_set_colors $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_ck_codec $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_ck_input $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_ck_output $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_codec $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_figlet $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 src_tf_terminal_header $(DESTDIR)$(bindir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(sysconfdir)
	$(INSTALL) -m 644 transflac.conf $(DESTDIR)$(sysconfdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
	$(INSTALL) -m 644 LICENSE.md README.md contributors.txt $(DESTDIR)$(docdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -m 644 transflac.1 $(DESTDIR)$(mandir)/man1

uninstall:

	-rm -v \
	$(DESTDIR)$(bindir)/transflac \
	$(DESTDIR)$(bindir)/src_set_colors \
	$(DESTDIR)$(bindir)/src_tf_ck_codec \
	$(DESTDIR)$(bindir)/src_tf_ck_input \
	$(DESTDIR)$(bindir)/src_tf_ck_output \
	$(DESTDIR)$(bindir)/src_tf_codec \
	$(DESTDIR)$(bindir)/src_tf_figlet \
	$(DESTDIR)$(bindir)/src_tf_terminal_header \
	$(DESTDIR)$(sysconfdir)/transflac.conf \
	$(DESTDIR)$(docdir)/LICENSE.md \
	$(DESTDIR)$(docdir)/README.md \
	$(DESTDIR)$(docdir)/contributors.txt \
	$(DESTDIR)$(docdir)/README \
	$(DESTDIR)$(mandir)/man1/transflac.1	