# include once
if(NOT __canvas_check_class_version_loaded)
  set(__canvas_check_class_version_loaded TRUE)
else()
  return()
endif()

# Requirements
include(CMakeParseArguments)

# - Define transparent target to use the checkClassVersion Python prog.
# Use an imported target for checkClassVersion to give transparency
# between art build and client usage.
# This *is* a little messy, but eases the writing of the scripts for
# full portability between the art build and clients.
if(NOT TARGET canvas::checkClassVersion)
  add_executable(canvas::checkClassVersion IMPORTED)
  set_target_properties(canvas::checkClassVersion PROPERTIES IMPORTED_LOCATION
    ${CMAKE_CURRENT_LIST_DIR}/checkClassVersion
    )
endif()

# - Must have Root with Python support available
# We assume that the client has found ROOT for us, so try and use what they have.
if(NOT ${ROOT_FOUND})
  message(FATAL_ERROR "ROOT is not available in this project, you need to have called\nfind_package(ROOT)\nbefore including CheckClassVersion")
else()
  get_filename_component(__ccv_root_bindir "${ROOT_root_CMD}" DIRECTORY)
  execute_process(
    COMMAND "${__ccv_root_bindir}/root-config" --has-python
    RESULT_VARIABLE CCV_ROOT_CONFIG_OK
    OUTPUT_VARIABLE CCV_ENABLED
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )

  if(NOT CCV_ENABLED)
    message(WARNING "The version of root against which we are building currently has not been built "
    "with python support: ClassVersion checking is disabled."
    )
  endif()
endif()

# Append a path to the global lookup path
function(checkclassversion_append_path _path)
  set_property(GLOBAL
    APPEND
    PROPERTY CHECKCLASSVERSION_DYNAMIC_PATH ${_path}
    )
endfunction()


# The macro for defining the version checking - can only be called
# from inside art/build_dictionary because if relies on variables
# set by those functions.
macro(check_class_version)
  cmake_parse_arguments(CCV
    "LIBRARIES;REQUIRED_DICTIONARIES"
    "UPDATE_IN_PLACE"
    ${ARGN}
    )
  if(CCV_LIBRARIES)
    message(FATAL_ERROR "LIBRARIES option not supported at this time: "
      "ensure your library is linked to any necessary libraries not already pulled in by ART.")
  endif()

  if(CCV_UPDATE_IN_PLACE)
    set(CCV_EXTRA_ARGS ${CCV_EXTRA_ARGS} "-G")
  endif()

  if(NOT dictname)
    message(FATAL_ERROR "CHECK_CLASS_VERSION must be called after BUILD_DICTIONARY.")
  endif()

  if(CCV_ENABLED)
    # Add the check to the end of the dictionary building step.
    add_custom_command(OUTPUT ${dictname}_dict_checked
      COMMAND canvas::checkClassVersion ${CCV_EXTRA_ARGS}
      -l ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/lib${dictname}_dict
      -x ${CMAKE_CURRENT_SOURCE_DIR}/classes_def.xml
      -t ${dictname}_dict_checked
      COMMENT "Checking class versions for ROOT dictionary ${dictname}"
      DEPENDS ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${CMAKE_SHARED_LIBRARY_PREFIX}${dictname}_dict${CMAKE_SHARED_LIBRARY_SUFFIX}
      )
    add_custom_target(checkClassVersion_${dictname} ALL
      DEPENDS ${dictname}_dict_checked)
    # All checkClassVersion invocations must wait until after *all*
    # dictionaries have been built.
    add_dependencies(checkClassVersion_${dictname} BuildDictionary_AllDicts)
    if(CCV_REQUIRED_DICTIONARIES)
      add_dependencies(${dictname}_dict ${CCV_REQUIRED_DICTIONARIES})
    endif()
  endif()
endmacro()

