MAINTAINERCLEANFILES = Makefile.in

# This is only available for the C locale, it will be blank for other
# languages
APPBUILDER = AppBuilder.sdl

# this sets the LANG variables
include $(top_srcdir)/programs/localized/templates/English.am
# this does all the work
include $(top_srcdir)/doc/common/help/sdl-docs.am
# install all of the extra assets
include $(top_srcdir)/doc/common/help/sdl-data.am

# need to setup a symlink for the C locale to point toward en_US
install-data-hook:
	$(RM) -rf $(DESTDIR)$(CDE_DATA_TOP)/appconfig/help/C
	cd $(DESTDIR)$(CDE_DATA_TOP)/appconfig/help/ && $(LN_S) en_US.UTF-8 C

EXTRA_DIST = \
    $(FILEMGR_SRCS) \
    $(HELP4HELP_SRCS) \
    $(INTROMGR_SRCS) \
    $(CALENDAR_SRCS) \
    $(FPANEL_SRCS) \
    $(ICONED_SRCS) \
    $(MAILER_SRCS) \
    $(STYLEMGR_SRCS) \
    $(APPBUILDER_SRCS) \
    $(APPMANAGER_SRCS) \
    $(CALCULATOR_SRCS) \
    $(CREATACT_SRCS) \
    $(LOGINMGR_SRCS) \
    $(PRINTMGR_SRCS) \
    $(TERMINAL_SRCS) \
    $(TEXTEDIT_SRCS) \
    $(LIBDTPRINT_SRCS) \
    $(PRNSETUP_SRCS) \
    $(INFOMGR_SRCS)
