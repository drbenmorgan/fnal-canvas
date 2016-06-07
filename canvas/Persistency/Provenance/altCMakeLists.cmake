include_directories(${cetlib_INCLUDEDIR})

# - Build canvas_Persistency_Provenance lib
# Define headers
set(canvas_Persistency_Provenance_HEADERS
BranchChildren.h
BranchDescription.h
BranchID.h
BranchIDList.h
BranchKey.h
BranchListIndex.h
BranchMapper.h
BranchType.h
classes.h
DictionaryChecker.h
EventAuxiliary.h
EventID.h
EventSelectionID.h
FileFormatVersion.h
FileIndex.h
HashedTypes.h
Hash.h
History.h
IDNumber.h
ModuleDescription.h
ModuleDescriptionID.h
ParameterSetBlob.h
ParameterSetMap.h
Parentage.h
ParentageID.h
ParentageRegistry.h
PassID.h
ProcessConfiguration.h
ProcessConfigurationID.h
ProcessHistory.h
ProcessHistoryID.h
ProductID.h
ProductList.h
ProductProvenance.h
ProductRegistry.h
ProductStatus.h
ProvenanceFwd.h
ReleaseVersion.h
ResultsAuxiliary.h
rootNames.h
RunAuxiliary.h
RunID.h
SortInvalidFirst.h
SubRunAuxiliary.h
SubRunID.h
Timestamp.h
Transient.h
TransientStreamer.h
TypeLabel.h
TypeTools.h
TypeWithDict.h
  )

# Describe library
add_library(canvas_Persistency_Provenance SHARED
  ${canvas_Persistency_Provenance_HEADERS}
BranchChildren.cc
BranchDescription.cc
BranchID.cc
BranchKey.cc
BranchMapper.cc
BranchType.cc
DictionaryChecker.cc
EventAuxiliary.cc
EventID.cc
FileFormatVersion.cc
FileIndex.cc
Hash.cc
History.cc
ModuleDescription.cc
ParameterSetBlob.cc
Parentage.cc
ProcessConfiguration.cc
ProcessHistory.cc
ProductID.cc
ProductProvenance.cc
ResultsAuxiliary.cc
rootNames.cc
RunAuxiliary.cc
RunID.cc
SubRunAuxiliary.cc
SubRunID.cc
TransientStreamer.cc
TypeTools.cc
TypeWithDict.cc
  )

# Describe library include interface
target_include_directories(canvas_Persistency_Provenance
  PUBLIC
   ${ROOT_INCLUDE_DIRS}
  PRIVATE
   ${BOOST_INCLUDE_DIRS}
   )

# Describe library link interface - all Public for now
target_link_libraries(canvas_Persistency_Provenance
  LINK_PUBLIC
   canvas_Utilities
   MF_MessageLogger
   cetlib::cetlib
  LINK_PRIVATE
   ${BOOST_THREAD_LIBRARY}
  )

# Set any additional properties
set_target_properties(canvas_Persistency_Provenance
  PROPERTIES
   VERSION ${canvas_VERSION}
   SOVERSION ${canvas_SOVERSION}
  )

install(TARGETS canvas_Persistency_Provenance 
  EXPORT CanvasLibraries
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )
install(FILES ${canvas_Persistency_Provenance_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/canvas/Persistency/Provenance
  COMPONENT Development
  )


