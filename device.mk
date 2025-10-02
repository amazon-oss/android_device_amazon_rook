#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml

# Init scripts
PRODUCT_PACKAGES += \
    init.target.rook.rc

# Kernel Modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

PRODUCT_PACKAGES += \
    amzn-bcmdhd

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResOverlayRook \
    SystemUIOverlayRook

# Screen
TARGET_SCREEN_DENSITY := 160
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 480

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 22

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vendor partition
TARGET_HAS_VENDOR_PARTITION := false

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service-lazy \
    wpa_supplicant.conf \
    libwifi-hal

PRODUCT_PACKAGES += \
    WifiResOverlayRook

PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Inherit from mt8163-common
$(call inherit-product, device/amazon/mt8163-common/mt8163.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/amazon/rook/rook-vendor.mk)
