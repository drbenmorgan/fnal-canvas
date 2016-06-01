if (ALT_CMAKE)
include(altCMakeLists.cmake)
else()

art_dictionary(NO_DEFAULT_LIBRARIES NO_CHECK_CLASS_VERSION)

install_source()

endif()
