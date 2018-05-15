cet_enable_asserts()

# add_definitions(-DART_NO_MIX_PTRVECTOR)

# Make sure tests have correct environment settings.
include(CetTest)
# If you explicitly include CetTest in a subdirectory, you will need to
# re-initialize the test environment.
cet_test_env("FHICL_FILE_PATH=.")

if(ALT_CMAKE)
  # Find Boost/CppUnit for testing
  find_package(Boost REQUIRED unit_test_framework)
  find_package(CppUnit REQUIRED)

  # Add output path to CETD_LIBRARY_PATH
  cet_test_env("CETD_LIBRARY_PATH=$<TARGET_FILE_DIR:canvas>:$ENV{CETD_LIBRARY_PATH}")
  # Create forwards from UPS style targets/variables to full imported
  # targets
  include_directories(${PROJECT_SOURCE_DIR})
  add_library(cetlib INTERFACE)
  target_link_libraries(cetlib INTERFACE cetlib::cetlib)
  add_library(MF_MessageLogger INTERFACE)
  target_link_libraries(MF_MessageLogger INTERFACE messagefacility::MF_MessageLogger)

  set(CLHEP CLHEP::CLHEP)
  set(CPPUNIT CppUnit::CppUnit)
  set(RT )
  set(TBB TBB::tbb)
endif()

# build Persistency libraries
add_subdirectory(Persistency/Common)
add_subdirectory(Persistency/Provenance)
add_subdirectory(Version)
add_subdirectory(Utilities)
add_subdirectory(tbb)

