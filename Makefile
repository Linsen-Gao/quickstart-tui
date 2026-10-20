include $(TOPDIR)/rules.mk

PKG_NAME:=quickstart-tui
PKG_VERSION:=0.12.10
PKG_RELEASE:=1

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/quickstart-tui
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=QuickStart TUI (Install X86 only)
  DEPENDS:=+parted +e2fsprogs +libblkid +bash +lsblk +libsmartcols +block-mount +kmod-fs-ext4
endef

define Package/quickstart-tui/description
  QuickStart TUI for iStoreOS, only Install X86 function.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(CURDIR)/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR) && \
	CGO_ENABLED=0 GO111MODULE=on \
	$(STAGING_DIR_HOSTPKG)/lib/go-1.26/bin/go build -trimpath -ldflags "-s -w" -o $(PKG_BUILD_DIR)/quickstart ./cmd/backend
endef

define Package/quickstart-tui/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/quickstart $(1)/usr/bin/quickstart
endef

$(eval $(call BuildPackage,quickstart-tui))
