#
# Copyright (C) 2018 The LineageOS Project
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

include vendor/huawei/hi6250/hi6250-vendor.mk
include $(LOCAL_PATH)/vendor_props.mk

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# APN configs
PRODUCT_COPY_FILES += \
        configs/etc/apns-conf.xml:system/etc/apns-conf.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Device init scripts
PRODUCT_PACKAGES += \
    init.bcm43xx.rc \
    init.hisi.rc \
    init.hi6250.rc \
    init.hi6250.ab.rc \
    init.hi6250.environ.rc

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Google Play
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sysconfig/google.xml:system/etc/sysconfig/google.xml \

# Graphics
PRODUCT_PACKAGES += \
    libion

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Fingerprint
PRODUCT_PACKAGES += \
	hw-fpnav-daemon

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/hw-fingerprint.rc:system/etc/init/hw-fingerprint.rc \
    $(LOCAL_PATH)/keylayout/hw-fpnav:system/bin/hw-fpnav \
    $(LOCAL_PATH)/keylayout/hw-fpnav.dex:system/usr/keylayout/hw-fpnav.dex \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# Media Codecs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/etc/media-codec-blacklist:system/etc/media-codec-blacklist

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

# NFC confs
PRODUCT_COPY_FILES += \
    device/huawei/hi6250/nfc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    device/huawei/hi6250/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/huawei/hi6250/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-huawei

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null

# Radio
ifeq ($(TARGET_AOSP_BASED),)
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext
endif

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.hi6250.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/releasetools.hi6250.sh

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages \
    RemovePackages2

# Selinux
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sepolicy/27.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/27.0.cil

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.hi6250

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/ld.config.26.txt:system/etc/ld.config.26.txt \
    $(LOCAL_PATH)/vndk-compat/llndk.libraries.26.txt:system/etc/llndk.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/vndksp.libraries.26.txt:system/etc/vndksp.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/ld.config.27.txt:system/etc/ld.config.27.txt

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2

# Huawei overlays
PRODUCT_PACKAGES += \
    treble-overlay-huawei-ANE \
    treble-overlay-huawei-BND \
    treble-overlay-huawei-BLN \
    treble-overlay-huawei-FIG \
    treble-overlay-huawei-LLD \
    treble-overlay-huawei-PRA \
    treble-overlay-huawei-RNE \
    treble-overlay-huawei-WAS

# Codec
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/media-codec-blacklist:system/etc/media-codec-blacklist

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/rootdir/etc/gps.conf:system/etc/gps_debug.conf

# Huawei HiSuite (also other OEM custom programs I guess) it's of no use in AOSP builds
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=adb
