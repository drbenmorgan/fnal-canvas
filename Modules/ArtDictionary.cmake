INCLUDE(BuildDictionary)
INCLUDE(CetParseArgs)
INCLUDE(CheckClassVersion)

MACRO(art_dictionary)
  CET_PARSE_ARGS(ART_DICT
    "LIBRARIES"
    "UPDATE_IN_PLACE"
    ${ARGN}
    )
  if (qualifier STREQUAL "e1")
    SET(ART_DICT_EXTRA_ARGS COMPILE_FLAGS -std=c++98)
  endif()
  build_dictionary(${ART_DICT_DEFAULT_ARGS} ${ART_DICT_EXTRA_ARGS})
  IF(ART_DICT_LIBRARIES)
    SET(ART_DICT_CCV_ARGS "LIBRARIES" ${ART_DICT_LIBRARIES})
  ENDIF()
  SET(ART_DICT_CCV_ARGS ${ART_DICT_CCV_ARGS} "UPDATE_IN_PLACE" ${ART_DICT_UPDATE_IN_PLACE})
  #message(STATUS "Calling check_class_version with args ${ART_DICT_ARGS}")
  check_class_version(${ART_DICT_LIBRARIES} UPDATE_IN_PLACE ${ART_DICT_CCV_ARGS})
ENDMACRO()
