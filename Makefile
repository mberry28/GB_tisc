#---------------------------- tisc makefile ----------------------------
#
#Read and modify options in ./config.mk
#
#Type  'make'  in this directory to compile TISC
#
#------------------------------------------------------------------------

include config.mk

all:
	(cd src; make all)
	@echo; echo; echo Compilation done.
	@(echo "ADD  bin/  AND  script/ TO YOUR PATH.")
	@(echo "ADD  setenv tisc_dir `pwd`  TO YOUR VARIABLES.")

clean_for_tar:
	(cd src; make clean)
	(cd demo; rm -f `find . -name '*.all' -print`)
	(cd demo; rm -f `find . -name '*.bas' -print`)
	(cd demo; rm -f `find . -name '*.lak' -print`)
	(cd demo; rm -f `find . -name '*.tmp' -print`)
	(cd demo; rm -f `find . -name '*[0-9][0-9][2-9].jpg' -print`)
	(rm -f `find . -name core -print`)


vers: 	clean_for_tar
	rm -R -f version_tmp tisc
	mkdir version_tmp
	cp -R -L Makefile config.mk README demo doc include lib script src version_tmp 
	mkdir version_tmp/bin
	rm -f version_tmp/doc/first_compilation.txt
	if [ $(findstring THIN_SHEET,$(DEFS)) ]; then echo Including thin sheet stuff; else \
		echo Removing thin sheet stuff; \
		rm version_tmp/lib/*thin_sheet* ; \
		rm version_tmp/lib/sistbanda* ; \
	fi
	if [ $(findstring SURFACE_TRANSPORT,$(DEFS)) ]; then echo Including surface processes stuff; else \
		echo Removing surface processes stuff; \
		rm version_tmp/src/*surf_proc* ; \
	fi
	mv version_tmp tisc
	tar -chf tisc.tar tisc
	chmod og-r tisc.tar
	gzip tisc.tar
	mv tisc version_tmp
	rm -R -f version_tmp

