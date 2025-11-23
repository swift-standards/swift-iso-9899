//
//  iso9899_math.h
//  swift-iso-9899
//
//  Platform-agnostic wrapper for ISO/IEC 9899 mathematical functions
//  Provides access to C standard library math functions without Foundation
//

#ifndef ISO9899_MATH_H
#define ISO9899_MATH_H

// Include platform-specific math header
#if defined(__APPLE__)
    #include <math.h>
#elif defined(__linux__)
    #include <math.h>
#elif defined(_WIN32)
    #include <math.h>
#else
    #include <math.h>
#endif

// Power functions (ISO/IEC 9899 Section 7.12.7)
static inline double iso9899_pow(double x, double y) { return pow(x, y); }
static inline float iso9899_powf(float x, float y) { return powf(x, y); }
static inline double iso9899_sqrt(double x) { return sqrt(x); }
static inline float iso9899_sqrtf(float x) { return sqrtf(x); }

// Trigonometric functions (ISO/IEC 9899 Section 7.12.4)
static inline double iso9899_sin(double x) { return sin(x); }
static inline float iso9899_sinf(float x) { return sinf(x); }
static inline double iso9899_cos(double x) { return cos(x); }
static inline float iso9899_cosf(float x) { return cosf(x); }
static inline double iso9899_tan(double x) { return tan(x); }
static inline float iso9899_tanf(float x) { return tanf(x); }

// Inverse trigonometric functions (ISO/IEC 9899 Section 7.12.4)
static inline double iso9899_asin(double x) { return asin(x); }
static inline float iso9899_asinf(float x) { return asinf(x); }
static inline double iso9899_acos(double x) { return acos(x); }
static inline float iso9899_acosf(float x) { return acosf(x); }
static inline double iso9899_atan(double x) { return atan(x); }
static inline float iso9899_atanf(float x) { return atanf(x); }
static inline double iso9899_atan2(double y, double x) { return atan2(y, x); }
static inline float iso9899_atan2f(float y, float x) { return atan2f(y, x); }

// Exponential and logarithmic functions (ISO/IEC 9899 Section 7.12.6)
static inline double iso9899_exp(double x) { return exp(x); }
static inline float iso9899_expf(float x) { return expf(x); }
static inline double iso9899_log(double x) { return log(x); }
static inline float iso9899_logf(float x) { return logf(x); }
static inline double iso9899_log10(double x) { return log10(x); }
static inline float iso9899_log10f(float x) { return log10f(x); }

// Rounding functions (ISO/IEC 9899 Section 7.12.9)
// These implement IEEE 754 roundToIntegral operations per Annex F
static inline double iso9899_ceil(double x) { return ceil(x); }
static inline float iso9899_ceilf(float x) { return ceilf(x); }
static inline double iso9899_floor(double x) { return floor(x); }
static inline float iso9899_floorf(float x) { return floorf(x); }
static inline double iso9899_round(double x) { return round(x); }
static inline float iso9899_roundf(float x) { return roundf(x); }
static inline double iso9899_trunc(double x) { return trunc(x); }
static inline float iso9899_truncf(float x) { return truncf(x); }

#endif /* ISO9899_MATH_H */
