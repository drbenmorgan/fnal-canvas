#.rst:
# FindRange-v3
# ------------
#
# Find the Range-v3 Range library for C++11/14/17 headers.
# Note that as of Range-v3 0.3.5, using CMake to install Range-v3
# will install a ``range-v3-config.cmake`` file for use with
# the ``CONFIG`` mode of ``find_package``.
#
# Imported Targets
# ^^^^^^^^^^^^^^^^
#
# This module defines the following :prop_tgt:`IMPORTED` targets:
#
# ``range-v3::range-v3``
#   The Range-v3 INTERFACE library, if found.
#
# Result variables
# ^^^^^^^^^^^^^^^^
#
# This module will set the following variable in your project:
#
# ``Range-v3_FOUND``
#   TRUE if the Range-v3 headers were found
# ``Range-v3_VERSION``
#   Range-v3 version of found headers
# ``Range-v3_INCLUDE_DIRS``
#   Directory containing Range-v3 headers
#
# Cache Variables
# ^^^^^^^^^^^^^^^
#
# This module will set the following cache variables:
#
# ``Range-v3_INCLUDE_DIR``
#   Directory containing the Range-v3 headers
#
#

# - Determine Range-v3 version from #define's in version.hpp
function(_Range_v3_get_version  version_hdr)
  file(STRINGS ${version_hdr} _contents REGEX "^[ \t]*#define RANGE_V3_.*")
  if(_contents)
    string(REGEX REPLACE ".*#define RANGE_V3_MAJOR[ \t]+([0-9]+).*" "\\1" Range-v3_MAJOR "${_contents}")
    string(REGEX REPLACE ".*#define RANGE_V3_MINOR[ \t]+([0-9]+).*" "\\1" Range-v3_MINOR "${_contents}")
    string(REGEX REPLACE ".*#define RANGE_V3_PATCHLEVEL[ \t]+([0-9]+).*" "\\1" Range-v3_PATCHLEVEL "${_contents}")

    if(NOT Range-v3_MAJOR MATCHES "^[0-9]+$")
      message(FATAL_ERROR "Version parsing failed for RANGE_V3_MAJOR!")
    endif()
    if(NOT Range-v3_MINOR MATCHES "^[0-9]+$")
      message(FATAL_ERROR "Version parsing failed for RANGE_V3_MINOR!")
    endif()
    if(NOT Range-v3_PATCHLEVEL MATCHES "^[0-9]+$")
      message(FATAL_ERROR "Version parsing failed for RANGE_V3_PATCHLEVEL!")
    endif()

    set(Range-v3_VERSION "${Range-v3_MAJOR}.${Range-v3_MINOR}.${Range-v3_PATCHLEVEL}" PARENT_SCOPE)
  else()
    message(FATAL_ERROR "Include file ${version_hdr} does not exist or does not contain expected version information")
  endif()
endfunction()

# - Find include directory
find_path(Range-v3_INCLUDE_DIR
  NAMES "range/v3/version.hpp"
  DOC "Range-v3 include directory")
mark_as_advanced(Range-v3_INCLUDE_DIR)

if(Range-v3_INCLUDE_DIR)
  _Range_v3_get_version("${Range-v3_INCLUDE_DIR}/range/v3/version.hpp")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Range-v3
  REQUIRED_VARS Range-v3_INCLUDE_DIR
  VERSION_VAR Range-v3_VERSION)

if(Range-v3_FOUND)
  set(Range-v3_INCLUDE_DIRS "${Range-v3_INCLUDE_DIR}")

  if(NOT TARGET range-v3::range-v3)
    add_library(range-v3::range-v3 INTERFACE IMPORTED)
    set_target_properties(range-v3::range-v3 PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${Range-v3_INCLUDE_DIRS}")
  endif()
endif()

