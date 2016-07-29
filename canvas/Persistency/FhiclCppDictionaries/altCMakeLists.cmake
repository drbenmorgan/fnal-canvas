include_directories(${fhiclcpp_INCLUDE_DIR})
include_directories(${cetlib_INCLUDEDIR})
include_directories(${Boost_INCLUDE_DIR})

art_dictionary(DICTIONARY_LIBRARIES fhiclcpp::fhiclcpp cetlib::cetlib NO_CHECK_CLASS_VERSION)

install(TARGETS
  canvas_Persistency_FhiclCppDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

