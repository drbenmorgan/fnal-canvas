include_directories(${cetlib_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIR})
include_directories(${CLHEP_INCLUDE_DIR})

art_dictionary()

install(TARGETS canvas_Persistency_WrappedStdDictionaries_dict
  EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
