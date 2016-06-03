include_directories(${CLHEP_DIR}/../../../include)
include_directories(${cetlib_DIR}/../../../include)

art_dictionary(DICTIONARY_LIBRARIES ${CLHEP_DIR}/../libCLHEP.so NO_CHECK_CLASS_VERSION)

install(TARGETS canvas_Persistency_CLHEPDictionaries_dict 
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
