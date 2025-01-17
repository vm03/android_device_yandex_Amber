ifeq ($(call my-dir),$(call project-path-for,qcom-camera))
MM_V4L2_DRIVER_LIST += msm8960
MM_V4L2_DRIVER_LIST += msm8974
MM_V4L2_DRIVER_LIST += msm8916
MM_V4L2_DRIVER_LIST += msm8226
MM_V4L2_DRIVER_LIST += msm8610
MM_V4L2_DRIVER_LIST += apq8084
MM_V4L2_DRIVER_LIST += mpq8092
MM_V4L2_DRIVER_LIST += msm_bronze
MM_V4L2_DRIVER_LIST += msm8916
MM_V4L2_DRIVER_LIST += msm8994
MM_V4L2_DRIVER_LIST += msm8084
MM_V4L2_DRIVER_LIST += msm8909
MM_V4L2_DRIVER_LIST += msm8952
MM_V4L2_DRIVER_LIST += msm8996
MM_V4L2_DRIVER_LIST += msm8992
MM_V4L2_DRIVER_LIST += msm8937
MM_V4L2_DRIVER_LIST += msm8953
MM_V4L2_DRIVER_LIST += apq8098_latv
MM_V4L2_DRIVER_LIST += msm8998
MM_V4L2_DRIVER_LIST += sdm660

ifneq (,$(filter $(MM_V4L2_DRIVER_LIST),$(TARGET_BOARD_PLATFORM)))
  ifneq ($(strip $(USE_CAMERA_STUB)),true)
    ifneq ($(BUILD_TINY_ANDROID),true)
        ifeq ($(USE_OSS_CAMERA),true)
            include $(call all-subdir-makefiles)
        endif
    endif
  endif
endif
endif
