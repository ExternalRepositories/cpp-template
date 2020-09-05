if(SANITIZER STREQUAL "Address")
  message(STATUS "Building with AddressSanitizer")
  string(APPEND CMAKE_CXX_FLAGS " -fsanitize=address -fno-omit-frame-pointer")
elseif(SANITIZER STREQUAL "Memory")
  if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    message(
      STATUS
        "Building with UndefinedSanitizer, GCC does not support MemorySanitizer"
    )
  else()
    message(STATUS "Building with MemorySanitizer")
    string(
      APPEND
      CMAKE_CXX_FLAGS
      " -fsanitize=memory -fsanitize-memory-track-origins -fno-omit-frame-pointer -fPIE"
    )
  endif()
elseif(SANITIZER STREQUAL "Thread")
  message(STATUS "Building with ThreadSanitizer")
  string(APPEND CMAKE_CXX_FLAGS " -fsanitize=thread")
elseif(SANITIZER STREQUAL "Undefined")
  message(STATUS "Building with UndefinedSanitizer")
  string(APPEND CMAKE_CXX_FLAGS " -fsanitize=undefined")
else()
  message(STATUS ${SANITIZER})
  message(FATAL_ERROR "The Sanitizer is not supported")
endif()
