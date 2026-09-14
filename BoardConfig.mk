#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/h96/m9s

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := rk30board

## DTB
# Built from arch/arm64/boot/dts/rockchip/rk3576-m9s.dts in the kernel tree.
# The board itself is rk3576-h96-max.dtsi, shared with the M9; only the IR
# remote key tables differ between the two. Both keep the stock model and
# compatible strings ("rockchip,rk3576-evb1-v10") because the Rockchip HALs
# match on them.
TARGET_DTB_NAME := rk3576-m9s

## Partitions
# From the stock dump; read by the common BoardConfig, so set before the include.
BOARD_SUPER_PARTITION_SIZE := 4294967296

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Display
# 320, not stock's 213; pairs with PRODUCT_AAPT_PREF_CONFIG in device.mk.
TARGET_SCREEN_DENSITY := 320

## Include the common tree BoardConfig makefile
include device/rockchip/rk3576-common/BoardConfigCommon.mk

## Kernel config, board delta -- after the include so it is merged last
TARGET_KERNEL_CONFIG_EXT += \
    $(TARGET_KERNEL_SOURCE)/arch/arm64/configs/rk3576_m9s.config

## Include the proprietary BoardConfig makefile
-include vendor/h96/m9s/BoardConfigVendor.mk
