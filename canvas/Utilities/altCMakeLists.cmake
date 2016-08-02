# - Canvas Utilities library

set(canvas_UTILITIES_HEADERS
   DebugMacros.h
   ensurePointer.h
   Exception.h
   FriendlyName.h
   fwd.h
   GetCanvasReleaseVersion.h
   GetPassID.h
   InputTag.h
   TestHelper.h
   TypeID.h
   uniform_type_name.h
   WrappedClassName.h
  )

set(canvas_UTILITIES_DETAIL_HEADERS
   detail/metaprogramming.h
  )

set(canvas_UTILITIES_SOURCES
   DebugMacros.cc
   Exception.cc
   FriendlyName.cc
   InputTag.cc
   TestHelper.cc
   TypeID.cc
   uniform_type_name.cc
   WrappedClassName.cc
  )


add_library(canvas_Utilities
  SHARED
  ${canvas_UTILITIES_HEADERS}
  ${canvas_UTILITIES_DETAIL_HEADERS}
  ${canvas_UTILITIES_SOURCES}
  )

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
install(FILES ${canvas_UTILITIES_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Utilities
  COMPONENT Development
  )
install(FILES ${canvas_UTILITIES_DETAIL_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Utilities/detail
  COMPONENT Development
  )

