#ifneq ($(filter 6753, $(TARGET_DEVICE)),)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_RESOURCE_DIR := \
    $(LOCAL_PATH)/res

LOCAL_PACKAGE_NAME := KernelAdiutor
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true


LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

# Use the folloing include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))
#endif
