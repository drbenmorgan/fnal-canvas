# Install script for directory: /tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64/cmake/art-" TYPE FILE MESSAGE_LAZY FILES
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/ArtCPack.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/ArtDictionary.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/ArtMake.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/BuildDictionary.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/BuildPlugins.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CetParseArgs.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CetRegexEscape.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CetRootCint.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CetTest.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/RunAndCompare.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/filter-output"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/cet_test_functions.sh"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CheckClassVersion.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/FindCppUnit.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/FindSQLite3.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/FindTBB.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/ArtDictionary.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/CheckClassVersion.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/artInternalTools.cmake"
    "/tmp/gartung/spack-stage/spack-stage-o1C2_6/fnal-canvas/Modules/artTools.cmake"
    )
endif()

