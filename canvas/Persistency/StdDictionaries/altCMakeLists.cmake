include_directories(${cetlib_INCLUDEDIR})
include_directories(${Boost_INCLUDE_DIR})

art_dictionary(DICTIONARY_LIBRARIES cetlib::cetlib NO_CHECK_CLASS_VERSION)

install(TARGETS canvas_Persistency_StdDictionaries_dict
  EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )


