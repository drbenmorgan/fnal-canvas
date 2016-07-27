# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  include(altCMakeLists.cmake)
else()

art_dictionary(DICTIONARY_LIBRARIES fhiclcpp NO_CHECK_CLASS_VERSION)

install_source()

endif() # ALT_CMAKE
