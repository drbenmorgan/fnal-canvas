include_directories(${cetlib_DIR}/../../../include)

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
   FindMany.h
   FindManyP.h
   FindOne.h
   FindOneP.h
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
   detail/aggregate.h
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
   detail/aggregate.cc
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
target_link_libraries(canvas_Persistency_Common
  PUBLIC
  canvas_Utilities
  canvas_Persistency_Provenance
  ${ROOT_Core_LIBRARY}
  ${Boost_THREAD_LIBRARY}
  )

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

