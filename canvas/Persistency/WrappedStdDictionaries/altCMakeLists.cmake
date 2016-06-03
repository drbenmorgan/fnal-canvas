include_directories(${cetlib_DIR}/../../../include)
include_directories(${CLHEP_DIR}/../../include)

art_dictionary()

install(TARGETS canvas_Persistency_WrappedStdDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
