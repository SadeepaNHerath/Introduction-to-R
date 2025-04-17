# R Array Demo Script
# This script demonstrates array operations and concepts in R

# Clear workspace
rm(list = ls())

cat("========== ARRAY CREATION ==========\n")

# Create basic 3D array
arr1 <- array(1:24, dim = c(2, 3, 4))
cat("3D array (2×3×4):\n")
print(arr1)

# Create array with specific values
arr2 <- array(0, dim = c(2, 2, 2))
cat("\nArray of zeros (2×2×2):\n")
print(arr2)

# Create array from existing matrices
mat1 <- matrix(1:6, nrow = 2)
mat2 <- matrix(7:12, nrow = 2)
cat("\nMatrix 1:\n")
print(mat1)
cat("\nMatrix 2:\n")
print(mat2)

arr3 <- array(c(mat1, mat2), dim = c(2, 3, 2))
cat("\nArray created from matrices (2×3×2):\n")
print(arr3)

# Create 4D array
arr4 <- array(1:16, dim = c(2, 2, 2, 2))
cat("\n4D array (2×2×2×2):\n")
print(arr4)

cat("\n========== ARRAY DIMENSIONS ==========\n")

# Get dimensions
cat("Dimensions of arr1:", dim(arr1), "\n")
cat("Number of elements in arr1:", length(arr1), "\n")

# Check structure
cat("\nStructure of arr1:\n")
str(arr1)

cat("\n========== NAMING ARRAY DIMENSIONS ==========\n")

# Create array with dimension names
named_arr <- array(
  1:24, 
  dim = c(2, 3, 4),
  dimnames = list(
    c("Row1", "Row2"),
    c("Col1", "Col2", "Col3"),
    c("Layer1", "Layer2", "Layer3", "Layer4")
  )
)

cat("Array with named dimensions:\n")
print(named_arr)

# Adding names to existing array
arr5 <- array(1:8, dim = c(2, 2, 2))
dimnames(arr5) <- list(
  c("X1", "X2"),
  c("Y1", "Y2"),
  c("Z1", "Z2")
)

cat("\nArray after adding dimension names:\n")
print(arr5)

cat("\n========== ACCESSING ARRAY ELEMENTS ==========\n")

# Access a single element
cat("Single element - arr1[1, 2, 3]:", arr1[1, 2, 3], "\n")

# Access a slice (2D)
cat("\nSlice - arr1[1, , ] (Row 1, all columns, all layers):\n")
print(arr1[1, , ])

cat("\nSlice - arr1[, 2, ] (All rows, Column 2, all layers):\n")
print(arr1[, 2, ])

cat("\nSlice - arr1[, , 3] (All rows, all columns, Layer 3):\n")
print(arr1[, , 3])

# Access a sub-array
cat("\nSub-array - arr1[1:2, 2:3, 1:2]:\n")
print(arr1[1:2, 2:3, 1:2])

# Access by names (for named arrays)
cat("\nAccessing by names - named_arr['Row1', 'Col2', 'Layer3']:", 
    named_arr["Row1", "Col2", "Layer3"], "\n")

cat("\n========== ARRAY OPERATIONS ==========\n")

# Create two arrays for operations
a1 <- array(1:8, dim = c(2, 2, 2))
a2 <- array(9:16, dim = c(2, 2, 2))

cat("Array a1:\n")
print(a1)
cat("\nArray a2:\n")
print(a2)

# Element-wise arithmetic
cat("\nElement-wise addition (a1 + a2):\n")
print(a1 + a2)

cat("\nElement-wise multiplication (a1 * a2):\n")
print(a1 * a2)

cat("\nElement-wise division (a1 / a2):\n")
print(a1 / a2)

# Apply functions across dimensions
cat("\nApplying functions across dimensions:\n")

cat("\napply(a1, 1, sum) - Sum along first dimension (rows):\n")
print(apply(a1, 1, sum))

cat("\napply(a1, 2, mean) - Mean along second dimension (columns):\n")
print(apply(a1, 2, mean))

cat("\napply(a1, 3, max) - Max along third dimension (layers):\n")
print(apply(a1, 3, max))

cat("\napply(a1, c(1,2), sum) - Sum across first and second dimensions:\n")
print(apply(a1, c(1,2), sum))

cat("\n========== ARRAY TRANSFORMATIONS ==========\n")

# Reshape array
a_reshape <- array(1:24, dim = c(2, 3, 4))
cat("Original array dimensions:", dim(a_reshape), "\n")

dim(a_reshape) <- c(6, 4)
cat("After reshaping to matrix - dimensions:", dim(a_reshape), "\n")
cat("Reshaped to 6×4 matrix:\n")
print(a_reshape)

# Flatten to vector
a_vector <- as.vector(a_reshape)
cat("\nFlattened to vector:\n")
print(a_vector)

# Reshape back to 3D
a_3d_again <- array(a_vector, dim = c(2, 3, 4))
cat("\nReshaped back to 3D array (2×3×4):\n")
print(a_3d_again)

cat("\n========== PRACTICAL EXAMPLES ==========\n")

cat("Example 1: Temperature data for multiple stations over time\n")
# Temperature data: 3 stations × 4 seasons × 2 years
temp_data <- array(
  c(20, 21, 19,  # Station 1-3, Spring, Year 1
    22, 23, 20,  # Station 1-3, Summer, Year 1
    18, 19, 20,  # Station 1-3, Fall, Year 1
    21, 22, 21,  # Station 1-3, Winter, Year 1
    19, 20, 18,  # Station 1-3, Spring, Year 2
    21, 22, 19,  # Station 1-3, Summer, Year 2
    17, 18, 19,  # Station 1-3, Fall, Year 2
    20, 21, 20), # Station 1-3, Winter, Year 2
  dim = c(3, 4, 2),
  dimnames = list(
    c("Station1", "Station2", "Station3"),
    c("Spring", "Summer", "Fall", "Winter"),
    c("Year1", "Year2")
  )
)

cat("\nTemperature data array:\n")
print(temp_data)

# Analysis
cat("\nAverage temperature by station:\n")
print(apply(temp_data, 1, mean))

cat("\nAverage temperature by season:\n")
print(apply(temp_data, 2, mean))

cat("\nAverage temperature by year:\n")
print(apply(temp_data, 3, mean))

cat("\nHighest temperature in each season-year combination:\n")
print(apply(temp_data, c(2,3), max))

cat("\nExample 2: Simple image processing with arrays\n")
# Create a small RGB image (3×3 pixels)
tiny_image <- array(
  runif(27),  # Random values between 0 and 1
  dim = c(3, 3, 3),
  dimnames = list(
    paste0("row", 1:3),
    paste0("col", 1:3),
    c("Red", "Green", "Blue")
  )
)

cat("\nTiny RGB image as 3D array:\n")
print(tiny_image)

# Extract color channels
red_channel <- tiny_image[, , "Red"]
green_channel <- tiny_image[, , "Green"]
blue_channel <- tiny_image[, , "Blue"]

cat("\nRed channel:\n")
print(red_channel)

# Convert to grayscale (weighted average of RGB)
grayscale <- 0.3 * red_channel + 0.59 * green_channel + 0.11 * blue_channel
cat("\nGrayscale version:\n")
print(grayscale)

cat("\n========== END OF ARRAY DEMO ==========\n")
