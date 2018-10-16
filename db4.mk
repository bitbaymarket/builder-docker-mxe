# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := db4
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 4.8.30
$(PKG)_CHECKSUM := 12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef
$(PKG)_SUBDIR   := db-$($(PKG)_VERSION).NC
$(PKG)_FILE     := db-$($(PKG)_VERSION).NC.tar.gz
$(PKG)_URL      := https://github.com/yshurik/mxe/releases/download/base1/$($(PKG)_FILE)
$(PKG)_DEPS     := cc

define $(PKG)_UPDATE
    $(WGET) -q -O- 'https://www.oracle.com/technetwork/database/database-technologies/berkeleydb/downloads/index.html' | \
    $(SED) -n 's,.*/db-\([0-9\.]\+\)\.tar.gz.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)/build_unix' && ../dist/configure \
        $(MXE_CONFIGURE_OPTS) \
        --enable-mingw \
        --enable-cxx \
        --enable-cryptography \
        --disable-replication

    $(MAKE) -C '$(1)/build_unix' -j '$(JOBS)'
    $(MAKE) -C '$(1)/build_unix' -j 1 install $(MXE_DISABLE_DOCS)
endef

$(PKG)_BUILD_SHARED =
