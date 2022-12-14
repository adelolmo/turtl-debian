MAKEFLAGS += --silent

APP_HOME = usr/share/turtl
TAR_FILE = turtl-linux-$(VERSION)-$(ARCH).tar.bz2
TAR_URL = https://github.com/turtl/desktop/releases/download/v$(VERSION)/turtl-$(VERSION)-linux$(TAR_ARCH).tar.bz2

VERSION = 0.7.2.6-pre-sync-fix
PACKAGE_VERSION = ~ado1

BUILD_DIR = build
RELEASE_DIR := $(realpath $(CURDIR)/..)
TMP_DIR = $(BUILD_DIR)/tmp
TAR_CACHE = $(BUILD_DIR)/$(TAR_FILE)
PLATFORM := $(shell uname -m)

ARCH :=
	ifeq ($(PLATFORM),x86_64)
		ARCH = amd64
	endif
	ifeq ($(PLATFORM),aarch64)
		ARCH = arm64
	endif
	ifeq ($(PLATFORM),armv7l)
		ARCH = armhf
	endif
TAR_ARCH :=
	ifeq ($(ARCH),amd64)
		TAR_ARCH = 64
	endif
	ifeq ($(ARCH),i386)
		TAR_ARCH = 32
	endif

package: clean prepare $(TAR_CACHE) cp control
	@echo Building package $(VERSION) $(ARCH)...
	fakeroot dpkg-deb -b -z9 $(TMP_DIR) $(RELEASE_DIR)

clean:
	rm -rf $(TMP_DIR)

prepare:
	mkdir -p $(RELEASE_DIR) $(TMP_DIR)/$(APP_HOME)
	mkdir -p $(TMP_DIR)/usr/share/pixmaps

$(TAR_CACHE):
	@echo Downloading tar ball $(VERSION) $(TAR_ARCH)...
	wget --quiet -O $(TAR_CACHE) $(TAR_URL)

cp:
	cp -R deb/* $(TMP_DIR)
	cp $(TAR_CACHE) $(TMP_DIR)/$(APP_HOME)
	tar xf $(TAR_CACHE) --strip-components 3 --directory=$(TMP_DIR)/$(APP_HOME)
	mv $(TMP_DIR)/$(APP_HOME)/icon.png $(TMP_DIR)/usr/share/pixmaps/turtl.png
	rm -rf $(TMP_DIR)/$(APP_HOME)/$(TAR_FILE)

control:
	$(eval SIZE=$(shell du -sbk $(TMP_DIR)/ | grep -o '[0-9]*'))
	sed -i "s/{{version}}/$(VERSION)$(PACKAGE_VERSION)/;s/{{size}}/$(SIZE)/;s/{{architecture}}/$(ARCH)/" $(TMP_DIR)/DEBIAN/control
