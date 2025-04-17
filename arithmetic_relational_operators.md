# Arithmetic and Relational Operators in R

## Arithmetic Operators

R supports all standard arithmetic operations:

| Operator | Description | Example | Result |
|----------|-------------|---------|--------|
| `+` | Addition | `5 + 3` | `8` |
| `-` | Subtraction | `5 - 3` | `2` |
| `*` | Multiplication | `5 * 3` | `15` |
| `/` | Division | `5 / 3` | `1.666667` |
| `^` | Exponentiation | `5 ^ 3` | `125` |
| `%%` | Modulus (remainder) | `5 %% 3` | `2` |
| `%/%` | Integer Division | `5 %/% 3` | `1` |

### Using Arithmetic Operators with Vectors

R performs operations element-wise when working with vectors:

```r
# Addition of vectors
c(1, 2, 3) + c(4, 5, 6)  # Results in c(5, 7, 9)

# Multiplication of vectors
c(1, 2, 3) * c(4, 5, 6)  # Results in c(4, 10, 18)
```

## Relational Operators

Relational operators compare values and return logical results:

| Operator | Description | Example | Result |
|----------|-------------|---------|--------|
| `<` | Less than | `5 < 3` | `FALSE` |
| `>` | Greater than | `5 > 3` | `TRUE` |
| `<=` | Less than or equal to | `5 <= 5` | `TRUE` |
| `>=` | Greater than or equal to | `5 >= 3` | `TRUE` |
| `==` | Equal to | `5 == 3` | `FALSE` |
| `!=` | Not equal to | `5 != 3` | `TRUE` |

### Using Relational Operators with Vectors

Like arithmetic operators, relational operators work element-wise on vectors:

```r
# Element-wise comparison
c(1, 2, 3) > c(2, 2, 2)  # Results in c(FALSE, FALSE, TRUE)
```

## Vector Recycling

Vector recycling is a key concept in R. When performing operations on vectors of different lengths, R "recycles" the shorter vector by repeating its elements to match the length of the longer vector.

### Rules of Vector Recycling:

1. If the length of the longer vector is a multiple of the shorter vector's length, R repeats the shorter vector to match the longer one.
2. If the lengths don't match evenly, R still recycles but issues a warning.

### Examples:

```r
# Perfect recycling (longer length is a multiple of shorter length)
c(1, 2, 3, 4) + c(1, 2)  # Becomes c(1, 2, 3, 4) + c(1, 2, 1, 2)
                         # Results in c(2, 4, 4, 6)

# Imperfect recycling (warning will be shown)
c(1, 2, 3, 4, 5) + c(1, 2)  # Becomes c(1, 2, 3, 4, 5) + c(1, 2, 1, 2, 1)
                            # Results in c(2, 4, 4, 6, 6)
```

### Practical Applications:

Vector recycling is particularly useful for:
- Adding a constant to every element in a vector: `c(1, 2, 3) + 5`
- Multiplying every element in a vector by a value: `c(1, 2, 3) * 2`
- Comparing a vector against a single value: `c(1, 2, 3) > 2`

## Important Notes for Beginners

1. R is case-sensitive: `A` and `a` are different variables.
2. R uses 1-based indexing (not 0-based like many other languages).
3. When comparing floating-point numbers, be cautious of precision issues. Use functions like `all.equal()` instead of `==` for floating-point comparisons.
4. The modulus operator (`%%`) works with decimal numbers in R, unlike some other languages.
5. Logical values (`TRUE` and `FALSE`) can be used in arithmetic operations where `TRUE` is treated as `1` and `FALSE` as `0`.
