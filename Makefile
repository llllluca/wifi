# wifi, simpler cli than nmcli to connect to wifi
VERSION = 1.0

# paths
PREFIX = /usr/local

all:
	@echo wifi, version: ${VERSION}
	@echo Customize the path variables in the Makefile and use \'$$ make install\'.

install: 
	mkdir -p ${PREFIX}/bin
	cp -f wifi ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/wifi

uninstall:
	rm -f ${PREFIX}/bin/wifi 

.PHONY: all install uninstall
