# R Vectors Demo
# This script demonstrates vector concepts in R

# Clear workspace
rm(list = ls())

cat("========== VECTOR CREATION ==========\n")

# Creating vectors with c() function
num_vec <- c(10, 20, 30, 40, 50)
char_vec <- c("apple", "banana", "cherry")
log_vec <- c(TRUE, FALSE, TRUE, FALSE)

cat("Numeric vector:", num_vec, "\n")
cat("Character vector:", char_vec, "\n")
cat("Logical vector:", log_vec, "\n")

# Creating sequences
seq1 <- 1:10
seq2 <- seq(from = 0, to = 1, by = 0.25)
seq3 <- seq(from = 0, to = 100, length.out = 5)

cat("\nSequence 1:10:", seq1, "\n")
cat("Sequence 0 to 1 by 0.25:", seq2, "\n")
cat("Sequence 0 to 100 with 5 values:", seq3, "\n")

# Repeating values
rep1 <- rep(1:3, times = 2)
rep2 <- rep(1:3, each = 2)
rep3 <- rep(c("A", "B"), times = c(2, 3))

cat("\nRepeat 1:3 twice:", rep1, "\n")
cat("Repeat each element in 1:3 twice:", rep2, "\n")
cat("Repeat A twice and B three times:", rep3, "\n")

cat("\n========== NAMING VECTOR ELEMENTS ==========\n")

# Creating named vectors
student_scores <- c(Alice = 85, Bob = 92, Charlie = 78)
cat("Named vector student_scores:\n")
print(student_scores)

# Adding names to an existing vector
ages <- c(25, 30, 35)
names(ages) <- c("Alice", "Bob", "Charlie")
cat("\nVector after adding names:\n")
print(ages)

# Accessing named elements
cat("\nAccessing named elements:\n")
cat("student_scores['Bob']:", student_scores["Bob"], "\n")
cat("ages['Alice']:", ages["Alice"], "\n")

# Get names of a vector
cat("\nNames of student_scores:", names(student_scores), "\n")

cat("\n========== VECTOR INDEXING ==========\n")

# Create a sample vector
x <- c(10, 20, 30, 40, 50)
cat("Sample vector x:", x, "\n")

# Access by position (1-based indexing)
cat("\nAccessing elements by position:\n")
cat("x[1] (first element):", x[1], "\n")
cat("x[3] (third element):", x[3], "\n")
cat("x[1:3] (elements 1 through 3):", x[1:3], "\n")
cat("x[c(1,3,5)] (elements 1, 3, and 5):", x[c(1,3,5)], "\n")

# Negative indexing (exclusion)
cat("\nNegative indexing (exclusion):\n")
cat("x[-2] (all except second):", x[-2], "\n")
cat("x[-(1:3)] (all except first three):", x[-(1:3)], "\n")

# Logical indexing
cat("\nLogical indexing:\n")
logical_result <- x > 30
cat("x > 30 gives logical vector:", logical_result, "\n")
cat("x[x > 30] (elements greater than 30):", x[x > 30], "\n")
cat("x[x %% 20 == 0] (elements divisible by 20):", x[x %% 20 == 0], "\n")

cat("\n========== VECTOR COERCION ==========\n")

# Type coercion in vectors (homogeneous nature)
mixed_vec1 <- c(1, TRUE, FALSE)
mixed_vec2 <- c(1, "hello")
mixed_vec3 <- c(TRUE, "hello")

cat("Type coercion examples:\n")
cat("c(1, TRUE, FALSE) ->", mixed_vec1, "- class:", class(mixed_vec1), "\n")
cat("c(1, \"hello\") ->", mixed_vec2, "- class:", class(mixed_vec2), "\n")
cat("c(TRUE, \"hello\") ->", mixed_vec3, "- class:", class(mixed_vec3), "\n")

cat("\nCoercion hierarchy: logical < integer < numeric < complex < character\n")

cat("\n========== VECTOR OPERATIONS ==========\n")

# Arithmetic operations
x <- c(1, 2, 3, 4)
y <- c(10, 20, 30, 40)

cat("Vector x:", x, "\n")
cat("Vector y:", y, "\n")

cat("\nArithmetic operations:\n")
cat("x + y:", x + y, "\n")
cat("x * y:", x * y, "\n")
cat("x / y:", x / y, "\n")
cat("x^2:", x^2, "\n")

# Vector recycling
short_vec <- c(1, 2)
long_vec <- c(10, 20, 30, 40)

cat("\nVector recycling:\n")
cat("c(1, 2) + c(10, 20, 30, 40):", short_vec + long_vec, "\n")
cat("(shorter vector is recycled to match longer vector)\n")

# Common vector functions
cat("\nCommon vector functions:\n")
cat("Length of x:", length(x), "\n")
cat("Sum of x:", sum(x), "\n")
cat("Mean of x:", mean(x), "\n")
cat("Max of x:", max(x), "\n")
cat("Which elements of x > 2:", which(x > 2), "\n")
cat("Are all elements of x > 0?", all(x > 0), "\n")
cat("Are any elements of x > 3?", any(x > 3), "\n")

cat("\n========== END OF VECTOR DEMO ==========\n")
