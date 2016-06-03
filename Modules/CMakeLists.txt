if (ALT_CMAKE)
include(CMakeLists.cmake)
else()

INSTALL(FILES
  ArtDictionary.cmake
  DESTINATION ${product}/${version}/Modules
  )

endif()
