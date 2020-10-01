if(KLIB_BUILD_DOCS)
  message(STATUS "Build documentations")

  find_package(Doxygen REQUIRED)

  set(INPUT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
  set(README_DIR ${CMAKE_CURRENT_SOURCE_DIR}/README.md)
  set(OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR})

  configure_file(${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in
                 ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)

  add_custom_target(
    doc
    COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT
      "Generating documentation ${CMAKE_CURRENT_BINARY_DIR}/html/index.html")
endif()
