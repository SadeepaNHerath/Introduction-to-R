# Arithmetic and Relational Operators in R - Demo
# This script demonstrates the concepts from the accompanying note

# ---- Basic Arithmetic Operations ----
cat("Basic Arithmetic Operations:\n")

# Addition
addition <- 10 + 5
cat("10 + 5 =", addition, "\n")

# Subtraction
subtraction <- 10 - 5
cat("10 - 5 =", subtraction, "\n")

# Multiplication
multiplication <- 10 * 5
cat("10 * 5 =", multiplication, "\n")

# Division
division <- 10 / 5
cat("10 / 5 =", division, "\n")

# Exponentiation
exponentiation <- 10 ^ 2
cat("10 ^ 2 =", exponentiation, "\n")

# Modulus (remainder)
modulus <- 10 %% 3
cat("10 %% 3 =", modulus, "\n")

# Integer Division
int_division <- 10 %/% 3
cat("10 %/% 3 =", int_division, "\n\n")

# ---- Arithmetic with Vectors ----
cat("Arithmetic with Vectors:\n")

# Creating two vectors
vector1 <- c(1, 2, 3, 4, 5)
vector2 <- c(5, 4, 3, 2, 1)

cat("vector1:", vector1, "\n")
cat("vector2:", vector2, "\n\n")

# Vector addition
vector_addition <- vector1 + vector2
cat("vector1 + vector2 =", vector_addition, "\n")

# Vector subtraction
vector_subtraction <- vector1 - vector2
cat("vector1 - vector2 =", vector_subtraction, "\n")

# Vector multiplication
vector_multiplication <- vector1 * vector2
cat("vector1 * vector2 =", vector_multiplication, "\n")

# Vector division
vector_division <- vector1 / vector2
cat("vector1 / vector2 =", vector_division, "\n\n")

# ---- Relational Operators ----
cat("Relational Operators:\n")

# Less than
less_than <- 5 < 10
cat("5 < 10 is", less_than, "\n")

# Greater than
greater_than <- 5 > 10
cat("5 > 10 is", greater_than, "\n")

# Less than or equal to
less_equal <- 5 <= 5
cat("5 <= 5 is", less_equal, "\n")

# Greater than or equal to
greater_equal <- 5 >= 10
cat("5 >= 10 is", greater_equal, "\n")

# Equal to
equal <- 5 == 5
cat("5 == 5 is", equal, "\n")

# Not equal to
not_equal <- 5 != 5
cat("5 != 5 is", not_equal, "\n\n")

# ---- Relational Operators with Vectors ----
cat("Relational Operators with Vectors:\n")

# Vector comparison
comparison <- vector1 > vector2
cat("vector1 > vector2 =", comparison, "\n")

# Equal comparison
equal_comparison <- vector1 == vector2
cat("vector1 == vector2 =", equal_comparison, "\n\n")

# ---- Vector Recycling ----
cat("Vector Recycling:\n")

# Create vectors of different lengths
long_vector <- c(1, 2, 3, 4, 5, 6)
short_vector <- c(1, 2)

cat("long_vector:", long_vector, "\n")
cat("short_vector:", short_vector, "\n\n")

# Perfect recycling (length of longer vector is a multiple of shorter vector)
perfect_recycling <- c(1, 2, 3, 4) + c(1, 2)
cat("c(1, 2, 3, 4) + c(1, 2) =", perfect_recycling, "\n")
cat("Because c(1, 2) is recycled to c(1, 2, 1, 2)\n\n")

# Imperfect recycling (with warning)
cat("Imperfect recycling (expect a warning):\n")
imperfect_recycling <- long_vector + short_vector
cat("long_vector + short_vector =", imperfect_recycling, "\n")
cat("Because short_vector is recycled to c(1, 2, 1, 2, 1, 2)\n\n")

# Scalar recycling (common use case)
scalar_addition <- vector1 + 10
cat("vector1 + 10 =", scalar_addition, "\n")
cat("Because 10 is recycled to c(10, 10, 10, 10, 10)\n\n")

# ---- Logical Values in Arithmetic ----
cat("Logical Values in Arithmetic:\n")

# TRUE and FALSE in arithmetic context
logical_vector <- c(TRUE, FALSE, TRUE, FALSE)
cat("logical_vector:", logical_vector, "\n")

sum_logical <- sum(logical_vector)
cat("sum(logical_vector) =", sum_logical, "\n")
cat("This is because TRUE equals 1 and FALSE equals 0 in arithmetic operations\n")
