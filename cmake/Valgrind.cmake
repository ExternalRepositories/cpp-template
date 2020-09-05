if(VALGRIND)
  message(STATUS "Executing test suite with Valgrind")
  find_program(VALGRIND_PATH valgrind)

  if(NOT VALGRIND_PATH)
    message(FATAL_ERROR "valgrind not found")
  endif()

  add_test(
    NAME "${TEST_PROGRAM_NAME}-valgrind"
    COMMAND
      ${VALGRIND_PATH} --error-exitcode=1 --track-origins=yes
      --gen-suppressions=all --leak-check=full
      ${CMAKE_CURRENT_BINARY_DIR}/${TEST_PROGRAM_NAME})
endif()
