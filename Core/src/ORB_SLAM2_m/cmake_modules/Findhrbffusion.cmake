###############################################################################
# Find efusion
#
# This sets the following variables:
# EFUSION_FOUND - True if EFUSION was found.
# EFUSION_INCLUDE_DIRS - Directories containing the EFUSION include files.
# EFUSION_LIBRARIES - Libraries needed to use EFUSION.

find_path(HRBFFUSION_INCLUDE_DIR HRBFFusion.h
          PATHS
          /datadrive/workspace/JIL/2023.new_product/experiments/3d_reconstruction/HRBFFusion3D/Core/src/ 
            ${CMAKE_CURRENT_SOURCE_DIR}/../src
          PATH_SUFFIXES src
)

find_library(HRBFFUSION_LIBRARY
             NAMES libhrbffusion.so
             PATHS
               ${CMAKE_CURRENT_SOURCE_DIR}/../../build
               ${CMAKE_CURRENT_SOURCE_DIR}/../../Core/src/build
             PATH_SUFFIXES ${EFUSION_PATH_SUFFIXES}
)

set(HRBFFUSION_INCLUDE_DIRS ${HRBFFUSION_INCLUDE_DIR})
set(HRBFFUSION_LIBRARIES ${HRBFFUSION_LIBRARY})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HRBFFUSION DEFAULT_MSG HRBFFUSION_LIBRARY HRBFFUSION_INCLUDE_DIR)

if(NOT WIN32)
  mark_as_advanced(HRBFFUSION_LIBRARY HRBFFUSION_INCLUDE_DIR)
endif()
