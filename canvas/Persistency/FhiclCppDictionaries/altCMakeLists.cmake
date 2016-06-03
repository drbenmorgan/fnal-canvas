include_directories(${fhiclcpp_DIR}/include)

art_dictionary(DICTIONARY_LIBRARIES ${fhiclcpp_DIR}/lib64/libfhiclcpp.so NO_CHECK_CLASS_VERSION)

install(TARGETS
  canvas_Persistency_FhiclCppDictionaries_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

