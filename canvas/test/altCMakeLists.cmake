# Test still need CPPunit
find_package(CppUnit REQUIRED)

cet_enable_asserts()

cet_test_env("FHICL_FILE_PATH=.")

# build Persistency libraries
add_subdirectory(Persistency/Common)
add_subdirectory(Persistency/Provenance)
add_subdirectory(Version)
add_subdirectory(Utilities)
add_subdirectory(tbb)

