include_directories(${fhiclcpp_DIR}/../../../include)
include_directories(${cetlib_DIR}/../../../include)

art_dictionary(DICTIONARY_LIBRARIES ${fhiclcpp_DIR}/../../libfhiclcpp.so ${cetlib_DIR}/../../libcetlib.so NO_CHECK_CLASS_VERSION)

install(TARGETS
  canvas_Persistency_FhiclCppDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

