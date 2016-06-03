include_directories(${cetlib_DIR}/../../../include)

art_dictionary(DICTIONARY_LIBRARIES ${cetlib_DIR}/../libcetlib.so)

install(TARGETS canvas_Persistency_CetlibDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

