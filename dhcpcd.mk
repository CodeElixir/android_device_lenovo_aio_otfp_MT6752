LOCAL_PATH := device/lenovo/aio_otfp

# dhcpcd
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \
	$(LOCAL_PATH)/prebuilt/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \
	$(LOCAL_PATH)/prebuilt/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured