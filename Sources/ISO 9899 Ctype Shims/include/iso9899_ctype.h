#ifndef ISO9899_CTYPE_H
#define ISO9899_CTYPE_H

#include <ctype.h>

static inline int iso9899_isalnum(int c) { return isalnum(c); }
static inline int iso9899_isalpha(int c) { return isalpha(c); }
static inline int iso9899_isblank(int c) { return isblank(c); }
static inline int iso9899_iscntrl(int c) { return iscntrl(c); }
static inline int iso9899_isdigit(int c) { return isdigit(c); }
static inline int iso9899_isgraph(int c) { return isgraph(c); }
static inline int iso9899_islower(int c) { return islower(c); }
static inline int iso9899_isprint(int c) { return isprint(c); }
static inline int iso9899_ispunct(int c) { return ispunct(c); }
static inline int iso9899_isspace(int c) { return isspace(c); }
static inline int iso9899_isupper(int c) { return isupper(c); }
static inline int iso9899_isxdigit(int c) { return isxdigit(c); }

static inline int iso9899_tolower(int c) { return tolower(c); }
static inline int iso9899_toupper(int c) { return toupper(c); }

#endif
