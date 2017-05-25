include_directories(${cetlib_INCLUDE_DIR})
include_directories(${CLHEP_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIR})

art_dictionary(DICTIONARY_LIBRARIES cetlib::cetlib)

