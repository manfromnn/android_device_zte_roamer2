#
# Copyright (C) 2011 The Android Open-Source Project
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
-include vendor/zte/roamer2/BoardConfigVendor.mk

ifeq ($(QC_PROP),true)
    BOARD_USES_QCOM_HARDWARE := true
    DYNAMIC_SHARED_LIBV8SO := true
    BOARD_USES_ADRENO_200 := true
    HAVE_ADRENO200_SOURCE := true
    HAVE_ADRENO200_SC_SOURCE := true
    HAVE_ADRENO200_FIRMWARE := true
    BOARD_USES_QCNE := true
    USE_OPENGL_RENDERER := false
    TARGET_USES_MDP3 := true
    #BOARD_USE_QCOM_LLVM_CLANG_RS := true
    MM_AUDIO_OMX_ADEC_EVRC_DISABLED := true
    MM_AUDIO_OMX_ADEC_QCELP13_DISABLED := true
    MM_AUDIO_FTM_DISABLED := true
    MM_AUDIO_MEASUREMENT_DISABLED := true
    MM_AUDIO_VOEM_DISABLED := true
    MM_AUDIO_MVS_DISABLED :=true
    TARGET_NO_RPC := false
    TARGET_USES_ION := true
    ifneq ($(BUILD_TINY_ANDROID), true)
   #BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
   #BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
    BOARD_HAVE_BLUETOOTH := true
    #BOARD_HAVE_QCOM_FM := true
    PROTEUS_DEVICE_API := true
    #HACK use Camera Stub
    BOARD_CAMERA_LIBRARIES := libcamera
    # Define respective statement to true to enable the ATH or WCN WLAN.
    BOARD_HAS_QCOM_WLAN := true
    BOARD_HAS_ATH_WLAN := false

    ifeq ($(findstring true,$(BOARD_HAS_ATH_WLAN) $(BOARD_HAS_QCOM_WLAN)),true)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_HOSTAPD_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    HOSTAPD_VERSION := VER_0_8_X
    WIFI_CFG80211_DRIVER_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
    WIFI_CFG80211_DRIVER_MODULE_NAME := "cfg80211"
    WIFI_CFG80211_DRIVER_MODULE_ARG  := ""
    WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
    WIFI_DRIVER_MODULE_NAME := "wlan"
    WIFI_DRIVER_MODULE_ARG := ""

    WIFI_TEST_INTERFACE     := "sta"
    WIFI_DRIVER_FW_PATH_STA := "sta"
    WIFI_DRIVER_FW_PATH_AP  := "ap"
    WIFI_DRIVER_FW_PATH_P2P := "p2p"
    endif

    ifeq ($(BOARD_HAS_QCOM_WLAN), true)
    WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
    WIFI_SDIO_IF_DRIVER_MODULE_NAME := "librasdioif"
    WIFI_SDIO_IF_DRIVER_MODULE_ARG  := ""
    BOARD_WLAN_DEVICE := qcwcn
    endif

    BOARD_USES_SRS_TRUEMEDIA := true
    endif   # !BUILD_TINY_ANDROID

else
    BOARD_USES_GENERIC_AUDIO := true
    USE_CAMERA_STUB := true
endif # QC_PROP

#BOARD_HAVE_QCOM_FM := true
TARGET_HAVE_TSLIB := true

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27a
#TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOOTLOADER_BOARD_NAME := 7x27
TARGET_CPU_SMP := true

TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

TARGET_CORTEX_CACHE_LINE_32 := true


ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp

# Kernel
CROSS_COMPILE := /home/manfromnn/android/linaro-toolchain/bin/arm-eabi-
TARGET_KERNEL_SOURCE := kernel/zte/roamer2_kernel
TARGET_KERNEL_CONFIG := roamer2_jb_defconfig
TARGET_BOOTLOADER_BOARD_NAME := roamer2
BOARD_KERNEL_CMDLINE := androidboot.hardware=roamer2
BOARD_KERNEL_BASE := 0x00200000
BOARD_SUPPORTS_2KNAND_PAGE := true
BOARD_KERNEL_2KPAGESIZE := 2048
BOARD_KERNEL_2KSPARESIZE := 64
BOARD_KERNEL_SPARESIZE := 128
TARGET_USES_UNCOMPRESSED_KERNEL := false

TARGET_SPECIFIC_HEADER_PATH := device/zte/roamer2/include

# Graphics
BOARD_EGL_CFG := device/zte/roamer2/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := false
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_MHEAP_SCREENSHOT := true

# Video
TARGET_QCOM_LEGACY_OMX := true
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
BOARD_NO_TOUCHSCREEN := false

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

# Wi-Fi
#BOARD_WLAN_DEVICE := ath6kl
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
#WPA_SUPPLICANT_VERSION := VER_0_8_X
#WIFI_DRIVER_MODULE_PATH := "/system/wifi/ath6kl_sdio.ko"
#WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
#WIFI_EXT_MODULE_PATH := "/system/wifi/cfg80211.ko"
#WIFI_EXT_MODULE_NAME := "cfg80211"
#WIFI_TEST_INTERFACE := "sta"
#WIFI_DRIVER_FW_PATH_STA := "sta"
#WIFI_DRIVER_FW_PATH_AP  := "ap"
#WIFI_DRIVER_FW_PATH_P2P := "p2p"

# Audio
TARGET_PROVIDES_LIBAUDIO := true
TARGET_QCOM_AUDIO_VARIANT := legacy
BOARD_USES_LEGACY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/zte/roamer2/bluetooth

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DNEEDS_VECTORIMPL_SYMBOLS -DZTE_CAMERA_HARDWARE

# Dalvik
TARGET_ARCH_LOWMEM := true

# FM Radio
# BOARD_HAVE_QCOM_MR1_FM := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_MR1_FM

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := roamer2
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Webkit
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
TARGET_FORCE_CPU_UPLOAD := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/zte/roamer2/cmhw/

# Recovery
TARGET_RECOVERY_FSTAB := device/zte/roamer2/ramdisk/fstab.roamer2
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_UMS_LUNFILE := "sys/class/android_usb/f_mass_storage/lun/file"
TARGET_USERIMAGES_USE_EXT4 := true
COMMON_GLOBAL_CFLAGS += -DRECOVERY_CANT_USE_CONFIG_EXT4_FS_XATTR
SKIP_SET_METADATA := true

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00c00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 460062720
BOARD_CACHEIMAGE_PARTITION_SIZE := 110100480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 429916160
BOARD_FLASH_BLOCK_SIZE := 131072
