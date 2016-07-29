#
# Front end inclusion to ensure genrefelx finds headers. Awaits support for
# genexs in art/build_dictionary
include_directories(${cetlib_INCLUDE_DIRS})
include_directories(${ROOT_INCLUDE_DIRS})
art_dictionary(NO_DEFAULT_LIBRARIES DICTIONARY_LIBRARIES cetlib::cetlib ${ROOT_Core_LIBRARY} NO_INSTALL)

set(default_canvas_test_libraries
  canvas_Utilities
  canvas_test_Utilities_dict
  cetlib::cetlib
  ${ROOT_Core_LIBRARY}
  )

cet_test(InputTag_t USE_BOOST_UNIT
  LIBRARIES ${default_canvas_test_libraries}
  )

cet_test(ParameterSet_get_artInputTag_t
  LIBRARIES ${default_canvas_test_libraries}
  TEST_ARGS "dummy"
  REF "${CMAKE_CURRENT_SOURCE_DIR}/ParameterSet_get_artInputTag_t-ref.txt"
  )

cet_test(FriendlyName_t USE_BOOST_UNIT
  LIBRARIES ${default_canvas_test_libraries}
  )

cet_test(TypeID_t USE_BOOST_UNIT
  LIBRARIES ${default_canvas_test_libraries}
  )

cet_test(ensurePointer_t USE_BOOST_UNIT
  LIBRARIES ${default_canvas_test_libraries}
  )

cet_test(uniform_type_name_test USE_BOOST_UNIT
  LIBRARIES
  canvas_Utilities
  )

add_executable(TypeNameBranchName_t TypeNameBranchName_t.h TypeNameBranchName_t.cc)
target_link_libraries(TypeNameBranchName_t
  canvas_Utilities
  cetlib::cetlib
)

set(tnum 1)
foreach(types_file
    art_test_types.txt
    microboone_MC6.txt
    mu2e.txt
    lariat_r006037_sr0080.typetester.txt
    lbne_r001161_sr01_20150526T220054.art_typetester.txt
    )
  if (tnum LESS 10)
    set(tnum_text "0${tnum}")
  else()
    set(tnum_text "${tnum}")
  endif()
  cet_test(TypeNameBranchName_test_${tnum_text} HANDBUILT
    TEST_EXEC TypeNameBranchName_t
    TEST_ARGS ${CMAKE_CURRENT_SOURCE_DIR}/TypeNameBranchName_t/${types_file}
    TEST_PROPERTIES ENVIRONMENT PATH=$<TARGET_FILE_DIR:TypeNameBranchName_t>:$ENV{PATH}
    )
  math(EXPR tnum "${tnum} + 1")
endforeach()

