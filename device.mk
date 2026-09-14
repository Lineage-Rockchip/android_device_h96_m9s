#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## TEE
# OP-TEE backed keymint/gatekeeper/weaver come from the stock vendor image.
TARGET_HAS_TEE := true

## Infrared remote
# Board-specific on both counts: the file name has to match the input device,
# which is the PWM node the Rockchip IR driver binds to on this SoC
# ('27330000.pwm', with '.' -> '_'), and the keycodes it can emit are fixed by
# the rockchip,key_table nodes in this board's dts. The Edge-2L dump the blobs
# come from has no vendor/usr directory at all, so without this Android falls
# back to Generic.kl and the remote does nothing.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/27330000_pwm.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/27330000_pwm.kl

## Screen density
# 320 (xhdpi), not stock's 213; pairs with TARGET_SCREEN_DENSITY.
PRODUCT_AAPT_CONFIG := xlarge large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## Bluetooth transport
# Both name the controller's UART (/dev/ttyS4); keep them together.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/init-files/init.connectivity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.connectivity.rc

## Boot-time kernel modules (ethernet PHY + MAC)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init-files/init.insmod.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.cfg

## Inherit from the common tree product makefile
$(call inherit-product, device/rockchip/rk3576-common/rk3576.mk)

## Inherit from the proprietary files makefile
$(call inherit-product-if-exists, vendor/h96/m9s/m9s-vendor.mk)
