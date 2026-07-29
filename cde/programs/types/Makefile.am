MAINTAINERCLEANFILES = Makefile.in

LOCAL_CPP_DEFINES = -DCDE_INSTALLATION_TOP=$(CDE_INSTALLATION_TOP) \
-DCDE_DATA_TOP=$(CDE_DATA_TOP) \
	-DCDE_CONFIGURATION_TOP=$(CDE_CONFIGURATION_TOP) \
	-DCDE_LOGFILES_TOP=$(CDE_LOGFILES_TOP) -DKORNSHELL=$(KSH) \
	-DDTKORNSHELL=$(CDE_INSTALLATION_TOP)/bin/dtksh

if SOLARIS
LOCAL_CPP_DEFINES += -D__sun
endif

BUILT_SOURCES = autoStart.dt compat.dt datatypes.dt develop.dt		\
	dtappman.dt dt.dt dtcm.dt dtfile.dt dthelp.dt dthelpprint.dt	\
	dthelptag.dt dtims.dt dtinfo.dt dtmail.dt dtpad.dt dtscreen.dt	\
	dt.softinit dtwm.fp error.ds hp.dt ibm.dt IconBrowse.dt		\
	laserrom.dt miscActions.dt miscImages.dt print.dt		\
	printerNN.dt sunOW.dt unsupported.dt user-prefs.dt uxstd.dt	\
	xclients.dt

CLEANFILES = $(BUILT_SOURCES)

# Use -C to GENCPP to preserve /* and */ sequences

autoStart.dt: autoStart.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

compat.dt: compat.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

datatypes.dt: datatypes.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@
dtcm.dt: dtcm.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtmail.dt: dtmail.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@


develop.dt: develop.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtappman.dt: dtappman.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dt.dt: dt.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtfile.dt: dtfile.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dthelp.dt: dthelp.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dthelpprint.dt: dthelpprint.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dthelptag.dt: dthelptag.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtims.dt: dtims.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtinfo.dt: dtinfo.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtpad.dt: dtpad.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtscreen.dt: dtscreen.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dt.softinit: dt.softinit.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

dtwm.fp: dtwm.fp.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

error.ds: error.ds.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

hp.dt: hp.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

ibm.dt: ibm.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

IconBrowse.dt: IconBrowse.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

laserrom.dt: laserrom.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

miscActions.dt: miscActions.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

miscImages.dt: miscImages.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

print.dt: print.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

printerNN.dt: printerNN.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

sunOW.dt: sunOW.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

unsupported.dt: unsupported.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

user-prefs.dt: user-prefs.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

uxstd.dt: uxstd.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

xclients.dt: xclients.dt.src
	$(RM) $@
	$(GENCPP) -P -C -DXCOMM=# $(LOCAL_CPP_DEFINES) $< > $@

EXTRA_DIST = \
    DisplayImage.dt \
    DisplayPDF.dt \
    DisplayPS.dt \
    DisplayVideo.dt \
    Education.dt \
    Games.dt \
    Graphics.dt \
    IconBrowse.dt.src \
    Internet.dt \
    Media_Tools.dt \
    Office.dt \
    System.dt \
    TeX.dt \
    acroread.dt \
    action \
    amarok.dt \
    autoStart.dt.src \
    brasero.dt \
    caja.dt \
    chromium.dt \
    compat.dt.src \
    datatypes.dt.src \
    develop.dt.src \
    dreamchess.dt \
    dt.dt.src \
    dt.softinit.src \
    dtappman.dt.src \
    dtbuilder.dt \
    dtcm.dt.src \
    dtfile.dt.src \
    dthelp.dt.src \
    dthelpprint.dt.src \
    dthelptag.dt.src \
    dtims.dt.src \
    dtinfo.dt.src \
    dtmail.dt.src \
    dtpad.dt.src \
    dtscreen.dt.src \
    dtwm.fp.src \
    eboard.dt \
    emacs.dt \
    engrampa.dt \
    error.ds.src \
    file-roller.dt \
    firefox.dt \
    firestarter.dt \
    fontforge.dt \
    gcompris.dt \
    geogebra.dt \
    gimp.dt \
    gv.dt \
    hp.dt.src \
    ibm.dt.src \
    inkscape.dt \
    k3b.dt \
    k9copy.dt \
    kile.dt \
    ktuberling.dt \
    laserrom.dt.src \
    lbreakout2.dt \
    libreoffice-base.dt \
    libreoffice-calc.dt \
    libreoffice-draw.dt \
    libreoffice-impress.dt \
    libreoffice-main.dt \
    libreoffice-math.dt \
    libreoffice-writer.dt \
    mgv.dt \
    miscActions.dt.src \
    miscImages.dt.src \
    nedit.dt \
    nxclient.dt \
    okular.dt \
    pavucontrol.dt \
    pgadmin.dt \
    powermanga.dt \
    print.dt.src \
    printerNN.dt.src \
    pychess.dt \
    rhythmbox.dt \
    rosegarden.dt \
    skype.dt \
    sound-juicer.dt \
    stellarium.dt \
    sunOW.dt.src \
    supertux.dt \
    synaptic.dt \
    thunderbird.dt \
    tuxpaint.dt \
    unsupported.dt.src \
    user-prefs.dt.src \
    uxstd.dt.src \
    videoTypes.dt \
    virtualbox.dt \
    vlc.dt \
    wicd.dt \
    xboard.dt \
    xclients.dt.src \
    xdvi.dt \
    xine.dt \
    xournal.dt \
    xpdf.dt \
    xv.dt
