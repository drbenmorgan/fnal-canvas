# - Canvas Utilities library

set(canvas_UTILITIES_SOURCES
  DebugMacros.cc
  DebugMacros.h
  Exception.cc
  Exception.h
  FriendlyName.cc
  FriendlyName.h
  GetCanvasReleaseVersion.h
  GetPassID.h
  InputTag.cc
  InputTag.h
  TestHelper.cc
  TestHelper.h
  TypeID.cc
  TypeID.h
  WrappedClassName.cc
  WrappedClassName.h
  ensurePointer.h
  fwd.h
  uniform_type_name.cc
  uniform_type_name.h
  )

add_library(canvas_Utilities SHARED ${canvas_UTILITIES_SOURCES})

# No usage requirements for Root dirs, so add them here,
# but due to Root's broken CMake config file, this won't
# work directly.
target_include_directories(canvas_Utilities
  PRIVATE ${ROOT_INCLUDE_DIRS}
  )

#include(FindThreads)

target_link_libraries(canvas_Utilities
  PUBLIC
  fhiclcpp::fhiclcpp
  cetlib::cetlib
  ${ROOT_Core_LIBRARY}
  ${TBB_LIBRARY_RELEASE}
  )

install(TARGETS canvas_Utilities
  EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}/Utilities
  COMPONENT Development
  FILES_MATCHING PATTERN "*.h" PATTERN "*.hpp" PATTERN "*.icc"
  PATTERN "classes.h" EXCLUDE
  )

