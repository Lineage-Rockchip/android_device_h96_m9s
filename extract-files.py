#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_lib import (
    lib_fixups,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/rockchip/rk3576-common',
    'vendor/rockchip/rk3576-common',
]

# Everything on this board is generic to the RK3576 platform, so there are no
# board-specific blobs and no board-specific fixups. Both live in
# device/rockchip/rk3576-common.
module = ExtractUtilsModule(
    'm9s',
    'h96',
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'rk3576-common', 'rockchip')
    utils.run()
