#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Not set in time to check, so set before everything else
PRODUCT_IS_ATV := true

# Inherit some common AOSP stuff
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := H96
PRODUCT_DEVICE := m9s
PRODUCT_MANUFACTURER := rockchip
PRODUCT_MODEL := H96 Max M9S
PRODUCT_NAME := lineage_m9s
PRODUCT_SYSTEM_NAME := m9s

PRODUCT_GMS_CLIENTID_BASE := android-rockchip-tv

# Stock reports itself as an ADT-3 style ATV build; keep a matching descriptor
# so ATV apps that gate on a known fingerprint behave.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="adt3-user 14 UTM1.240509.001 11749621 release-keys" \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_NAME)

BUILD_FINGERPRINT := google/adt3/adt3:14/UTM1.240509.001/11749621:user/release-keys
