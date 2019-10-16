package_name = transflac
package_version = 1.0.0
INSTALL = /usr/bin/install -c

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libexecdir = $(prefix)/libexec/$(package_name)
sysconfdir = /etc
datarootdir = $(prefix)/share
docdir = $(datarootdir)/doc/$(package_name)
mandir = $(datarootdir)/man
DESTDIR =

all:

clean:

install:
	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 transflac $(DESTDIR)$(bindir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_set_colors.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_ck_codec.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_ck_input.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_ck_output.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_codec.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_figlet.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -m 644 src_tf_terminal_header.sh $(DESTDIR)$(libexecdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(sysconfdir)
	$(INSTALL) -m 644 transflac.conf $(DESTDIR)$(sysconfdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
	$(INSTALL) -m 644 LICENSE.md README.md contributors.txt $(DESTDIR)$(docdir)
	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -m 644 transflac.1 $(DESTDIR)$(mandir)/man1

uninstall:

	-rm -v \
	$(DESTDIR)$(bindir)/transflac \
	$(DESTDIR)$(libexecdir)/src_tf_set_colors.sh \
	$(DESTDIR)$(libexecdir)/src_tf_ck_codec.sh \
	$(DESTDIR)$(libexecdir)/src_tf_ck_input.sh \
	$(DESTDIR)$(libexecdir)/src_tf_ck_output.sh \
	$(DESTDIR)$(libexecdir)/src_tf_codec.sh \
	$(DESTDIR)$(libexecdir)/src_tf_figlet.sh \
	$(DESTDIR)$(libexecdir)/src_tf_terminal_header.sh \
	$(DESTDIR)$(sysconfdir)/transflac.conf \
	$(DESTDIR)$(docdir)/LICENSE.md \
	$(DESTDIR)$(docdir)/README.md \
	$(DESTDIR)$(docdir)/contributors.txt \
	$(DESTDIR)$(mandir)/man1/transflac.1
