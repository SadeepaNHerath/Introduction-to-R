# General Classes of Data in R

R has a rich variety of data types and structures that allow for efficient data manipulation and analysis.

## Basic Data Types

### Numeric
- Default computational data type in R
- Double-precision floating-point numbers
```r
x <- 42.5
class(x)  # "numeric"
```

### Integer
- Whole numbers stored without decimal components
- Created with the 'L' suffix
```r
y <- 42L
class(y)  # "integer"
```

### Character
- Text data enclosed in quotes
- Both single and double quotes work
```r
name <- "Data Science"
class(name)  # "character"
```

### Logical
- Boolean values: TRUE or FALSE
- Can be abbreviated as T and F, but not recommended
```r
is_valid <- TRUE
class(is_valid)  # "logical"
```

### Complex
- Numbers with real and imaginary parts
```r
z <- 3+2i
class(z)  # "complex"
```

### Raw
- Stores bytes
```r
raw_data <- charToRaw("Hello")
class(raw_data)  # "raw"
```

### Date and Time
R has specific classes for handling date and time data:

#### Date
- Represents calendar dates (without time)
- Stored internally as days since January 1, 1970
```r
# Creating date objects
today <- Sys.Date()  # Current date
class(today)  # "Date"

# From character strings
date1 <- as.Date("2023-05-15")
date2 <- as.Date("05/15/2023", format = "%m/%d/%Y")

# Date arithmetic
date1 - date2  # Difference in days
date1 + 30     # Add 30 days
```

#### POSIXct and POSIXlt
- POSIXct: Datetime stored as seconds since January 1, 1970 (more efficient for storage)
- POSIXlt: List-based representation with named components (year, month, day, etc.)

```r
# Current date and time
now_ct <- Sys.time()  # POSIXct format
class(now_ct)  # "POSIXct" "POSIXt"

# Convert to POSIXlt
now_lt <- as.POSIXlt(now_ct)
class(now_lt)  # "POSIXlt" "POSIXt"

# Access components of POSIXlt
now_lt$year + 1900  # Year (offset from 1900)
now_lt$mon + 1      # Month (0-11, so add 1)
now_lt$mday         # Day of month
now_lt$hour         # Hour
now_lt$min          # Minute
now_lt$sec          # Second

# Creating from strings
datetime1 <- as.POSIXct("2023-05-15 14:30:00")
datetime2 <- as.POSIXct("05/15/2023 2:30 PM", format = "%m/%d/%Y %I:%M %p")
```

#### Time Zones
```r
# Specify time zone
datetime_nyc <- as.POSIXct("2023-05-15 14:30:00", tz = "America/New_York")
datetime_tokyo <- as.POSIXct("2023-05-15 14:30:00", tz = "Asia/Tokyo")

# List available time zones
head(OlsonNames(), 3)
```

#### Formatting Dates and Times
```r
# Format as string
format(Sys.Date(), "%A, %B %d, %Y")  # "Monday, January 01, 2023"

# Common format codes:
# %Y: 4-digit year         %y: 2-digit year
# %m: month (01-12)        %B: month name       %b: abbreviated month
# %d: day (01-31)          %A: weekday name     %a: abbreviated weekday
# %H: hour (00-23)         %I: hour (01-12)     %p: AM/PM
# %M: minute (00-59)       %S: second (00-59)
```

#### Lubridate Package
```r
# The lubridate package provides easier date-time manipulation
# install.packages("lubridate")
# library(lubridate)

# Creating dates with lubridate (when package is loaded)
ymd("2023-05-15")              # From year, month, day
mdy("05/15/2023")              # From month, day, year
ymd_hms("2023-05-15 14:30:45") # With time
wday("2023-05-25", label = TRUE) # Extract weekday with labels
# Change the time zone of a date-time object
with_tz(ymd_hms("2023-05-15 14:30:45"), 'America/Chicago') # Convert to Central Time
```

## Statistical Data Classifications

### Qualitative (Categorical) Data
- Represents qualities, categories, or characteristics that cannot be measured numerically
- Stored in R typically as factors or character vectors

#### Nominal Data
- Categories with no inherent order
- Examples: colors, gender, blood types
```r
# As factor (recommended for categorical data)
blood_types <- factor(c("A", "B", "AB", "O", "A"))

# As character vector
colors <- c("red", "blue", "green", "yellow")
```

#### Ordinal Data
- Categories with a meaningful order or ranking
- Examples: education levels, survey responses (low/medium/high)
```r
# Ordinal factor with explicitly defined levels and order
education <- factor(c("High School", "Bachelor's", "Master's", "PhD"),
                    levels = c("High School", "Bachelor's", "Master's", "PhD"),
                    ordered = TRUE)

# Checking if one level is greater than another
education[1] < education[4]  # TRUE
```

### Quantitative (Numerical) Data
- Represents quantities that can be measured numerically
- Stored in R typically as numeric or integer vectors

#### Discrete Data
- Countable values with gaps between possible values
- Examples: counts, number of children
```r
# Store as integers
children <- c(0L, 1L, 2L, 3L)
```

#### Continuous Data
- Can take any value within a range
- Examples: height, weight, temperature
```r
# Store as numeric
temperatures <- c(98.6, 97.5, 99.1, 101.2)
```

### Working with Both Data Types
```r
# Creating a dataset with both types
survey_data <- data.frame(
  id = 1:5,
  age = c(25, 34, 28, 52, 46),               # Quantitative (continuous)
  income_group = factor(                      # Qualitative (ordinal)
    c("low", "medium", "medium", "high", "high"),
    levels = c("low", "medium", "high"),
    ordered = TRUE
  ),
  education = factor(                         # Qualitative (nominal)
    c("HS", "College", "PhD", "Masters", "College")
  ),
  num_children = c(0L, 2L, 1L, 3L, 2L)       # Quantitative (discrete)
)

# Summarizing by categorical variable
aggregate(age ~ income_group, data = survey_data, mean)
```

## Data Structures

### Vectors
- Basic, one-dimensional data structure
- Must contain elements of the same type (homogeneous)
- Created using the `c()` function (combine)
```r
numeric_vector <- c(1, 2, 3, 4, 5)
character_vector <- c("a", "b", "c")

# Mixing types forces coercion to the most flexible type
mixed_vector <- c(1, TRUE, "hello")  # All elements become character
```

#### Creating Vectors
```r
# Using c() function to create vectors
numbers <- c(10, 20, 30, 40, 50)

# Using sequence functions
seq_vector <- 1:10                  # Integer sequence from 1 to 10
seq_by <- seq(from = 0, to = 1, by = 0.1)  # 0, 0.1, 0.2, ..., 1.0
seq_length <- seq(from = 0, to = 10, length.out = 5)  # 5 equally spaced values

# Repeating values
rep_vector <- rep(1:3, times = 2)   # 1, 2, 3, 1, 2, 3
rep_each <- rep(1:3, each = 2)      # 1, 1, 2, 2, 3, 3
```

#### Naming Vector Elements
```r
# Creating a named vector
student_scores <- c(Alice = 85, Bob = 92, Charlie = 78)

# Adding names to an existing vector
ages <- c(25, 30, 35)
names(ages) <- c("Alice", "Bob", "Charlie")

# Accessing named elements
student_scores["Bob"]  # 92
```

#### Indexing Vectors
```r
x <- c(10, 20, 30, 40, 50)

# R uses 1-based indexing (not 0-based like some languages)
x[1]      # First element: 10
x[3]      # Third element: 30

# Multiple indices
x[c(1, 3, 5)]  # Elements 1, 3, and 5: 10, 30, 50
x[1:3]         # Elements 1 through 3: 10, 20, 30

# Negative indices exclude elements
x[-2]     # All elements except the second: 10, 30, 40, 50
x[-(1:3)] # All elements except 1 through 3: 40, 50

# Logical indexing
x[x > 30]  # Elements greater than 30: 40, 50
x[x %% 20 == 0]  # Elements divisible by 20: 20, 40
```

#### Vector Operations
```r
# Arithmetic operations are vectorized
x <- c(1, 2, 3, 4)
y <- c(10, 20, 30, 40)

x + y      # Element-wise addition: 11, 22, 33, 44
x * 2      # Scalar multiplication: 2, 4, 6, 8
x^2        # Element-wise power: 1, 4, 9, 16

# Recycling (shorter vectors are repeated)
c(1, 2, 3, 4) + c(10, 20)  # Becomes c(1, 2, 3, 4) + c(10, 20, 10, 20)
```

### Lists
- Ordered collection of objects
- Can contain different types of elements
- Unlike vectors, can store heterogeneous data (different types in one structure)
- Elements can be vectors, matrices, data frames, or even other lists

#### Creating Lists
```r
# Create a list with different types of elements
my_list <- list(a = 1:3, b = "hello", c = TRUE)

# Create a nested list
nested_list <- list(
  numbers = 1:5,
  text = c("a", "b", "c"),
  sublist = list(x = 10, y = 20)
)

# Convert other objects to lists
vec_to_list <- as.list(1:5)  # Converts vector to list
```

#### Accessing List Elements
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE, d = c(2.5, 7.8))

# Access by name using $ notation
my_list$a        # Returns the vector 1:3
my_list$b        # Returns "hello"

# Access by position using [[ ]] (returns the element)
my_list[[1]]     # Returns the vector 1:3
my_list[[2]]     # Returns "hello"

# Access by name using [[ ]] 
my_list[["a"]]   # Returns the vector 1:3

# Access nested elements
nested_list <- list(info = list(name = "Alice", age = 30))
nested_list$info$name  # Returns "Alice"
nested_list[[1]][[1]]  # Returns "Alice"
```

#### List Slices with [ ]
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE, d = c(2.5, 7.8))

# Using [ ] returns a sublist (preserves list structure)
my_list[1]       # Returns list with first element: list(a = 1:3)
my_list[c(1, 3)] # Returns list with elements 1 and 3: list(a = 1:3, c = TRUE)
my_list["a"]     # Returns list with element named "a": list(a = 1:3)
my_list[c("a", "c")] # Returns list with elements named "a" and "c"
```

#### Simplifying vs Preserving List Structure
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE)

# [[ ]] simplifies - extracts the element itself
my_list[[1]]     # Returns 1 2 3 (the vector, not in a list)

# [ ] preserves - returns a sublist
my_list[1]       # Returns list(a = 1:3) (still a list)

# Using $ always simplifies
my_list$a        # Returns 1 2 3 (the vector, not in a list)
```

#### Named List Slices
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE, d = c(2.5, 7.8))

# Create a named slice
slice1 <- my_list[c("a", "c")]
names(slice1)    # Returns "a" "c"

# Rename elements in a slice
slice2 <- my_list[c("a", "b")]
names(slice2) <- c("first", "second")
slice2           # Now named 'first' and 'second' instead of 'a' and 'b'

# Create a new list with renamed elements
renamed_list <- list(
  first = my_list$a,
  favorite_word = my_list$b
)
```

#### Modifying Lists
```r
my_list <- list(a = 1:3, b = "hello")

# Add a new element
my_list$c <- TRUE
my_list[["d"]] <- c(2.5, 7.8)

# Modify an existing element
my_list$a <- c(10, 20, 30)
my_list[["b"]] <- "goodbye"

# Remove an element
my_list$b <- NULL
```

#### List Operations and Functions
```r
# Combine lists
list1 <- list(a = 1, b = 2)
list2 <- list(c = 3, d = 4)
combined <- c(list1, list2)  # Results in list(a = 1, b = 2, c = 3, d = 4)

# Get list length
length(my_list)  # Number of top-level elements

# Check if an element exists
"a" %in% names(my_list)

# Apply a function to each element
lapply(my_list, mean)  # Returns a list of means (where applicable)
sapply(my_list, length)  # Returns a simplified vector of lengths
```

### Matrices
- Two-dimensional, homogeneous data structure
- All elements must be of the same type
- Stored in column-major order (columns are stacked)

#### Creating Matrices
```r
# Create a matrix by specifying data, dimensions, and filling direction
m1 <- matrix(1:9, nrow = 3, ncol = 3)                # Fill by column (default)
m2 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)  # Fill by row

# Create a matrix from vectors
row1 <- c(1, 2, 3)
row2 <- c(4, 5, 6)
m3 <- rbind(row1, row2)                              # Bind by rows

col1 <- c(1, 4)
col2 <- c(2, 5)
col3 <- c(3, 6)
m4 <- cbind(col1, col2, col3)                        # Bind by columns

# Create diagonal matrix
diag_mat <- diag(c(1, 2, 3))                         # 3x3 diagonal matrix
identity_mat <- diag(3)                              # 3x3 identity matrix
```

#### Naming Rows and Columns
```r
# Create a matrix with names
mat <- matrix(1:6, nrow = 2, ncol = 3)

# Add row and column names
rownames(mat) <- c("Row1", "Row2")
colnames(mat) <- c("Col1", "Col2", "Col3")

# Create with names directly
named_mat <- matrix(1:6, nrow = 2, ncol = 3,
                    dimnames = list(c("Row1", "Row2"), 
                                    c("Col1", "Col2", "Col3")))
```

#### Accessing Matrix Elements
```r
mat <- matrix(1:9, nrow = 3, ncol = 3)

# Access individual element (by row, column)
mat[1, 2]      # Element at row 1, column 2

# Access entire row or column
mat[2, ]       # Entire 2nd row
mat[, 3]       # Entire 3rd column

# Access multiple rows/columns
mat[1:2, 2:3]  # Rows 1-2, columns 2-3

# Access by row/column names (if available)
named_mat["Row1", "Col2"]  # Element at Row1, Col2
```

#### Matrix Operations
```r
A <- matrix(1:4, nrow = 2)
B <- matrix(5:8, nrow = 2)

# Arithmetic operations (element-wise)
A + B          # Addition
A - B          # Subtraction
A * B          # Element-wise multiplication
A / B          # Element-wise division

# Matrix multiplication
A %*% B        # Matrix multiplication

# Other matrix operations
t(A)           # Transpose
solve(A)       # Matrix inverse (if square and invertible)
det(A)         # Determinant (if square)
eigen(A)       # Eigenvalues and eigenvectors

# Apply functions to rows or columns
apply(A, 1, sum)  # Sum of each row (MARGIN=1 for rows)
apply(A, 2, mean) # Mean of each column (MARGIN=2 for columns)
```

#### Combining Matrices
```r
A <- matrix(1:4, nrow = 2)
B <- matrix(5:8, nrow = 2)

# Combine by rows
rbind(A, B)    # Stack B below A

# Combine by columns
cbind(A, B)    # Stack B to the right of A

# For matrices with different dimensions, be careful about compatibility
```

#### Matrix Transformations
```r
m <- matrix(1:9, nrow = 3)

# Reshape a matrix
dim(m) <- c(1, 9)     # Reshape to 1x9

# Convert to/from vector
v <- as.vector(m)     # Matrix to vector
matrix(v, nrow = 3)   # Vector back to matrix
```

### Arrays
- Multi-dimensional generalizations of matrices
- Store data in multiple dimensions (beyond the 2D structure of matrices)
- All elements must be of the same type (homogeneous)
- Useful for representing multi-dimensional data like 3D spatial data, time series across multiple variables, etc.

#### Comparison with Vectors and Matrices
```r
# Vectors: 1-dimensional, homogeneous collections
vector_example <- c(1, 2, 3, 4)  # 1D: [1, 2, 3, 4]

# Matrices: 2-dimensional, homogeneous collections
matrix_example <- matrix(1:6, nrow = 2, ncol = 3)  # 2D: 2×3 grid

# Arrays: n-dimensional, homogeneous collections 
array_example <- array(1:24, dim = c(2, 3, 4))  # 3D: 2×3×4 cube
```

#### Creating Arrays
```r
# Create a 3D array (2×3×4)
arr1 <- array(1:24, dim = c(2, 3, 4))

# Create a 4D array (2×2×2×3)
arr2 <- array(1:24, dim = c(2, 2, 2, 3))

# Create an array with specific values
arr3 <- array(0, dim = c(2, 2, 2))  # 2×2×2 array of zeros

# Create an array from vectors or matrices
mat1 <- matrix(1:6, nrow = 2)
mat2 <- matrix(7:12, nrow = 2)
arr4 <- array(c(mat1, mat2), dim = c(2, 3, 2))  # Stack matrices into array
```

#### Naming Array Dimensions
```r
# Create array with dimension names
arr5 <- array(1:24, 
              dim = c(2, 3, 4),
              dimnames = list(
                c("Row1", "Row2"),
                c("Col1", "Col2", "Col3"),
                c("Layer1", "Layer2", "Layer3", "Layer4")
              ))

# Add names to existing array
arr <- array(1:24, dim = c(2, 3, 4))
dimnames(arr) <- list(
  c("Row1", "Row2"),
  c("Col1", "Col2", "Col3"),
  c("Layer1", "Layer2", "Layer3", "Layer4")
)
```

#### Accessing Array Elements
```r
arr <- array(1:24, dim = c(2, 3, 4))

# Access a single element (specify all dimensions)
arr[1, 2, 3]  # Row 1, Column 2, Layer 3

# Access a slice (all elements along one dimension)
arr[1, , ]    # All elements from Row 1 (a 3×4 matrix)
arr[, 2, ]    # All elements from Column 2 (a 2×4 matrix)
arr[, , 3]    # All elements from Layer 3 (a 2×3 matrix)

# Access a subarray
arr[1:2, 2:3, 1:2]  # A 2×2×2 subarray

# Access with dimension names (if available)
named_arr <- array(1:24, dim = c(2, 3, 4),
                  dimnames = list(
                    c("Row1", "Row2"),
                    c("Col1", "Col2", "Col3"),
                    c("Layer1", "Layer2", "Layer3", "Layer4")
                  ))
named_arr["Row1", "Col2", "Layer3"]  # Element at specified position
```

#### Array Operations
```r
arr1 <- array(1:8, dim = c(2, 2, 2))
arr2 <- array(9:16, dim = c(2, 2, 2))

# Element-wise operations
arr1 + arr2  # Addition
arr1 * arr2  # Multiplication
arr1 / arr2  # Division

# Apply functions across dimensions
apply(arr1, c(1), sum)  # Sum across dimension 1 (rows)
apply(arr1, c(2), mean) # Mean across dimension 2 (columns)
apply(arr1, c(3), max)  # Max across dimension 3 (layers)
apply(arr1, c(2,3), sum) # Sum across dimensions 2 and 3

# Higher-dimensional apply variants
# - For 3D arrays, you can use apply() with different MARGIN values
# - For more complex operations, consider using plyr or purrr packages
```

#### Array Transformations
```r
arr <- array(1:24, dim = c(2, 3, 4))

# Reshape an array
dim(arr) <- c(6, 4)  # Reshape to a 6×4 matrix
dim(arr) <- c(4, 6)  # Reshape to a 4×6 matrix
dim(arr) <- c(2, 3, 2, 2)  # Reshape to a 4D array

# Convert to vector
vec <- as.vector(arr)  # Flattens to a vector

# Convert to matrix
mat <- matrix(arr, nrow = 6)  # Reshape to a matrix
```

#### Practical Examples
```r
# Example 1: 3D data (time series for multiple stations)
# Temperature data: 3 stations × 4 times × 2 years
temp_data <- array(
  c(20, 21, 19, 22, 23, 20, 18, 19, 20, 21, 22, 21,  # Year 1
    19, 20, 18, 21, 22, 19, 17, 18, 19, 20, 21, 20), # Year 2
  dim = c(3, 4, 2),
  dimnames = list(
    c("Station1", "Station2", "Station3"),
    c("Spring", "Summer", "Fall", "Winter"),
    c("Year1", "Year2")
  )
)

# Average temperature by station
apply(temp_data, 1, mean)

# Average temperature by season
apply(temp_data, 2, mean)

# Example 2: Color image representation
# A color image can be represented as a 3D array: height × width × 3 (RGB channels)
# This creates a tiny 5×5 image with red, green, and blue channels
tiny_image <- array(
  runif(75),  # Random values between 0 and 1
  dim = c(5, 5, 3)
)

# Extract the red channel
red_channel <- tiny_image[, , 1]
```

### Data Frames
- Table-like structures
- Columns can be different types
```r
df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  active = c(TRUE, FALSE, TRUE)
)
```

### Factors
- Categorical data with defined levels
```r
colors <- factor(c("red", "green", "blue", "red"))
levels(colors)  # "blue" "green" "red"
```

## Special Values

### NA
- Represents missing values
```r
x <- c(1, 2, NA, 4, 5)
is.na(x)  # FALSE FALSE TRUE FALSE FALSE
```

### NULL
- Represents an empty object
```r
y <- NULL
is.null(y)  # TRUE
```

### NaN
- "Not a Number" result
```r
0/0  # NaN
```

### Inf and -Inf
- Positive and negative infinity
```r
1/0   # Inf
-1/0  # -Inf
```

## Type Checking and Conversion

### Checking Types
```r
is.numeric(42)      # TRUE
is.character("abc") # TRUE
is.logical(TRUE)    # TRUE
```

### Converting Types
```r
as.numeric("123")   # 123
as.character(42)    # "42"
as.integer(4.9)     # 4 (truncated)
as.logical(0)       # FALSE
```

## Examining Objects

### Structure and Summary
```r
str(mtcars)      # Compact display of internal structure
summary(mtcars)  # Statistical summary
head(mtcars, 3)  # First few rows
```

### Type and Class
```r
typeof(mtcars)  # Internal storage mode
class(mtcars)   # Object class
```
