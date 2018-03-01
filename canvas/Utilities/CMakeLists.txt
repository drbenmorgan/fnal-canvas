# - When user supplies "-DALT_CMAKE" use the non-CET/UPS system
if(ALT_CMAKE)
  return()
else()

install_headers(SUBDIRS detail)
install_source(SUBDIRS detail)

