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

// Classification functions (ISO/IEC 9899 Section 7.12.3)
// Note: These wrap C macros as functions for Swift interoperability
static inline int iso9899_fpclassify_d(double x) { return fpclassify(x); }
static inline int iso9899_fpclassify_f(float x) { return fpclassify(x); }
static inline int iso9899_isfinite_d(double x) { return isfinite(x); }
static inline int iso9899_isfinite_f(float x) { return isfinite(x); }
static inline int iso9899_isinf_d(double x) { return isinf(x); }
static inline int iso9899_isinf_f(float x) { return isinf(x); }
static inline int iso9899_isnan_d(double x) { return isnan(x); }
static inline int iso9899_isnan_f(float x) { return isnan(x); }
static inline int iso9899_isnormal_d(double x) { return isnormal(x); }
static inline int iso9899_isnormal_f(float x) { return isnormal(x); }
static inline int iso9899_signbit_d(double x) { return signbit(x); }
static inline int iso9899_signbit_f(float x) { return signbit(x); }

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
static inline double iso9899_exp2(double x) { return exp2(x); }
static inline float iso9899_exp2f(float x) { return exp2f(x); }
static inline double iso9899_log(double x) { return log(x); }
static inline float iso9899_logf(float x) { return logf(x); }
static inline double iso9899_log2(double x) { return log2(x); }
static inline float iso9899_log2f(float x) { return log2f(x); }
static inline double iso9899_log10(double x) { return log10(x); }
static inline float iso9899_log10f(float x) { return log10f(x); }

// Hyperbolic functions (ISO/IEC 9899 Section 7.12.5)
static inline double iso9899_sinh(double x) { return sinh(x); }
static inline float iso9899_sinhf(float x) { return sinhf(x); }
static inline double iso9899_cosh(double x) { return cosh(x); }
static inline float iso9899_coshf(float x) { return coshf(x); }
static inline double iso9899_tanh(double x) { return tanh(x); }
static inline float iso9899_tanhf(float x) { return tanhf(x); }
static inline double iso9899_asinh(double x) { return asinh(x); }
static inline float iso9899_asinhf(float x) { return asinhf(x); }
static inline double iso9899_acosh(double x) { return acosh(x); }
static inline float iso9899_acoshf(float x) { return acoshf(x); }
static inline double iso9899_atanh(double x) { return atanh(x); }
static inline float iso9899_atanhf(float x) { return atanhf(x); }

// Additional exponential and logarithmic functions (ISO/IEC 9899 Section 7.12.6)
static inline double iso9899_expm1(double x) { return expm1(x); }
static inline float iso9899_expm1f(float x) { return expm1f(x); }
static inline double iso9899_log1p(double x) { return log1p(x); }
static inline float iso9899_log1pf(float x) { return log1pf(x); }

// Power and absolute-value functions (ISO/IEC 9899 Section 7.12.7)
// Additional functions beyond pow() and sqrt()
static inline double iso9899_fabs(double x) { return fabs(x); }
static inline float iso9899_fabsf(float x) { return fabsf(x); }
static inline double iso9899_hypot(double x, double y) { return hypot(x, y); }
static inline float iso9899_hypotf(float x, float y) { return hypotf(x, y); }
static inline double iso9899_cbrt(double x) { return cbrt(x); }
static inline float iso9899_cbrtf(float x) { return cbrtf(x); }

// Error and gamma functions (ISO/IEC 9899 Section 7.12.8)
static inline double iso9899_erf(double x) { return erf(x); }
static inline float iso9899_erff(float x) { return erff(x); }
static inline double iso9899_erfc(double x) { return erfc(x); }
static inline float iso9899_erfcf(float x) { return erfcf(x); }
static inline double iso9899_tgamma(double x) { return tgamma(x); }
static inline float iso9899_tgammaf(float x) { return tgammaf(x); }
static inline double iso9899_lgamma(double x) { return lgamma(x); }
static inline float iso9899_lgammaf(float x) { return lgammaf(x); }

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

// Nearest integer functions (ISO/IEC 9899 Section 7.12.9)
static inline double iso9899_rint(double x) { return rint(x); }
static inline float iso9899_rintf(float x) { return rintf(x); }
static inline double iso9899_nearbyint(double x) { return nearbyint(x); }
static inline float iso9899_nearbyintf(float x) { return nearbyintf(x); }
static inline long iso9899_lrint(double x) { return lrint(x); }
static inline long iso9899_lrintf(float x) { return lrintf(x); }
static inline long long iso9899_llrint(double x) { return llrint(x); }
static inline long long iso9899_llrintf(float x) { return llrintf(x); }
static inline long iso9899_lround(double x) { return lround(x); }
static inline long iso9899_lroundf(float x) { return lroundf(x); }
static inline long long iso9899_llround(double x) { return llround(x); }
static inline long long iso9899_llroundf(float x) { return llroundf(x); }

// Remainder functions (ISO/IEC 9899 Section 7.12.10)
static inline double iso9899_fmod(double x, double y) { return fmod(x, y); }
static inline float iso9899_fmodf(float x, float y) { return fmodf(x, y); }
static inline double iso9899_remainder(double x, double y) { return remainder(x, y); }
static inline float iso9899_remainderf(float x, float y) { return remainderf(x, y); }
static inline double iso9899_remquo(double x, double y, int *quo) { return remquo(x, y, quo); }
static inline float iso9899_remquof(float x, float y, int *quo) { return remquof(x, y, quo); }

// Manipulation functions (ISO/IEC 9899 Section 7.12.11)
static inline double iso9899_copysign(double x, double y) { return copysign(x, y); }
static inline float iso9899_copysignf(float x, float y) { return copysignf(x, y); }
static inline double iso9899_nan(const char *tagp) { return nan(tagp); }
static inline float iso9899_nanf(const char *tagp) { return nanf(tagp); }
static inline double iso9899_nextafter(double x, double y) { return nextafter(x, y); }
static inline float iso9899_nextafterf(float x, float y) { return nextafterf(x, y); }

// Note: ISO C specifies nexttoward takes long double as second parameter.
// We expose double-based wrappers to Swift for cross-platform consistency,
// but internally call the native nexttoward with appropriate type conversion.
#if defined(__APPLE__) && defined(__x86_64__)
    // macOS x86_64: long double is Float80, convert from double
    static inline double iso9899_nexttoward(double x, double y) { return nexttoward(x, (long double)y); }
    static inline float iso9899_nexttowardf(float x, double y) { return nexttowardf(x, (long double)y); }
#else
    // Other platforms: long double is same as double
    static inline double iso9899_nexttoward(double x, double y) { return nexttoward(x, y); }
    static inline float iso9899_nexttowardf(float x, double y) { return nexttowardf(x, y); }
#endif

// Maximum, minimum, and positive difference functions (ISO/IEC 9899 Section 7.12.12)
static inline double iso9899_fdim(double x, double y) { return fdim(x, y); }
static inline float iso9899_fdimf(float x, float y) { return fdimf(x, y); }
static inline double iso9899_fmax(double x, double y) { return fmax(x, y); }
static inline float iso9899_fmaxf(float x, float y) { return fmaxf(x, y); }
static inline double iso9899_fmin(double x, double y) { return fmin(x, y); }
static inline float iso9899_fminf(float x, float y) { return fminf(x, y); }

// Floating multiply-add (ISO/IEC 9899 Section 7.12.13)
static inline double iso9899_fma(double x, double y, double z) { return fma(x, y, z); }
static inline float iso9899_fmaf(float x, float y, float z) { return fmaf(x, y, z); }

// Comparison macros (ISO/IEC 9899 Section 7.12.14)
// Note: These wrap C macros as functions for Swift interoperability
static inline int iso9899_isgreater_d(double x, double y) { return isgreater(x, y); }
static inline int iso9899_isgreater_f(float x, float y) { return isgreater(x, y); }
static inline int iso9899_isgreaterequal_d(double x, double y) { return isgreaterequal(x, y); }
static inline int iso9899_isgreaterequal_f(float x, float y) { return isgreaterequal(x, y); }
static inline int iso9899_isless_d(double x, double y) { return isless(x, y); }
static inline int iso9899_isless_f(float x, float y) { return isless(x, y); }
static inline int iso9899_islessequal_d(double x, double y) { return islessequal(x, y); }
static inline int iso9899_islessequal_f(float x, float y) { return islessequal(x, y); }
static inline int iso9899_islessgreater_d(double x, double y) { return islessgreater(x, y); }
static inline int iso9899_islessgreater_f(float x, float y) { return islessgreater(x, y); }
static inline int iso9899_isunordered_d(double x, double y) { return isunordered(x, y); }
static inline int iso9899_isunordered_f(float x, float y) { return isunordered(x, y); }

#endif /* ISO9899_MATH_H */
