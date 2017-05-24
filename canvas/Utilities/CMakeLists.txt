# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  include(altCMakeLists.cmake)
else()

art_dictionary(DICTIONARY_LIBRARIES canvas)

install_headers(SUBDIRS detail)
install_source(SUBDIRS detail)

endif() # ALT_CMAKE
