UDEVDIR=$(DESTDIR)/lib/udev
RULEDIR=$(DESTDIR)/etc/udev/rules.d
EXTRA_DIST = 60-Logitec_LHR-4BNHEU3.rules Logitec_LHR-4BNHEU3.sh README.md
dist_noinst_SCRIPTS = bootstrap cleanall

install-data-local:
	-$(mkdir_p) $(RULEDIR)
	$(INSTALL_DATA) 60-Logitec_LHR-4BNHEU3.rules $(RULEDIR)
install-exec-local:
	-$(mkdir_p) $(UDEVDIR)
	$(INSTALL) Logitec_LHR-4BNHEU3.sh $(UDEVDIR)
uninstall-local:
	$(RM) $(RULEDIR)/60-Logitec_LHR-4BNHEU3.rules $(UDEVDIR)/Logitec_LHR-4BNHEU3.sh
