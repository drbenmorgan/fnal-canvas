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
set_target_properties(canvas_Utilities
  PROPERTIES
    VERSION ${canvas_VERSION}
    SOVERSION ${canvas_SOVERSION}
  )

# No usage requirements for Root dirs, so add them here,
# but due to Root's broken CMake config file, this won't
# work directly.
target_include_directories(canvas_Utilities
  PRIVATE ${ROOT_INCLUDE_DIRS}
  )

include(FindThreads)

target_link_libraries(canvas_Utilities
  LINK_PUBLIC
  MF_MessageLogger
  MF_Utilities
  fhiclcpp::fhiclcpp
  cetlib::cetlib
  Threads::Threads
  ${Boost_FILESYSTEM_LIBRARY}
  ${Boost_REGEX_LIBRARY}
  ${Boost_SYSTEM_LIBRARY}
  ${Boost_THREAD_LIBRARY}
  ${ROOT_Core_LIBRARY}
  ${ROOT_Thread_LIBRARY}
  ${ROOT_Tree_LIBRARY}
  ${ROOT_RIO_LIBRARY}
  ${TBB_LIBRARY_RELEASE}
  ${CMAKE_DL_LIBS}
  )

install(TARGETS canvas_Utilities
  EXPORT CanvasLibraries
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

