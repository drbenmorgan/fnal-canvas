include_directories(${cetlib_INCLUDEDIR})
include_directories(${fhiclcpp_INCLUDEDIR})
include_directories(${CLHEP_INCLUDE_DIR})
include_directories(${Boost_INCLUDE_DIR})

# - Build canvas_Persistency_Common lib

foreach(ART_IPR_BASE_NAME FindOne FindMany)
  UNSET(ART_IPR_BY_PTR)
  SET(ART_IPR_CLASS_NAME ${ART_IPR_BASE_NAME})
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${ART_IPR_BASE_NAME}.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    @ONLY)

  SET(ART_IPR_BY_PTR true)
  SET(ART_IPR_CLASS_NAME "${ART_IPR_BASE_NAME}P")
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${ART_IPR_BASE_NAME}.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    @ONLY)
endforeach()



# Define headers
set(canvas_Persistency_Common_HEADERS
   Assns.h
   BoolCache.h
   CacheStreamers.h
   classes.h
   ConstPtrCache.h
   EDProductGetterFinder.h
   EDProductGetter.h
   EDProduct.h
   ${CMAKE_CURRENT_BINARY_DIR}/FindMany.h
   ${CMAKE_CURRENT_BINARY_DIR}/FindManyP.h
   ${CMAKE_CURRENT_BINARY_DIR}/FindOne.h
   ${CMAKE_CURRENT_BINARY_DIR}/FindOneP.h
   fwd.h
   getElementAddresses.h
   GetProduct.h
   HLTenums.h
   HLTGlobalStatus.h
   HLTPathStatus.h
   Ptr.h
   PtrVectorBase.h
   PtrVector.h
   RefCore.h
   RefCoreStreamer.h
   RNGsnapshot.h
   setPtr.h
   traits.h
   TriggerResults.h
   Wrapper.h
  )

set(canvas_Persistency_Common_DETAIL_HEADERS
   detail/IPRHelper.h
   detail/is_handle.h
   detail/maybeCastObj.h
   detail/setPtrVectorBaseStreamer.h
  )

# Describe library
add_library(canvas_Persistency_Common SHARED
  ${canvas_Persistency_Common_HEADERS}
  ${canvas_Persistency_Common_DETAIL_HEADERS}
   CacheStreamers.cc
   EDProduct.cc
   PtrVectorBase.cc
   RefCore.cc
   RefCoreStreamer.cc
   RNGsnapshot.cc
   traits.cc
   detail/maybeCastObj.cc
   detail/setPtrVectorBaseStreamer.cc
  )

# Describe library include interface
#target_include_directories(canvas_Persistency_Common
#  PUBLIC
#   ${ROOT_INCLUDE_DIRS}
#   ${BOOST_INCLUDE_DIRS}
#   )

# Describe library link interface
IF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
target_link_libraries(canvas_Persistency_Common
  PUBLIC
  canvas_Utilities
  canvas_Persistency_Provenance
  CLHEP::CLHEP
  ${ROOT_Core_LIBRARY}
  ${Boost_THREAD_LIBRARY}
  c++abi
  )
else()
target_link_libraries(canvas_Persistency_Common
  PUBLIC
  canvas_Utilities
  canvas_Persistency_Provenance
  CLHEP::CLHEP
  ${ROOT_Core_LIBRARY}
  ${Boost_THREAD_LIBRARY}
)
endif()

# Set any additional properties
set_target_properties(canvas_Persistency_Common
  PROPERTIES
   VERSION ${canvas_VERSION}
   SOVERSION ${canvas_SOVERSION}
  )

# - Dictify
art_dictionary(DICTIONARY_LIBRARIES canvas_Persistency_Common)

install(TARGETS canvas_Persistency_Common canvas_Persistency_Common_dict
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
install(FILES ${canvas_Persistency_Common_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Persistency/Common
  COMPONENT Development
  )
install(FILES ${canvas_Persistency_Common_DETAIL_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Persistency/Common/detail
  COMPONENT Development
  )

