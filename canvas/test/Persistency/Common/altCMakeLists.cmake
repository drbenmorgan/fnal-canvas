cet_test(aggregate_t USE_BOOST_UNIT
  LIBRARIES canvas_Persistency_Common
  )

cet_test(aggregate_clhep_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Common
  #CLHEP::CLHEP
  )

cet_test(aggregate_th1_t USE_BOOST_UNIT
  LIBRARIES
  canvas_Persistency_Common
  cetlib::cetlib
  ${ROOT_Hist_LIBRARY}
  )
