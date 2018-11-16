LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_RRO_THEME := NotchClt
LOCAL_CERTIFICATE := platform

LOCAL_SRC_FILES := $(call all-subdir-java-files)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_PACKAGE_NAME := NotchClt
LOCAL_SDK_VERSION := current

LOCAL_IS_RUNTIME_RESOURCE_OVERLAY := true
LOCAL_MODULE_PATH := $(TARGET_OUT)/app/NotchClt
include $(BUILD_PACKAGE)

