# wifi, simpler cli than nmcli to connect to wifi
VERSION = 1.0

# paths
PREFIX = /usr/local

all:
	@echo wifi, version: ${VERSION}
	@echo Customize the path variables in the Makefile and use \'$$make install\' \
		or build the debian package with \'$$make package\'.

package:
	dpkg-deb --build debian
	mv debian.deb wifi_${VERSION}-debian.deb

install: 
	mkdir -p ${PREFIX}/bin
	cp -f wifi ${PREFIX}/bin
	chmod 755 ${PREFIX}/bin/wifi

uninstall:
	rm -f ${PREFIX}/bin/wifi 

.PHONY: all install uninstall
