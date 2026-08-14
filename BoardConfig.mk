#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/h96/m9s

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := rk30board

## DTB
# The stock firmware ships the RK3576 EVB1 V10 device tree
# (compatible = "rockchip,rk3576-evb1-v10") unmodified.
TARGET_DTB_NAME := rk3576-m9s

## Partitions
BOARD_SUPER_PARTITION_SIZE := 4294967296

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Include the common tree BoardConfig makefile
include device/rockchip/rk3576-common/BoardConfigCommon.mk

## Include the proprietary BoardConfig makefile
-include vendor/h96/m9s/BoardConfigVendor.mk
