configure_file(${CMAKE_CURRENT_SOURCE_DIR}/GetReleaseVersion.cc.in
  ${CMAKE_CURRENT_BINARY_DIR}/GetReleaseVersion.cc
  @ONLY
  )

add_library(canvas_Version SHARED
  GetReleaseVersion.h
  ${CMAKE_CURRENT_BINARY_DIR}/GetReleaseVersion.cc
  )
set_target_properties(canvas_Version
  PROPERTIES
    VERSION ${canvas_VERSION}
    SOVERSION ${canvas_SOVERSION}
  )

#-----------------------------------------------------------------------
# Install lib and dev
#
install(TARGETS canvas_Version
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
install(FILES GetReleaseVersion.h
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Version
  COMPONENT Development
  )
