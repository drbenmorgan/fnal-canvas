# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  include(altCMakeLists.cmake)
else()

install_headers(SUBDIRS detail)
install_source(SUBDIRS detail)

endif() # ALT_CMAKE
