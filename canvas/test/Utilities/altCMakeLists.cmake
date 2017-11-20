set(default_canvas_test_libraries
  canvas
  cetlib::cetlib
  messagefacility::MF_MessageLogger
  )

cet_test(Level_t LIBRARIES canvas)

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
  canvas
  )

add_executable(EventIDMatcher_t EventIDMatcher_t.cc)
target_link_libraries(EventIDMatcher_t canvas cetlib::cetlib)

cet_test(EventIDMatcher_test HANDBUILT
  TEST_EXEC EventIDMatcher_t
  TEST_PROPERTIES ENVIRONMENT PATH=$<TARGET_FILE_DIR:EventIDMatcher_t>:$ENV{PATH}
)

