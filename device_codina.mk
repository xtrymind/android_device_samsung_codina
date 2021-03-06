#
# Copyright (C) 2013 The Android Open Source Project
# Copyright (C) 2013 Óliver García Albertos (oliverarafo@gmail.com)
# Copyright (C) 2013 Dede Dindin Qudsy (xtrymind@gmail.com)
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/codina/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# The GPS config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Use the Dalvik VM specific for devices with 512 MB of RAM
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Inherit the proprietary vendors
$(call inherit-product-if-exists, vendor/samsung/codina/codina-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/root/init.samsungcodina.rc:root/init.samsungcodina.rc \
    device/samsung/codina/prebuilt/root/init.samsungcodina.usb.rc:root/init.samsungcodina.usb.rc \
    device/samsung/codina/prebuilt/root/fstab.samsungcodina:root/fstab.samsungcodina \
    device/samsung/codina/prebuilt/root/ueventd.samsungcodina.rc:root/ueventd.samsungcodina.rc \
    device/samsung/codina/prebuilt/root/prerecovery.rc:root/prerecovery.rc \
    device/samsung/codina/prebuilt/root/lpm.rc:root/lpm.rc \
    device/samsung/codina/prebuilt/root/lib/modules/j4fs.ko:root/lib/modules/j4fs.ko \
    device/samsung/codina/prebuilt/root/lib/modules/param.ko:root/lib/modules/param.ko

# TouchScreen & Inputs
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Graphics
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg
PRODUCT_PACKAGES += \
    libblt_hw

# OMX
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/codina/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/samsung/codina/prebuilt/system/omxloaders:system/omxloaders \
    device/samsung/codina/prebuilt/system/etc/init.d/02omxsym:system/etc/init.d/02omxsym

# Dbus
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/dbus.conf:system/etc/dbus.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf
PRODUCT_PACKAGES += \
    libnetcmdiface

# RIL
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/AT/manuf_id.cfg:system/etc/AT/manuf_id.cfg \
    device/samsung/codina/prebuilt/system/etc/AT/model_id.cfg:system/etc/AT/model_id.cfg \
    device/samsung/codina/prebuilt/system/etc/AT/system_id.cfg:system/etc/AT/system_id.cfg

# STE Modem and CSPSA
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/cspsa.conf:system/etc/cspsa.conf \
    device/samsung/codina/prebuilt/system/etc/ste_modem.sh:system/etc/ste_modem.sh

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/sirfgps.conf:system/etc/sirfgps.conf

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/codina/prebuilt/system/etc/audio_policy.conf:system/vendor/etc/audio_policy.conf \
    device/samsung/codina/prebuilt/system/etc/Volume.db:system/etc/Volume.db \
    device/samsung/codina/prebuilt/system/etc/asound.conf:system/etc/asound.conf
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default

# Sensors
PRODUCT_PACKAGES += \
    lights.montblanc

# Vold
PRODUCT_COPY_FILES += \
    device/samsung/codina/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Misc packages
PRODUCT_PACKAGES += \
    Torch \
    libaudioutils \
    libtinyalsa \
    SamsungServiceMode \
    com.android.future.usb.accessory

# Non-device-specific props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures = 1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.config.sync=yes

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
 
# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
