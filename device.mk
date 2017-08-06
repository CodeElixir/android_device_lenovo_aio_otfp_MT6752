
#
# Copyright 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_as_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/lenovo/aio_otfp

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Hack for building without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

#Prebuilt Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel 

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := aio_otfp_m,aio_otfp,aio_5m,k50a40,k50t5,K50-t5

# RIL
PRODUCT_PACKAGES += \
    libccci_util 

# Radio dependencies
 PRODUCT_PACKAGES += \
     muxreport \
     terservice

# Camera
PRODUCT_PACKAGES += \
    libcam.halsensor 
    
PRODUCT_PACKAGES += \
	libwvmsym

# Graphic
PRODUCT_PACKAGES += \
	libgralloc_extra 

PRODUCT_PACKAGES += \
	libnl_2 

# Power
PRODUCT_PACKAGES += \
    power.default \
    power.mt6752
    
PRODUCT_TAGS += dalvik.gc.type-precise

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilt/etc/audio_em.xml:system/etc/audio_em.xml \
	$(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/etc/audio_param/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml
# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/mediacodecs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/mediacodecs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/mediacodecs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/mediacodecs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/mediacodecs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/mediacodecs/media_codecs.xml:system/etc/permissions/media_codecs.xml 


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bt_stack.conf.debug:system/etc/bluetooth/bt_stack.conf.debug \
	$(LOCAL_PATH)/prebuilt/etc/bluetooth/bt_stack.conf.sqc:system/etc/bluetooth/bt_stack.conf.sqc

# GPS
PRODUCT_PACKAGES += \
    gps.mt6752 \
    libcurl \
    YGPS

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/gps/slp_conf:system/etc/slp_conf \
    $(LOCAL_PATH)/prebuilt/etc/gps/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml


# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/fstab.mt6752:root/fstab.mt6752 \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6752.usb.rc:root/init.mt6752.usb.rc \
    $(LOCAL_PATH)/rootdir/init.mt6752.rc:root/init.mt6752.rc \
    $(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6752.rc:root/ueventd.mt6752.rc

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Charger
PRODUCT_PACKAGES += \
    charger

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.mount.fs=EXT4

# default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    persist.service.acm.enable=0 \
    persist.sys.usb.config=mtp,adb \
    ro.config.low_ram=false \
    ro.mount.fs=EXT4 

# Tethering
 PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.adb.secure=0 

# build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.sys.root_access=0 \
    ro.sys.fw.bg_apps_limits=5

# extra log controls prop
PRODUCT_PROPERTY_OVERRIDES += \
    persist.ril.log=0 \
    ro.disable.xlog=0

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Common stuff
$(call inherit-product, device/lenovo/aio_otfp/configs/common.mk)

# Vendor
$(call inherit-product, vendor/lenovo/aio_otfp/aio_otfp-vendor.mk)
