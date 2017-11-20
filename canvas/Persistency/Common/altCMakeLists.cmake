# - Build generated headers and dictionary

foreach(ART_IPR_BASE_NAME FindOne FindMany)
  unset(ART_IPR_BY_PTR)
  set(ART_IPR_CLASS_NAME ${ART_IPR_BASE_NAME})
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${ART_IPR_BASE_NAME}.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    @ONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Persistency/Common/
    )

  set(ART_IPR_BY_PTR true)
  set(ART_IPR_CLASS_NAME "${ART_IPR_BASE_NAME}P")
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${ART_IPR_BASE_NAME}.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    @ONLY)
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Persistency/Common
    )
endforeach()

