if((CMAKE_BUILD_TYPE MATCHES "Debug")
   OR (CMAKE_BUILD_TYPE MATCHES "RelWithDebInfo")
   OR CLANG_TIDY)
  message(STATUS "Enable clang-tidy check")
  set(CMAKE_CXX_CLANG_TIDY clang-tidy -header-filter=.*)
endif()