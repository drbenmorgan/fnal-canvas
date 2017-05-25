include_directories(${CLHEP_INCLUDE_DIR})
include_directories(${cetlib_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIR})

# NB: art_dictionary installs for us...
art_dictionary(DICTIONARY_LIBRARIES CLHEP::CLHEP NO_CHECK_CLASS_VERSION)

