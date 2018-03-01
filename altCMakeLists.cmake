# - Canvas top level build
# Project setup
cmake_minimum_required(VERSION 3.3.0)
project(canvas VERSION 3.2.1)

# - Cetbuildtools, version2
find_package(cetbuildtools2 0.4.0 REQUIRED)
list(INSERT CMAKE_MODULE_PATH 0 ${cetbuildtools2_MODULE_PATH})
set(CET_COMPILER_CXX_STANDARD_MINIMUM 14)
include(CetInstallDirs)
include(CetCMakeSettings)
include(CetCompilerSettings)

#-----------------------------------------------------------------------
# Required Third Party Packages
find_package(cetlib_except REQUIRED)
find_package(cetlib REQUIRED)
find_package(fhiclcpp REQUIRED)
find_package(messagefacility REQUIRED)

# Use only boost header functionality here.
# Defer find of unit_test to tests
set(Boost_NO_BOOST_CMAKE ON)
find_package(Boost 1.60.0 REQUIRED)

find_package(CLHEP 2.3.2.2 REQUIRED)

# Clang/libc++ need ROOT to workaround ABI checking issues
# Certainly the case on AppleClang, "C2" qualifier also
# assumes libc++ on all platforms(?), so compiler check
# only *should* be sufficient for now.
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  find_package(ROOT 6.12.4 REQUIRED Core)
  set(canvas_NEED_ROOT_INTROSPECTION ON)
endif()

find_package(Threads REQUIRED)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)

find_package(TBB REQUIRED)

# We need range-v3. Range v3 >= 0.3.5 supplies a config file,
# but needs a closer look.
# Then we need the local module
list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_CURRENT_LIST_DIR}")
find_package(Range-v3 REQUIRED NO_CONFIG)
list(REMOVE_AT CMAKE_MODULE_PATH 0)
install(FILES FindRange-v3.cmake DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}/")

# source
add_subdirectory(canvas)

# TODO
#add_subdirectory(tools)
#add_subdirectory(ups)
#include(UseCPack)

