# R Operators - Comprehensive Demo
# This script demonstrates the concepts from the accompanying operator guide

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

# ---- Logical Operators ----
cat("\n---- Logical Operators ----\n")

# Element-wise AND (&)
and_result <- c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, FALSE)
cat("c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, FALSE) =", and_result, "\n")

# Element-wise OR (|)
or_result <- c(TRUE, FALSE, TRUE) | c(FALSE, FALSE, TRUE)
cat("c(TRUE, FALSE, TRUE) | c(FALSE, FALSE, TRUE) =", or_result, "\n")

# NOT (!)
not_result <- !c(TRUE, FALSE)
cat("!c(TRUE, FALSE) =", not_result, "\n")

# Scalar AND (&&) - only first elements
scalar_and <- c(TRUE, FALSE) && c(TRUE, FALSE)
cat("c(TRUE, FALSE) && c(TRUE, FALSE) =", scalar_and, "\n")
cat("Note: Only first elements (TRUE && TRUE) are evaluated\n")

# Scalar OR (||) - only first elements
scalar_or <- c(FALSE, TRUE) || c(FALSE, TRUE)
cat("c(FALSE, TRUE) || c(FALSE, TRUE) =", scalar_or, "\n")
cat("Note: Only first elements (FALSE || FALSE) are evaluated\n")

# Exclusive OR
xor_result <- xor(c(TRUE, FALSE, TRUE), c(TRUE, FALSE, FALSE))
cat("xor(c(TRUE, FALSE, TRUE), c(TRUE, FALSE, FALSE)) =", xor_result, "\n")

# Short-circuit evaluation demo
cat("\nShort-circuit evaluation:\n")
result1 <- FALSE && print("This will not be printed")
cat("FALSE && print(...) was evaluated but nothing printed (short-circuit)\n")
result2 <- TRUE || print("This will not be printed")
cat("TRUE || print(...) was evaluated but nothing printed (short-circuit)\n\n")

# ---- Assignment Operators ----
cat("---- Assignment Operators ----\n")

# Standard assignment (<-)
x <- 10
cat("x <- 10 results in x =", x, "\n")

# Alternative assignment (=)
y = 20
cat("y = 20 results in y =", y, "\n")

# Right assignment (->)
30 -> z
cat("30 -> z results in z =", z, "\n")

# Assignment in expressions
if ((max_val <- max(c(1, 5, 3))) > 4) {
  cat("Assigned max_val =", max_val, "inside an if condition\n")
}

# Create temporary environment to show global assignment
cat("\nGlobal assignment example:\n")
# Declare global variable b
b <- NULL

demo_global_assignment <- function() {
  # Local variable
  a <- 5
  cat("Local a:", a, "\n")
  
  # Global assignment
  b <<- 10
  cat("Global b assigned inside function\n")

  # Local function for comparison
  inner <- function() {
    a <- 99     # New local a
    cat("Inner function local a:", a, "\n")
    cat("Can still see parent's global assignment b:", b, "\n")
  }
  inner()
}

demo_global_assignment()
cat("Can access global b outside function:", b, "\n\n")

# ---- Miscellaneous Operators ----
cat("---- Miscellaneous Operators ----\n")

# %in% operator
fruits <- c("apple", "banana", "orange")
cat("'banana' %in% c('apple', 'banana', 'orange') =", "banana" %in% fruits, "\n")
cat("'grape' %in% c('apple', 'banana', 'orange') =", "grape" %in% fruits, "\n")

# Sequence operator (:)
sequence <- 1:5
cat("1:5 =", sequence, "\n")

# Matrix multiplication (%*%)
matrix1 <- matrix(1:4, nrow=2)
matrix2 <- matrix(c(2,1,0,3), nrow=2)
cat("Matrix multiplication result:\n")
print(matrix1 %*% matrix2)

# List/data frame access ($)
person <- list(name="John", age=30, scores=c(85, 90, 95))
cat("\nAccessing list element with $: person$name =", person$name, "\n")

# Extract single element ([[]])
cat("Accessing list element with [[]]: person[['age']] =", person[["age"]], "\n")

# Extract multiple elements ([])
cat("Accessing vector elements with []: person$scores[1:2] =", person$scores[1:2], "\n")

# Custom operator example
"%plus2%" <- function(x, y) {
  return((x + y) * 2)
}
cat("\nCustom operator example: 5 %plus2% 3 =", 5 %plus2% 3, "\n")
cat("This calculates (5 + 3) * 2 = 16\n")
