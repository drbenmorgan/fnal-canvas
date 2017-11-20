# - Canvas top level build
# Project setup
cmake_minimum_required(VERSION 3.3.0)
project(canvas VERSION 1.4.2)

# - Cetbuildtools, version2
find_package(cetbuildtools2 0.2.0 REQUIRED)
list(INSERT CMAKE_MODULE_PATH 0 ${cetbuildtools2_MODULE_PATH})
set(CET_COMPILER_CXX_STANDARD_MINIMUM 14)
include(CetInstallDirs)
include(CetCMakeSettings)
include(CetCompilerSettings)

# - Our our modules
#list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/Modules)


#-----------------------------------------------------------------------
# Required Third Party Packages
find_package(cetlib_except REQUIRED)
find_package(cetlib REQUIRED)
find_package(fhiclcpp REQUIRED)
find_package(messagefacility REQUIRED)


set(Boost_NO_BOOST_CMAKE ON)
# - Ensure we can refind Boost and extra components we need
find_package(Boost 1.60.0
  REQUIRED
    date_time
    unit_test_framework
    program_options
    thread
  )
find_package(TBB REQUIRED)

# CLHEP supplies a CMake project config...
find_package(CLHEP 2.3.2.2 REQUIRED)

#-----------------------------------------------------------------------
# Set up paths and modules for all subbuilds
# - Inclusion of ArtDictonary performs a check on ROOT, so muct be included
# after root has been found (probably need to macro/function-ize that check)
#include(ArtDictionary)
#include_directories(${PROJECT_SOURCE_DIR})
#include_directories(${PROJECT_BINARY_DIR})

# source
add_subdirectory(canvas)

# tools
#add_subdirectory(Modules)

