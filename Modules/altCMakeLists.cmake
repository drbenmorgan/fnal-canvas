# Install modules/programs required by clients
# NB: FindTBB installed temporarily - these should be
# promoted to cetbuildtools2 or similar

install(FILES
  ArtDictionary.cmake
  BuildDictionary.cmake
  CheckClassVersion.cmake
  checkClassVersion
  FindTBB.cmake
  DESTINATION ${CMAKE_INSTALL_CMAKEDIR}/${PROJECT_NAME}
  )

