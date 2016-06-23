if (ALT_CMAKE)
include(altCMakeLists.cmake)
else()

INSTALL(FILES
  ArtDictionary.cmake
  DESTINATION ${product}/${version}/Modules
  )

endif()
