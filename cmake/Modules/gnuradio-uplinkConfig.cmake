find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_UPLINK gnuradio-uplink)

FIND_PATH(
    GR_UPLINK_INCLUDE_DIRS
    NAMES gnuradio/uplink/api.h
    HINTS $ENV{UPLINK_DIR}/include
        ${PC_UPLINK_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_UPLINK_LIBRARIES
    NAMES gnuradio-uplink
    HINTS $ENV{UPLINK_DIR}/lib
        ${PC_UPLINK_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-uplinkTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_UPLINK DEFAULT_MSG GR_UPLINK_LIBRARIES GR_UPLINK_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_UPLINK_LIBRARIES GR_UPLINK_INCLUDE_DIRS)
