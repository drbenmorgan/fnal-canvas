include_directories(${cetlib_INCLUDE_DIR})
include_directories(${CLHEP_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIR})

art_dictionary(DICTIONARY_LIBRARIES cetlib::cetlib)

install(TARGETS canvas_Persistency_CetlibDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

