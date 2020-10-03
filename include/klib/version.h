/// \file version.h
/// \brief Contains the declaration of the macro

#pragma once

/// klib major verion
#define KLIB_VER_MAJOR 2
/// klib minor version
#define KLIB_VER_MINOR 3
/// klib patch version
#define KLIB_VER_PATCH 0

/// klib version
#define KLIB_VERSION \
  (KLIB_VER_MAJOR * 10000 + KLIB_VER_MINOR * 100 + KLIB_VER_PATCH)