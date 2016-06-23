# - Build submodules
# NB: Why so many libraries, can we not just have "libCanvas" plus the dictionaries?
add_subdirectory(Version)
add_subdirectory(Utilities)
add_subdirectory(Persistency)

if(BUILD_TESTING)
  add_subdirectory(test)
endif()
