art_add_dictionary(DICTIONARY_LIBRARIES ${CLHEP} NO_CHECK_CLASS_VERSION)

install(TARGETS canvas_Persistency_CLHEPDictionaries_dict 
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
