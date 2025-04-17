# R Matrix Operations Demo
# This script demonstrates comprehensive matrix operations in R

# Clear workspace
rm(list = ls())

cat("========== MATRIX CREATION ==========\n")

# Create a matrix using matrix() function
m1 <- matrix(1:9, nrow = 3, ncol = 3)
cat("Matrix filled by column (default):\n")
print(m1)

m2 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)
cat("\nMatrix filled by row (byrow = TRUE):\n")
print(m2)

# Create a matrix from vectors using rbind and cbind
row1 <- c(1, 2, 3)
row2 <- c(4, 5, 6)
m3 <- rbind(row1, row2)
cat("\nMatrix created with rbind():\n")
print(m3)

col1 <- c(1, 4)
col2 <- c(2, 5)
col3 <- c(3, 6)
m4 <- cbind(col1, col2, col3)
cat("\nMatrix created with cbind():\n")
print(m4)

# Create special matrices
diag_mat <- diag(c(1, 2, 3))
cat("\nDiagonal matrix:\n")
print(diag_mat)

identity_mat <- diag(3)
cat("\nIdentity matrix (3x3):\n")
print(identity_mat)

cat("\n========== MATRIX DIMENSIONS ==========\n")

m <- matrix(1:12, nrow = 3, ncol = 4)
cat("Matrix m:\n")
print(m)
cat("\nDimensions of matrix m:", dim(m), "\n")
cat("Number of rows:", nrow(m), "\n")
cat("Number of columns:", ncol(m), "\n")
cat("Total number of elements:", length(m), "\n")

cat("\n========== NAMING MATRIX ELEMENTS ==========\n")

# Create a matrix
m5 <- matrix(1:6, nrow = 2, ncol = 3)
cat("Original matrix:\n")
print(m5)

# Add row and column names
rownames(m5) <- c("Row1", "Row2")
colnames(m5) <- c("Col1", "Col2", "Col3")
cat("\nMatrix with row and column names:\n")
print(m5)

# Create matrix with names directly
named_mat <- matrix(1:6, nrow = 2, ncol = 3,
                    dimnames = list(c("R1", "R2"), 
                                    c("C1", "C2", "C3")))
cat("\nMatrix created with names directly:\n")
print(named_mat)

cat("\n========== ACCESSING MATRIX ELEMENTS ==========\n")

m6 <- matrix(1:9, nrow = 3, ncol = 3)
cat("Matrix m6:\n")
print(m6)

# Access a single element
cat("\nAccessing elements:\n")
cat("m6[1, 2] (row 1, column 2):", m6[1, 2], "\n")

# Access an entire row or column
cat("\nAccessing entire row or column:\n")
cat("m6[2, ] (entire 2nd row):", m6[2, ], "\n")
cat("m6[, 3] (entire 3rd column):", m6[, 3], "\n")

# Access a submatrix
cat("\nAccessing a submatrix:\n")
cat("m6[1:2, 2:3] (rows 1-2, columns 2-3):\n")
print(m6[1:2, 2:3])

# Accessing by names (for named matrices)
cat("\nAccessing by names:\n")
cat("named_mat['R1', 'C2']:", named_mat["R1", "C2"], "\n")

cat("\n========== MATRIX OPERATIONS ==========\n")

A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

cat("Matrix A:\n")
print(A)
cat("\nMatrix B:\n")
print(B)

# Arithmetic operations
cat("\nArithmetic operations:\n")
cat("A + B (Addition):\n")
print(A + B)

cat("\nA - B (Subtraction):\n")
print(A - B)

cat("\nA * B (Element-wise multiplication):\n")
print(A * B)

cat("\nA / B (Element-wise division):\n")
print(A / B)

# Matrix multiplication
cat("\nMatrix multiplication:\n")
cat("A %*% B:\n")
print(A %*% B)

# Other matrix operations
cat("\nOther matrix operations:\n")
cat("t(A) (Transpose):\n")
print(t(A))

# If matrix is square and invertible
if(det(A) != 0) {
  cat("\nsolve(A) (Inverse of A):\n")
  print(solve(A))
}

cat("\ndet(A) (Determinant):", det(A), "\n")

cat("\neigen(A) (Eigenvalues and eigenvectors):\n")
print(eigen(A))

# Apply functions to rows/columns
cat("\nApply functions to rows/columns:\n")
cat("apply(A, 1, sum) (Sum of each row):", apply(A, 1, sum), "\n")
cat("apply(A, 2, mean) (Mean of each column):", apply(A, 2, mean), "\n")

cat("\n========== COMBINING MATRICES ==========\n")

cat("Combining matrices:\n")
cat("rbind(A, B) (Stack B below A):\n")
print(rbind(A, B))

cat("\ncbind(A, B) (Stack B to the right of A):\n")
print(cbind(A, B))

cat("\n========== MATRIX TRANSFORMATIONS ==========\n")

m7 <- matrix(1:6, nrow = 2, ncol = 3)
cat("Original matrix m7:\n")
print(m7)

# Reshape a matrix
dim(m7) <- c(3, 2)
cat("\nReshaped matrix (3x2):\n")
print(m7)

# Convert to vector and back
v <- as.vector(m7)
cat("\nMatrix converted to vector:", v, "\n")

m8 <- matrix(v, nrow = 2, byrow = TRUE)
cat("\nVector converted back to matrix (different shape):\n")
print(m8)

cat("\n========== PRACTICAL EXAMPLES ==========\n")

# Example: Simple linear regression matrix calculation
cat("Example: Linear regression with matrices\n")

# Sample data
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 6)

# Design matrix with intercept column
X <- cbind(1, x)
cat("Design matrix X:\n")
print(X)

# Calculate beta coefficients: (X'X)^(-1)X'y
beta <- solve(t(X) %*% X) %*% t(X) %*% y
cat("\nRegression coefficients (intercept, slope):", beta, "\n")

# Example: Distance matrix calculation
cat("\nExample: Distance matrix between points\n")
points <- matrix(c(1,1, 2,3, 4,5), ncol = 2, byrow = TRUE)
cat("Points:\n")
print(points)

# Calculate Euclidean distance between all pairs of points
n <- nrow(points)
dist_matrix <- matrix(0, n, n)
for(i in 1:n) {
  for(j in 1:n) {
    dist_matrix[i,j] <- sqrt(sum((points[i,] - points[j,])^2))
  }
}

cat("\nDistance matrix:\n")
print(dist_matrix)

cat("\n========== END OF MATRIX DEMO ==========\n")
