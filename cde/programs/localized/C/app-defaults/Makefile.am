MAINTAINERCLEANFILES = Makefile.in

include ../../templates/C.am
include ../../templates/app-defaults.am

# Setup a symlink from C -> en_US.UTF-8
install-data-hook:
	$(RM) $(DESTDIR)$(CDE_DATA_TOP)/app-defaults/en_US.UTF-8
	cd $(DESTDIR)$(CDE_DATA_TOP)/app-defaults/ && $(LN_S) C en_US.UTF-8

EXTRA_DIST = \
    Dt.tmsg \
    Dtbuilder.tmsg \
    Dtcalc.tmsg \
    Dtcm.tmsg \
    Dtcreate.tmsg \
    Dtfile.tmsg \
    Dthello.tmsg \
    Dthelpview.tmsg \
    Dticon.tmsg \
    Dtimsstart.tmsg \
    Dtinfo.tmsg \
    Dtlogin.tmsg \
    Dtmail.tmsg \
    Dtpad.tmsg \
    Dtscreen.tmsg \
    Dtsession.tmsg \
    Dtstyle.tmsg \
    Dtterm.tmsg \
    Dtudcfonted.tmsg \
    Dtwm.tmsg
