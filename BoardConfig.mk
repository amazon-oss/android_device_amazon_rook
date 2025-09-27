#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/amazon/rook

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := rook

# Kernel
TARGET_KERNEL_CONFIG := rook_defconfig

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 268434432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1744830464

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# VNDK
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Wi-Fi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

# Inherit from mt8163-common
include device/amazon/mt8163-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/amazon/rook/BoardConfigVendor.mk
