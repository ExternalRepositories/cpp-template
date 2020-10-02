include(GNUInstallDirs)

set(PROJECT_CONFIG_IN "${CMAKE_CURRENT_SOURCE_DIR}/cmake/klibConfig.cmake.in")
set(PROJECT_CONFIG_OUT "${CMAKE_CURRENT_BINARY_DIR}/klibConfig.cmake")
set(VERSION_CONFIG_FILE "${CMAKE_CURRENT_BINARY_DIR}/klibConfigVersion.cmake")
set(EXPORT_DEST_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/klib")
set(CONFIG_TARGETS_FILE klibConfigTargets.cmake)

set(CMAKE_SKIP_BUILD_RPATH FALSE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
set(CMAKE_INSTALL_RPATH
    "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR};$\{ORIGIN\}")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

list(FIND CMAKE_PLATFORM_IMPLICIT_LINK_DIRECTORIES
     "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" isSystemDir)
if(${isSystemDir} STREQUAL "-1")
  set(CMAKE_INSTALL_RPATH
      "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR};$\{ORIGIN\}")
endif()

install(TARGETS ${EXECUTABLE} DESTINATION ${CMAKE_INSTALL_BINDIR})
install(TARGETS ${LIBRARY} DESTINATION ${CMAKE_INSTALL_LIBDIR})

install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(
  TARGETS ${LIBRARY}
  EXPORT ${LIBRARY}
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

install(
  EXPORT ${LIBRARY}
  DESTINATION ${EXPORT_DEST_DIR}
  NAMESPACE ${LIBRARY}::
  FILE ${CONFIG_TARGETS_FILE})

include(CMakePackageConfigHelpers)
configure_file(${PROJECT_CONFIG_IN} ${PROJECT_CONFIG_OUT} @ONLY)

write_basic_package_version_file(${VERSION_CONFIG_FILE}
                                 COMPATIBILITY SameMajorVersion)
install(FILES ${PROJECT_CONFIG_OUT} ${VERSION_CONFIG_FILE}
        DESTINATION ${EXPORT_DEST_DIR})

# TODO Write a find module
