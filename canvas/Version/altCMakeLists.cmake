configure_file(${CMAKE_CURRENT_SOURCE_DIR}/GetReleaseVersion.cc.in
  ${CMAKE_CURRENT_BINARY_DIR}/GetReleaseVersion.cc
  @ONLY
  )

install(FILES GetReleaseVersion.h
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Version
  COMPONENT Development
  )
