include $(TOPDIR)/rules.mk

PKG_NAME:=dnsmasq
PKG_VERSION:=2.72
PKG_RELEASE:=6

PKG_SOURCE:=master.zip
PKG_SOURCE_URL:=https://github.com/aa65535/dnsmasq/archive
PKG_CAT:=unzip
PKG_MAINTAINER:=Simon Kelley <simon@thekelleys.org.uk>

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-master

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dnsmasq/Default
	SECTION:=net
	CATEGORY:=Base system
	TITLE:=DNS and DHCP server $(3)
	URL:=https://github.com/aa65535/dnsmasq
	DEPENDS:=$(2)
	VARIANT:=$(1)
endef

Package/dnsmasq = $(call Package/dnsmasq/Default,nodhcpv6)
Package/dnsmasq-dhcpv6 = $(call Package/dnsmasq/Default,dhcpv6,@IPV6 +kmod-ipv6,(with DHCPv6 support))
Package/dnsmasq-full = $(call Package/dnsmasq/Default,full,@IPV6 +kmod-ipv6 +libnettle,(with DNSSEC, DHCPv6, Auth DNS, IPSET))

define Package/dnsmasq/description
It is intended to provide coupled DNS and DHCP service to a LAN.
endef

define Package/dnsmasq-dhcpv6/description
	$(call Package/dnsmasq/description)
This is a variant with DHCPv6 support
endef

define Package/dnsmasq-full/description
	$(call Package/dnsmasq/description)
This is a variant with DHCPv6, DNSSEC, Authroitative DNS and IPSET support
endef

define Package/dnsmasq/conffiles
/etc/config/dhcp
/etc/dnsmasq.conf
endef

Package/dnsmasq-dhcpv6/conffiles = $(Package/dnsmasq/conffiles)
Package/dnsmasq-full/conffiles = $(Package/dnsmasq/conffiles)

TARGET_CFLAGS += -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

COPTS = $(if $(CONFIG_IPV6),,-DNO_IPV6)

ifeq ($(BUILD_VARIANT),nodhcpv6)
	COPTS += -DNO_DHCP6
endif

ifeq ($(BUILD_VARIANT),full)
	COPTS += -DHAVE_DNSSEC
	COPTS += $(if $(CONFIG_LIBNETTLE_MINI),-DNO_GMP,)
else
	COPTS += -DNO_AUTH -DNO_IPSET
endif

MAKE_FLAGS := \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	COPTS="$(COPTS)" \
	PREFIX="/usr"

define Package/dnsmasq/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/dnsmasq $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/dhcp.conf $(1)/etc/config/dhcp
	$(INSTALL_CONF) ./files/dnsmasq.conf $(1)/etc/dnsmasq.conf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/dnsmasq.init $(1)/etc/init.d/dnsmasq
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DATA) ./files/dnsmasq.hotplug $(1)/etc/hotplug.d/iface/25-dnsmasq
endef

Package/dnsmasq-dhcpv6/install = $(call Package/dnsmasq/install,$(1))

define Package/dnsmasq-full/install
	$(call Package/dnsmasq/install,$(1))
	$(INSTALL_DIR) $(1)/usr/share/dnsmasq
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/trust-anchors.conf $(1)/usr/share/dnsmasq
endef

$(shell $(RM) $(DL_DIR)/$(PKG_SOURCE))
$(eval $(call BuildPackage,dnsmasq))
$(eval $(call BuildPackage,dnsmasq-dhcpv6))
$(eval $(call BuildPackage,dnsmasq-full))
