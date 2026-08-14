#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

## TEE
# OP-TEE backed keymint/gatekeeper/weaver come from the stock vendor image.
TARGET_HAS_TEE := true

## Inherit from the common tree product makefile
$(call inherit-product, device/rockchip/rk3576-common/rk3576.mk)

## Inherit from the proprietary files makefile
$(call inherit-product-if-exists, vendor/h96/m9s/m9s-vendor.mk)
