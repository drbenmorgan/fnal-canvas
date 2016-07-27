# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  include(altCMakeLists.cmake)
else()

INSTALL(FILES
  ArtDictionary.cmake
  DESTINATION ${product}/${version}/Modules
  )

endif() # ALT_CMAKE
