include_directories(${cetlib_INCLUDEDIR})
include_directories(${CLHEP_INCLUDE_DIR})

art_dictionary()

install(TARGETS canvas_Persistency_WrappedStdDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
