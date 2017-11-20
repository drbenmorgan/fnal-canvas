# Build sublibs
# NB: now build one lib, so recursion used to configure files and
# build the dictionaries
add_subdirectory(Version)
#add_subdirectory(Utilities)
add_subdirectory(Persistency)

# Build single top level canvas library.
# NB: Maybe better handled with via recursion, target_add_sources
# and/or object libs.
add_library(canvas SHARED
  Persistency/Common/Assns.h
  Persistency/Common/AssnsBase.h
  Persistency/Common/AssnsIter.h
  Persistency/Common/BoolCache.h
  Persistency/Common/ConstPtrCache.h
  Persistency/Common/EDProduct.cc
  Persistency/Common/EDProduct.h
  Persistency/Common/EDProductGetter.h
  Persistency/Common/EDProductGetterFinder.h
  Persistency/Common/GetProduct.h
  Persistency/Common/HLTGlobalStatus.h
  Persistency/Common/HLTPathStatus.h
  Persistency/Common/HLTenums.h
  Persistency/Common/Ptr.h
  Persistency/Common/PtrVector.h
  Persistency/Common/PtrVectorBase.cc
  Persistency/Common/PtrVectorBase.h
  Persistency/Common/RNGsnapshot.cc
  Persistency/Common/RNGsnapshot.h
  Persistency/Common/RefCore.cc
  Persistency/Common/RefCore.h
  Persistency/Common/TriggerResults.h
  Persistency/Common/Wrapper.h
  Persistency/Common/fwd.h
  Persistency/Common/getElementAddresses.h
  Persistency/Common/setPtr.h
  Persistency/Common/traits.cc
  Persistency/Common/traits.h
  Persistency/Common/detail/IPRHelper.h
  Persistency/Common/detail/aggregate.cc
  Persistency/Common/detail/aggregate.h
  Persistency/Common/detail/is_handle.h
  Persistency/Common/detail/maybeCastObj.cc
  Persistency/Common/detail/maybeCastObj.h
  Persistency/Common/detail/throwPartnerException.cc
  Persistency/Common/detail/throwPartnerException.h
  Persistency/Provenance/BranchChildren.cc
  Persistency/Provenance/BranchChildren.h
  Persistency/Provenance/BranchDescription.cc
  Persistency/Provenance/BranchDescription.h
  Persistency/Provenance/BranchID.cc
  Persistency/Provenance/BranchID.h
  Persistency/Provenance/BranchKey.cc
  Persistency/Provenance/BranchKey.h
  Persistency/Provenance/BranchListIndex.h
  Persistency/Provenance/BranchMapper.cc
  Persistency/Provenance/BranchMapper.h
  Persistency/Provenance/BranchType.cc
  Persistency/Provenance/BranchType.h
  Persistency/Provenance/EventAuxiliary.cc
  Persistency/Provenance/EventAuxiliary.h
  Persistency/Provenance/EventID.cc
  Persistency/Provenance/EventID.h
  Persistency/Provenance/EventRange.cc
  Persistency/Provenance/EventRange.h
  Persistency/Provenance/EventSelectionID.h
  Persistency/Provenance/FileFormatVersion.cc
  Persistency/Provenance/FileFormatVersion.h
  Persistency/Provenance/FileIndex.cc
  Persistency/Provenance/FileIndex.h
  Persistency/Provenance/Hash.cc
  Persistency/Provenance/Hash.h
  Persistency/Provenance/HashedTypes.h
  Persistency/Provenance/History.cc
  Persistency/Provenance/History.h
  Persistency/Provenance/IDNumber.h
  Persistency/Provenance/ModuleDescription.cc
  Persistency/Provenance/ModuleDescription.h
  Persistency/Provenance/ModuleDescriptionID.h
  Persistency/Provenance/ParameterSetBlob.cc
  Persistency/Provenance/ParameterSetBlob.h
  Persistency/Provenance/ParameterSetMap.h
  Persistency/Provenance/Parentage.cc
  Persistency/Provenance/Parentage.h
  Persistency/Provenance/ParentageID.h
  Persistency/Provenance/ParentageRegistry.h
  Persistency/Provenance/ProcessConfiguration.cc
  Persistency/Provenance/ProcessConfiguration.h
  Persistency/Provenance/ProcessConfigurationID.h
  Persistency/Provenance/ProcessHistory.cc
  Persistency/Provenance/ProcessHistory.h
  Persistency/Provenance/ProcessHistoryID.h
  Persistency/Provenance/ProductID.cc
  Persistency/Provenance/ProductID.h
  Persistency/Provenance/ProductList.h
  Persistency/Provenance/ProductProvenance.cc
  Persistency/Provenance/ProductProvenance.h
  Persistency/Provenance/ProductRegistry.h
  Persistency/Provenance/ProductStatus.h
  Persistency/Provenance/ProductTables.cc
  Persistency/Provenance/ProductTables.h
  Persistency/Provenance/ProductToken.h
  Persistency/Provenance/ProvenanceFwd.h
  Persistency/Provenance/RangeSet.cc
  Persistency/Provenance/RangeSet.h
  Persistency/Provenance/ReleaseVersion.h
  Persistency/Provenance/ResultsAuxiliary.cc
  Persistency/Provenance/ResultsAuxiliary.h
  Persistency/Provenance/RunAuxiliary.cc
  Persistency/Provenance/RunAuxiliary.h
  Persistency/Provenance/RunID.cc
  Persistency/Provenance/RunID.h
  Persistency/Provenance/SortInvalidFirst.h
  Persistency/Provenance/SubRunAuxiliary.cc
  Persistency/Provenance/SubRunAuxiliary.h
  Persistency/Provenance/SubRunID.cc
  Persistency/Provenance/SubRunID.h
  Persistency/Provenance/Timestamp.h
  Persistency/Provenance/Transient.h
  Persistency/Provenance/TypeLabel.cc
  Persistency/Provenance/TypeLabel.h
  Persistency/Provenance/canonicalProductName.cc
  Persistency/Provenance/canonicalProductName.h
  Persistency/Provenance/rootNames.cc
  Persistency/Provenance/rootNames.h
  Persistency/Provenance/thread_safe_registry_via_id.h
  Persistency/Provenance/type_aliases.h
  Persistency/Provenance/Compatibility/BranchIDList.h
  Persistency/Provenance/Compatibility/type_aliases.h
  Persistency/Provenance/detail/createProductLookups.cc
  Persistency/Provenance/detail/createProductLookups.h
  Persistency/Provenance/detail/createViewLookups.cc
  Persistency/Provenance/detail/createViewLookups.h
  Persistency/Common/detail/IPRHelper.h
  Persistency/Common/detail/aggregate.cc
  Persistency/Common/detail/aggregate.h
  Persistency/Common/detail/is_handle.h
  Persistency/Common/detail/maybeCastObj.cc
  Persistency/Common/detail/maybeCastObj.h
  Persistency/Common/detail/throwPartnerException.cc
  Persistency/Common/detail/throwPartnerException.h
  Utilities/DebugMacros.cc
  Utilities/DebugMacros.h
  Utilities/EventIDMatcher.cc
  Utilities/EventIDMatcher.h
  Utilities/Exception.cc
  Utilities/Exception.h
  Utilities/FriendlyName.cc
  Utilities/FriendlyName.h
  Utilities/GetCanvasReleaseVersion.h
  Utilities/InputTag.cc
  Utilities/InputTag.h
  Utilities/Level.h
  Utilities/TypeID.cc
  Utilities/TypeID.h
  Utilities/WrappedClassName.cc
  Utilities/WrappedClassName.h
  Utilities/WrappedTypeID.h
  Utilities/ensurePointer.h
  Utilities/fwd.h
  Utilities/uniform_type_name.cc
  Utilities/uniform_type_name.h
  Version/GetReleaseVersion.h
  ${CMAKE_CURRENT_BINARY_DIR}/Version/GetReleaseVersion.cc
  )

# NB: Neither set is complete yet because some deps like TBB
# are pulled in via transitivitiy. Needs further review!
target_include_directories(canvas PUBLIC
  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  )
target_link_libraries(canvas PUBLIC
  cetlib::cetlib
  fhiclcpp::fhiclcpp
  messagefacility::MF_MessageLogger
  TBB::tbb
  CLHEP::CLHEP
  )

install(TARGETS canvas
  EXPORT ${PROJECT_NAME}Targets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  )
install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/"
  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}"
  FILES_MATCHING PATTERN "*.h" PATTERN "*.icc"
  PATTERN "test" EXCLUDE
  )


#-----------------------------------------------------------------------
# Testing, if required
if(BUILD_TESTING)
 add_subdirectory(test)
endif()

# Support files
#-----------------------------------------------------------------------
# Create exports file(s)
include(CMakePackageConfigHelpers)

# - Common to both trees
write_basic_package_version_file(
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  COMPATIBILITY SameMajorVersion
  )

# - Build tree (EXPORT only for now, config file needs some thought,
#   dependent on the use of multiconfig)
export(
  EXPORT ${PROJECT_NAME}Targets
  NAMESPACE ${PROJECT_NAME}::
  FILE "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Targets.cmake"
  )

# - Install tree
configure_package_config_file("${PROJECT_SOURCE_DIR}/${PROJECT_NAME}Config.cmake.in"
  "${PROJECT_BINARY_DIR}/InstallCMakeFiles/${PROJECT_NAME}Config.cmake"
  INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
  PATH_VARS CMAKE_INSTALL_INCLUDEDIR
  )

install(
  FILES
    "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    "${PROJECT_BINARY_DIR}/InstallCMakeFiles/${PROJECT_NAME}Config.cmake"
  DESTINATION
    "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
    )

install(
  EXPORT ${PROJECT_NAME}Targets
  NAMESPACE ${PROJECT_NAME}::
  DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}"
  )

