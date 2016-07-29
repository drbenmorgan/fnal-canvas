# - Canvas top level build
# Project setup
cmake_minimum_required(VERSION 3.3.0)
project(canvas VERSION 1.4.2)

# - Cetbuildtools, version2
find_package(cetbuildtools2 0.1.0 REQUIRED)
list(INSERT CMAKE_MODULE_PATH 0 ${cetbuildtools2_MODULE_PATH})
include(CetInstallDirs)
include(CetCMakeSettings)
include(CetCompilerSettings)
include(CetTest)

# C++ Standard Config
set(CMAKE_CXX_EXTENSIONS OFF)
# Canvas lib builds don't use compile features yet.
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(canvas_COMPILE_FEATURES
  cxx_auto_type
  cxx_generic_lambdas
  )

# - Our our modules
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_LIST_DIR}/Modules)

#-----------------------------------------------------------------------
# Required Third Party Packages
set(Boost_NO_BOOST_CMAKE ON)
# - Ensure we can refind Boost and extra components we need
find_package(Boost 1.60.0
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
find_package(ROOT 6.06.04 REQUIRED)
# - Must have Python support - it doesn't work as a COMPONENT
# argument to find_package because Root's component lookup only
# works for libraries.
if(NOT ROOT_python_FOUND)
  message(FATAL_ERROR "canvas requires ROOT with Python support")
endif()

find_package(cetlib 1.17.4 REQUIRED)
find_package(fhiclcpp 3.18.4 REQUIRED)
find_package(messagefacility 1.16.28 REQUIRED)
find_package(TBB 4.4.3 REQUIRED)

#-----------------------------------------------------------------------
# Set up paths and modules for all subbuilds
# - Inclusion of ArtDictonary performs a check on ROOT, so muct be included
# after root has been found (probably need to macro/function-ize that check)
include(ArtDictionary)
include_directories(${PROJECT_SOURCE_DIR})
include_directories(${PROJECT_BINARY_DIR})

# source
add_subdirectory(canvas)

# tools
add_subdirectory(Modules)

