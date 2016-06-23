if (ALT_CMAKE)
include(altCMakeLists.cmake)
else()

art_dictionary(DICTIONARY_LIBRARIES ${CLHEP} NO_CHECK_CLASS_VERSION)

install_source()

endif()
