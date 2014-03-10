# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/roamer2/roamer2.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := roamer2
PRODUCT_NAME := cm_roamer2
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := V790(KIS III)
PRODUCT_MANUFACTURER := ZTE
PRODUCT_RELEASE_NAME := V790(KIS III)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=roamer2 BUILD_ID=JRO03C BUILD_FINGERPRINT=ZTE/V790_JB4_2/roamer2:4.2/JOP40C/20121121.110335:user/release-keys PRIVATE_BUILD_DESC="V790_JB4_2-user 4.2 JOP40C 20121121.110335 release-keys" BUILD_NUMBER=20121121.110335
