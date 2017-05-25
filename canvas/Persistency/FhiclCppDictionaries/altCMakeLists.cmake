include_directories(${fhiclcpp_INCLUDE_DIR})
include_directories(${cetlib_INCLUDEDIR})
include_directories(${Boost_INCLUDE_DIR})

art_dictionary(DICTIONARY_LIBRARIES fhiclcpp::fhiclcpp NO_CHECK_CLASS_VERSION)

