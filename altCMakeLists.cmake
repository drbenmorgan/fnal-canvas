# - Canvas top level build
# Project setup
cmake_minimum_required(VERSION 3.3.0)

# - Policies - set all here as may influence project() call
# None needed as of v3.3.0

project(canvas VERSION 1.3.1)

# - We can also use a postfix to distinguish the debug lib from
# others if different build modes are ABI incompatible (can be
# extended to other modes)
set(canvas_DEBUG_POSTFIX "d")

#-----------------------------------------------------------------------
# Standard and Custom CMake Modules
#
# - Cetbuildtools, version2
find_package(cetbuildtools2 0.1.0 REQUIRED)
list(INSERT CMAKE_MODULE_PATH 0 ${cetbuildtools2_MODULE_PATH})
include(CetInstallDirs)
include(CetCMakeSettings)
include(CetCompilerSettings)

# C++ Standard Config
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(canvas_COMPILE_FEATURES
  cxx_auto_type
  cxx_generic_lambdas
  )

# - Our our modules
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/Modules)
include(artInternalTools)
include(artTools)
include(ArtDictionary)

# Temp fix to override flavorqual_dir
set(BASE_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/BuildProducts")
set(flavorqual_dir "${BASE_OUTPUT_DIRECTORY}/${CMAKE_INSTALL_LIBDIR}")

# Implement SSE2 as option?
#cet_have_qual(sse2 SSE2)
#if ( SSE2 )
#  cet_add_compiler_flags(CXX -msse2 -ftree-vectorizer-verbose=2)
#endif()

# Use an imported target for checkClassVersion to give transparency
# between art build and client usage.
# This *is* a little messy, but eases the writing of the scripts for
# full portability between the art build and clients.
# We set it up *here* because we need to append the library output
# directory to checkClassVersion's search path.
#add_executable(canvas::checkClassVersion IMPORTED)
#set_target_properties(canvas::checkClassVersion PROPERTIES IMPORTED_LOCATION
#  ${CMAKE_CURRENT_SOURCE_DIR}/tools/checkClassVersion
#  )
#checkclassversion_append_path(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

#-----------------------------------------------------------------------
# Required Third Party Packages

set(canvas_MIN_BOOST_VERSION "1.60.0")

set(Boost_NO_BOOST_CMAKE ON)
# - Ensure we can refind Boost and extra components we need
find_package(Boost ${canvas_MIN_BOOST_VERSION}
  REQUIRED
    date_time
    unit_test_framework
    program_options
    thread
  )

# CLHEP supplies a CMake project config...
find_package(CLHEP 2.3.2.2 REQUIRED)

# SQLite3 - NB messagefacility also depends on and exposes this...
find_package(SQLite 3.8.5 REQUIRED)

# Cross check with what ROOT supply - ideally would like component
# based checks.
find_package(ROOT 6.06.02 REQUIRED)
# - Must have Python support - it doesn't work as a COMPONENT
# argument to find_package because Root's component lookup only
# works for libraries.
if(NOT ROOT_python_FOUND)
  message(FATAL_ERROR "canvas requires ROOT with Python support")
endif()

find_package(cetlib 1.17.4 REQUIRED)
find_package(fhiclcpp 3.18.4 REQUIRED)
find_package(messagefacility 1.16.24 REQUIRED)

# Need to implement
find_package(TBB 4.3.0 REQUIRED)

#-----------------------------------------------------------------------
# Set up paths for all subbuilds
#
include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_BINARY_DIR})


# source
add_subdirectory(canvas)

# cmake modules

add_subdirectory(Modules)

#-----------------------------------------------------------------------
# Install support files - usage from install tree only...
#
include(CMakePackageConfigHelpers)
configure_package_config_file(
  Modules/canvasConfig.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/canvasConfig.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/canvas-${canvas_VERSION}
  PATH_VARS
    CMAKE_INSTALL_INCLUDEDIR
    CMAKE_INSTALL_LIBDIR
    CMAKE_INSTALL_BINDIR
  )

write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/canvasConfigVersion.cmake
  VERSION ${canvas_VERSION}
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
  ${CMAKE_CURRENT_BINARY_DIR}/canvasConfig.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/canvasConfigVersion.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/canvas-${canvas_VERSION}
  COMPONENT Development
  )

install(EXPORT CanvasLibraries
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/canvas-${canvas_VERSION}
  NAMESPACE canvas::
  COMPONENT Development
  )

#-----------------------------------------------------------------------
# Package for Source and Binary
#
include(CPack)
