#include <errno.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#ifdef BITV_64BIT

#ifdef BITV_SSE4
#include <nmmintrin.h>
#define BITV_POPCNT _mm_popcnt_u64
#else // BITV_SSE4
inline int bitv_popcnt_u64(uint64_t bits)
{
    bits = (bits & 0x5555555555555555) + ((bits >>  1) & 0x5555555555555555);
    bits = (bits & 0x3333333333333333) + ((bits >>  2) & 0x3333333333333333);
    bits = (bits & 0x0f0f0f0f0f0f0f0f) + ((bits >>  4) & 0x0f0f0f0f0f0f0f0f);
    bits = (bits & 0x00ff00ff00ff00ff) + ((bits >>  8) & 0x00ff00ff00ff00ff);
    bits = (bits & 0x0000ffff0000ffff) + ((bits >> 16) & 0x0000ffff0000ffff);
    return (bits & 0x00000000ffffffff) + ((bits >> 32) & 0x00000000ffffffff);
}
#define BITV_POPCNT bitv_popcnt_u64
#endif // BITV_SSE4
typedef uint64_t bitv_value_t;
const size_t bitv_bits = 64;
const bitv_value_t bitv_full_bit = 0xffffffff;

#else // BITV_64BIT

#ifdef BITV_SSE4
#include <immintrin.h>
#define BITV_POPCNT _mm_popcnt_u32
#else // BITV_SSE4
inline int bitv_popcnt_u32(uint32_t bits)
{
    bits = (bits & 0x55555555) + ((bits >>  1) & 0x55555555);
    bits = (bits & 0x33333333) + ((bits >>  2) & 0x33333333);
    bits = (bits & 0x0f0f0f0f) + ((bits >>  4) & 0x0f0f0f0f);
    bits = (bits & 0x00ff00ff) + ((bits >>  8) & 0x00ff00ff);
    return (bits & 0x0000ffff) + ((bits >> 16) & 0x0000ffff);
}
#define BITV_POPCNT bitv_popcnt_u32
#endif // BITV_SSE4
typedef uint32_t bitv_value_t;
const size_t bitv_bits = 32;
const bitv_value_t bitv_full_bit = 0xffff;

#endif // BITV_64BIT

#define MY_MIN(a, b) ((a) < (b) ? a : b)

typedef struct {
    size_t size;
    bitv_value_t *v;
} bitv;

inline bitv bitv_create(size_t size) {
    bitv bv = { size, calloc((size + bitv_bits - 1) / bitv_bits, sizeof(bitv_value_t)) };
    return bv;
}

inline void bitv_destroy(bitv *bv) {
    free(bv->v);
    memset(bv, 0, sizeof(*bv));
}

inline bool bitv_get(bitv *bv, size_t i) {
    return bv->v[i / bitv_bits] & ((bitv_value_t)1 << i % bitv_bits);
}

inline void bitv_on(bitv *bv, size_t i) {
    bv->v[i / bitv_bits] |= (bitv_value_t)1 << i % bitv_bits;
}

inline void bitv_off(bitv *bv, size_t i) {
    bv->v[i / bitv_bits] &= ~((bitv_value_t)1 << i % bitv_bits);
}

inline void bitv_on_all(bitv *bv) {
    size_t n = bv->size / bitv_bits;
    memset(bv->v, bitv_full_bit, n * sizeof(bitv_value_t));
    size_t rem = bv->size % bitv_bits;
    size_t offset = n * bitv_bits;
    for (size_t i = 0; i < rem; ++i) {
        bitv_on(bv, offset + i);
    }
}

inline void bitv_off_all(bitv *bv) {
    memset(bv->v, 0, (bv->size + bitv_bits - 1) / bitv_bits * sizeof(bitv_value_t));
}

inline size_t bitv_cardinality(bitv *bv) {
    size_t count = 0;
    for (size_t i = 0; i < (bv->size + bitv_bits - 1) / bitv_bits; ++i) {
        count += BITV_POPCNT(bv->v[i]);
    }
    return count;
}

bitv sieve(int size) {
    bitv sieveArray = bitv_create(size);
    bitv_on_all(&sieveArray);
    for (int i = 0; i < MY_MIN(2, size); ++i) { bitv_off(&sieveArray, i); }
    int root = sqrt(size) + 1;
    for (int i = 2; i < root; ++i) {
        if (!bitv_get(&sieveArray, i)) { continue; }
        for (int j = i * i; j < size; j += i) {
            bitv_off(&sieveArray, j);
        }
    }
    return sieveArray;
}

int countPrime(int n) {
    bitv sieveArray = sieve(n + 1);
    int count = bitv_cardinality(&sieveArray);
    bitv_destroy(&sieveArray);
    return count;
}

int main(int argc, char* argv[]) {
    int n = 10000000;
    if (argc > 1) {
        char *endptr;
        n = strtol(argv[1], &endptr, 10);
        if (n < 0 || *endptr != '\0' || errno) {
            exit(1);
        };
    }
    printf("%d\n", countPrime(n));
}
