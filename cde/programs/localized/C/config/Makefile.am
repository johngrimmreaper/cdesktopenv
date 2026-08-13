MAINTAINERCLEANFILES = Makefile.in

include ../../templates/C.am
include ../../templates/config.am

# Setup a symlink from C -> en_US.UTF-8
install-data-hook:
	$(RM) $(DESTDIR)$(CDE_DATA_TOP)/config/en_US.UTF-8
	cd $(DESTDIR)$(CDE_DATA_TOP)/config/ && $(LN_S) C en_US.UTF-8

