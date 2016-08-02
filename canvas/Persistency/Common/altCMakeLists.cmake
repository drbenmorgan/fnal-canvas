# - Build canvas_Persistency_Common lib

foreach(ART_IPR_BASE_NAME FindOne FindMany)
  unset(ART_IPR_BY_PTR)
  set(ART_IPR_CLASS_NAME ${ART_IPR_BASE_NAME})
  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/${ART_IPR_BASE_NAME}.h.in
    ${CMAKE_CURRENT_BINARY_DIR}/${ART_IPR_CLASS_NAME}.h
    @ONLY)

  set(ART_IPR_BY_PTR true)
  set(ART_IPR_CLASS_NAME "${ART_IPR_BASE_NAME}P")
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
   detail/aggregate.h
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
   detail/aggregate.cc
   detail/maybeCastObj.cc
   detail/setPtrVectorBaseStreamer.cc
  )

# Describe library include interface
target_include_directories(canvas_Persistency_Common
  PUBLIC
   ${ROOT_INCLUDE_DIRS}
   ${CLHEP_INCLUDE_DIRS}
   )

# Describe library link interface
target_link_libraries(canvas_Persistency_Common
  PUBLIC
  canvas_Utilities
  canvas_Persistency_Provenance
  cetlib::cetlib
  CLHEP::CLHEP
  ${ROOT_Core_LIBRARY}
  Boost::boost
)

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
  target_link_libraries(canvas_Persistency_Common PRIVATE c++abi)
endif()

# - Dictify
# At present, art_dictionary has no concept of target properties,
# so MUST use include_directories for now - eventually need to use genexs, but that requires fiddling in dict generation
include_directories(AFTER
  ${ROOT_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
  ${CLHEP_INCLUDE_DIRS}
  ${cetlib_INCLUDE_DIRS})
art_dictionary(DICTIONARY_LIBRARIES canvas_Persistency_Common)

install(TARGETS canvas_Persistency_Common canvas_Persistency_Common_dict
  EXPORT ${PROJECT_NAME}Targets
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

