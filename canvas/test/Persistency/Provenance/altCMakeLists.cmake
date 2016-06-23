include_directories(${CPPUNIT_INCLUDE_DIR})

set(CMAKE_MODULE_PATH
  ${CMAKE_MODULE_PATH}
  ${CMAKE_CURRENT_SOURCE_DIR}
  )

art_dictionary(NO_INSTALL)

set(standard_libraries
  canvas_Persistency_Provenance
  canvas_Utilities
  canvas_Version
  )

cet_test(EventID_t USE_BOOST_UNIT
  LIBRARIES canvas_Persistency_Provenance
  )

file(GLOB cppunit_files *.cppunit.cc)
foreach(cppunit_source ${cppunit_files})
  get_filename_component(test_name ${cppunit_source} NAME_WE )
  cet_test(${test_name} SOURCES testRunner.cpp ${cppunit_source}
    LIBRARIES ${CPPUNIT_LIBRARY} ${standard_libraries}
    )
endforeach()

foreach(test_source ModuleDescription_t.cpp ProcessConfiguration_t.cpp ProcessHistory_t.cpp)
  get_filename_component(test_name ${test_source} NAME_WE )
  cet_test(${test_name} SOURCES ${test_source} LIBRARIES ${standard_libraries})
endforeach()

cet_test(RootClassMapping_t USE_BOOST_UNIT
  LIBRARIES
  canvas_test_Persistency_Provenance_dict
  ${ROOT_Tree_LIBRARY}
  ${ROOT_RIO_LIBRARY}
  # When ROOT is fixed WILL_FAIL should be removed and the code in ASSNS
  # (and associated ioread rules) should be fixed accordingly.
  TEST_PROPERTIES WILL_FAIL true
  )

cet_test(EventRange_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Provenance
  )

cet_test(RangeSet_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Provenance
  )

cet_test(TypeTools_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Provenance
  canvas_Utilities
  )

cet_test(TypeWithDict_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Provenance
  canvas_Utilities
  )

