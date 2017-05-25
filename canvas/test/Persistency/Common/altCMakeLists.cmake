include_directories(${cetlib_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIRS})
art_dictionary(NO_INSTALL)

cet_test(test_ConstAssnIter
  LIBRARIES canvas
  # NB: seg faults on Mac unless linked to dict library (runtime lookup error?) canvas_test_Persistency_Common_dict
  )

cet_test(aggregate_t USE_BOOST_UNIT
  LIBRARIES canvas
  )

cet_test(aggregate_clhep_t USE_BOOST_UNIT
  LIBRARIES
  canvas
  CLHEP::CLHEP
  )

cet_test(aggregate_th1_t USE_BOOST_UNIT
  LIBRARIES
  canvas
  cetlib::cetlib
  ${ROOT_Hist_LIBRARY}
  )
