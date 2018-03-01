# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  return()
endif()

install_headers(SUBDIRS Compatibility detail)
install_source(SUBDIRS detail)

