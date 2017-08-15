# Common overlays
#DEVICE_PACKAGE_OVERLAYS += device/lenovo/aio_otfp/overlay

# AOSP packages
PRODUCT_PACKAGES += \
    Launcher3 \
    messaging \
    SoundRecorder \
    SpeechRecorder
    
# Display
PRODUCT_PACKAGES += \
    libion

# Charger
PRODUCT_PACKAGES += \
    charger

# Power
PRODUCT_PACKAGES += \
    power.default \
    power.mt6752

# Basic apps
PRODUCT_PACKAGES += \
    Stk \
    Torch \
    Snap \
    Jelly  

# MTK's Engineer Mode
PRODUCT_PACKAGES += \
    EngineerMode \
    

# MTK's XLog needed for Engineer Mode
PRODUCT_PACKAGES += \
 	libxlog
 	
# FMRadio
PRODUCT_PACKAGES += \
    FMRadio

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs

# exFAT
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
	setup_fs \
	ext4_resize \
    resize_ext4 \
	superumount 
	
# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# WallpaperPicker
PRODUCT_PACKAGES += \
    WallpaperPicker

# Sensor Calibration
PRODUCT_PACKAGES += \
    libem_sensor_jni

# CMActions
PRODUCT_PACKAGES += \
    CMActions

 # Live Display
 PRODUCT_PACKAGES += \
 	libjni_livedisplay

# Bootanimation
#PRODUCT_COPY_FILES += \
    device/lenovo/aio_otfp/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Doze
PRODUCT_PACKAGES += \
    LenovoDoze
    
# PocketMod app
PRODUCT_PACKAGES += \
    PocketMode

# Include other configs
include device/lenovo/aio_otfp/configs/permissions.mk
include device/lenovo/aio_otfp/configs/media.mk
include device/lenovo/aio_otfp/configs/wifi.mk
include device/lenovo/aio_otfp/configs/telephony.mk
include device/lenovo/aio_otfp/configs/dhcpcd.mk
include device/lenovo/aio_otfp/configs/wide-dhcpv6.mk
include device/lenovo/aio_otfp/configs/fm.mk