#========================================================================
# R DATA TYPES COMPREHENSIVE DEMONSTRATION
# This script demonstrates all the data types and concepts from R_Data_Types.md
#========================================================================

#------------------------------------------------------------------------
# 1. BASIC DATA TYPES
#------------------------------------------------------------------------

# Clear workspace
rm(list = ls())

cat("\n=== BASIC DATA TYPES ===\n")

# Numeric
num1 <- 42.5
cat("Numeric:", num1, "- class:", class(num1), "\n")

# Integer
int1 <- 42L  # L suffix creates an integer
cat("Integer:", int1, "- class:", class(int1), "\n")

# Character
char1 <- "Data Science"
char2 <- 'R Programming'  # Single quotes work too
cat("Character:", char1, "- class:", class(char1), "\n")

# Logical
log1 <- TRUE
log2 <- FALSE
cat("Logical:", log1, "- class:", class(log1), "\n")

# Complex
comp1 <- 3 + 4i
cat("Complex:", comp1, "- class:", class(comp1), "\n")
cat("  Real part:", Re(comp1), "Imaginary part:", Im(comp1), "\n")
cat("  Modulus:", Mod(comp1), "Argument (radians):", Arg(comp1), "\n")
cat("  Complex conjugate:", Conj(comp1), "\n")

# Raw
raw1 <- charToRaw("Hello")
cat("Raw:", raw1, "- class:", class(raw1), "\n")
cat("  Convert back to character:", rawToChar(raw1), "\n")

# Assignment operators
x <- 10       # Standard left assignment
y = 15        # Equal sign assignment (works, but <- is preferred in R)
20 -> z       # Right assignment
cat("Assignment operators demo:", x, y, z, "\n")

#------------------------------------------------------------------------
# 2. DATE AND TIME DATA TYPES
#------------------------------------------------------------------------

cat("\n=== DATE AND TIME DATA TYPES ===\n")

# Current date and time
today <- Sys.Date()
now <- Sys.time()
cat("Today's date:", today, "- class:", class(today), "\n")
cat("Current time:", now, "- class:", class(now), "\n")

# Create dates from strings
date1 <- as.Date("2023-05-15")
date2 <- as.Date("05/15/2023", format = "%m/%d/%Y")
cat("Date from ISO format:", date1, "\n")
cat("Date from US format:", date2, "\n")

# Date arithmetic
cat("Difference between dates (days):", date1 - date2, "\n")
cat("Date + 30 days:", date1 + 30, "\n")

# POSIXct and POSIXlt
datetime1 <- as.POSIXct("2023-05-15 14:30:00")
cat("POSIXct datetime:", datetime1, "- class:", class(datetime1), "\n")

datetime2 <- as.POSIXlt(datetime1)
cat("POSIXlt datetime components:\n")
cat("  Year:", datetime2$year + 1900, "\n")
cat("  Month:", datetime2$mon + 1, "\n")
cat("  Day:", datetime2$mday, "\n")
cat("  Hour:", datetime2$hour, "\n")

# Time zones
datetime_ny <- as.POSIXct("2023-05-15 14:30:00", tz = "America/New_York")
datetime_tokyo <- as.POSIXct("2023-05-15 14:30:00", tz = "Asia/Tokyo")
cat("Same time in different time zones:\n")
cat("  New York:", datetime_ny, "\n")
cat("  Tokyo:", datetime_tokyo, "\n")

# Formatting dates
cat("Formatted date:", format(Sys.Date(), "%A, %B %d, %Y"), "\n")

# If lubridate is installed, uncomment these lines
# if(require(lubridate)) {
#   cat("\n=== LUBRIDATE EXAMPLES ===\n")
#   cat("ymd example:", ymd("2023-05-15"), "\n")
#   cat("mdy example:", mdy("05/15/2023"), "\n")
#   cat("ymd_hms example:", ymd_hms("2023-05-15 14:30:45"), "\n")
#   cat("Weekday extraction:", wday(today, label = TRUE), "\n")
# }

#------------------------------------------------------------------------
# 3. STATISTICAL DATA CLASSIFICATIONS
#------------------------------------------------------------------------

cat("\n=== STATISTICAL DATA CLASSIFICATIONS ===\n")

# Qualitative (Categorical) Data
cat("Qualitative (Categorical) Data Examples:\n")

# Nominal (categories with no inherent order)
blood_types <- factor(c("A", "B", "AB", "O", "A"))
cat("Nominal (blood types):", blood_types, "\n")
cat("  Levels:", levels(blood_types), "\n")

# Ordinal (categories with meaningful order)
education <- factor(
  c("High School", "Bachelor's", "Master's", "PhD"),
  levels = c("High School", "Bachelor's", "Master's", "PhD"),
  ordered = TRUE
)
cat("Ordinal (education):", education, "\n")
cat("  Is High School < PhD?", education[1] < education[4], "\n")

# Quantitative (Numerical) Data
cat("\nQuantitative (Numerical) Data Examples:\n")

# Discrete (countable values)
children <- c(0L, 1L, 2L, 3L)
cat("Discrete (number of children):", children, "\n")

# Continuous (can take any value within a range)
temperatures <- c(98.6, 97.5, 99.1, 101.2)
cat("Continuous (body temperatures):", temperatures, "\n")

# Data frame with mixed data types
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
cat("\nMixed data types in a data frame:\n")
print(survey_data)
cat("\nMean age by income group:\n")
print(aggregate(age ~ income_group, data = survey_data, mean))

#------------------------------------------------------------------------
# 4. DATA STRUCTURES
#------------------------------------------------------------------------

cat("\n=== DATA STRUCTURES ===\n")

# Vectors
numeric_vector <- c(1, 2, 3, 4, 5)
character_vector <- c("a", "b", "c")
logical_vector <- c(TRUE, FALSE, TRUE, TRUE)

cat("Vectors examples:\n")
cat("  Numeric vector:", numeric_vector, "\n")
cat("  Character vector:", character_vector, "\n")
cat("  Logical vector:", logical_vector, "\n")

# Vector operations
cat("\nVector operations:\n")
cat("  numeric_vector + 10:", numeric_vector + 10, "\n")
cat("  numeric_vector * 2:", numeric_vector * 2, "\n")
cat("  numeric_vector[2]:", numeric_vector[2], "\n")
cat("  numeric_vector[2:4]:", numeric_vector[2:4], "\n")
cat("  numeric_vector[logical_vector]:", numeric_vector[c(TRUE, FALSE, TRUE, FALSE, TRUE)], "\n")

# Lists
my_list <- list(
  numbers = 1:5,
  text = "hello",
  flag = TRUE,
  nested = list(a = 1, b = 2)
)
cat("\nList example:\n")
print(str(my_list))
cat("  Accessing list elements:\n")
cat("    my_list$numbers:", my_list$numbers, "\n")
cat("    my_list[[2]]:", my_list[[2]], "\n")
cat("    my_list$nested$a:", my_list$nested$a, "\n")

# Matrices
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)
cat("\nMatrix example:\n")
print(my_matrix)
cat("  Matrix operations:\n")
cat("    Transpose:\n")
print(t(my_matrix))
cat("    Matrix multiplication:\n")
print(my_matrix %*% my_matrix)
cat("    Element-wise multiplication:\n")
print(my_matrix * my_matrix)
cat("    Accessing elements - my_matrix[2, 3]:", my_matrix[2, 3], "\n")

# Arrays
my_array <- array(1:24, dim = c(2, 3, 4))
cat("\nArray example (2x3x4):\n")
print(my_array)
cat("  Accessing array elements - my_array[1, 2, 3]:", my_array[1, 2, 3], "\n")

# Data Frames
df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  active = c(TRUE, FALSE, TRUE)
)
cat("\nData Frame example:\n")
print(df)
cat("  Accessing data frame elements:\n")
cat("    df$name:", df$name, "\n")
cat("    df[2, 3]:", df[2, 3], "\n")
cat("    df[df$active, ]:\n")
print(df[df$active, ])

# Factors
colors <- factor(c("red", "green", "blue", "red"))
cat("\nFactor example:\n")
print(colors)
cat("  Levels:", levels(colors), "\n")
cat("  Convert to numeric:", as.numeric(colors), "\n")

# Additional: Tibbles (if tidyverse is available)
# if(require(tibble)) {
#   cat("\nTibble example (modern data frame):\n")
#   tb <- tibble(
#     name = c("Alice", "Bob", "Charlie"),
#     age = c(25, 30, 35),
#     active = c(TRUE, FALSE, TRUE)
#   )
#   print(tb)
# }

#------------------------------------------------------------------------
# 5. SPECIAL VALUES
#------------------------------------------------------------------------

cat("\n=== SPECIAL VALUES ===\n")

# NA - Missing values
vec_with_na <- c(1, 2, NA, 4, 5)
cat("Vector with NA:", vec_with_na, "\n")
cat("  is.na() result:", is.na(vec_with_na), "\n")
cat("  Sum ignoring NA:", sum(vec_with_na, na.rm = TRUE), "\n")
cat("  Complete cases:", vec_with_na[complete.cases(vec_with_na)], "\n")

# NULL - Empty object
null_value <- NULL
cat("NULL example - is.null(null_value):", is.null(null_value), "\n")
cat("  Length of NULL:", length(null_value), "\n")
cat("  c(1, 2, NULL, 4):", c(1, 2, NULL, 4), "\n")

# NaN - Not a Number
nan_value <- 0/0
cat("NaN example:", nan_value, "\n")
cat("  is.nan():", is.nan(nan_value), "\n")
cat("  is.na() on NaN:", is.na(nan_value), "\n")

# Inf and -Inf - Infinity
inf_value <- 1/0
neg_inf_value <- -1/0
cat("Infinity examples:\n")
cat("  Inf:", inf_value, "  -Inf:", neg_inf_value, "\n")
cat("  is.infinite():", is.infinite(inf_value), is.infinite(neg_inf_value), "\n")
cat("  is.finite():", is.finite(inf_value), "\n")

#------------------------------------------------------------------------
# 6. TYPE CHECKING AND CONVERSION
#------------------------------------------------------------------------

cat("\n=== TYPE CHECKING AND CONVERSION ===\n")

# Type checking functions
cat("Type checking examples:\n")
cat("  is.numeric(42):", is.numeric(42), "\n")
cat("  is.character('abc'):", is.character("abc"), "\n")
cat("  is.logical(TRUE):", is.logical(TRUE), "\n")
cat("  is.integer(42):", is.integer(42), "\n")
cat("  is.integer(42L):", is.integer(42L), "\n")

# Type conversion functions
cat("\nType conversion examples:\n")
cat("  as.numeric('123'):", as.numeric("123"), "\n")
cat("  as.character(42):", as.character(42), "\n")
cat("  as.integer(4.9):", as.integer(4.9), "\n")
cat("  as.logical(0):", as.logical(0), "\n")
cat("  as.logical(1):", as.logical(1), "\n")

# Type coercion (automatic conversion)
cat("\nType coercion examples:\n")
cat("  1 + TRUE:", 1 + TRUE, "\n")
cat("  c(1, 2) + c(TRUE, FALSE):", c(1, 2) + c(TRUE, FALSE), "\n")
cat("  c(1, '2'):", c(1, "2"), "- class:", class(c(1, "2")), "\n")
cat("  c(TRUE, 'text'):", c(TRUE, "text"), "- class:", class(c(TRUE, "text")), "\n")
cat("  c(1L, 2.5):", c(1L, 2.5), "- class:", class(c(1L, 2.5)), "\n")

#------------------------------------------------------------------------
# 7. EXAMINING OBJECTS
#------------------------------------------------------------------------

cat("\n=== EXAMINING OBJECTS ===\n")

# Create a sample dataframe for examination
cars_df <- mtcars[1:5, 1:4]

cat("Examining 'cars_df':\n")
cat("\nstr() - Structure:\n")
str(cars_df)

cat("\nsummary() - Statistical summary:\n")
print(summary(cars_df))

cat("\nhead() - First few rows:\n")
print(head(cars_df, 2))

cat("\nnames() - Column names:", names(cars_df), "\n")

cat("\ntypeof() - Internal storage mode:", typeof(cars_df), "\n")
cat("class() - Object class:", class(cars_df), "\n")

cat("\ndim() - Dimensions:", dim(cars_df), "\n")
cat("nrow() - Number of rows:", nrow(cars_df), "\n")
cat("ncol() - Number of columns:", ncol(cars_df), "\n")

#------------------------------------------------------------------------
# 8. ADDITIONAL IMPORTANT CONCEPTS
#------------------------------------------------------------------------

cat("\n=== ADDITIONAL IMPORTANT CONCEPTS ===\n")

# S3 vs S4 objects (R's object systems)
cat("S3 vs S4 Object Systems:\n")

# S3 class example
employee <- list(name = "John", age = 30, department = "IT")
class(employee) <- "employee"
print_employee <- function(x) {
  cat("Employee:", x$name, "\n")
  cat("Age:", x$age, "\n")
  cat("Department:", x$department, "\n")
}
# Register S3 method
print.employee <- print_employee
cat("  S3 employee object class:", class(employee), "\n")

# S4 class example if methods package is available
# if(require(methods)) {
#   setClass(
#     "Employee",
#     slots = c(
#       name = "character",
#       age = "numeric",
#       department = "character"
#     )
#   )
#   john <- new("Employee", name = "John", age = 30, department = "IT")
#   cat("  S4 Employee object class:", class(john), "\n")
# }

# Environment example
my_env <- new.env()
my_env$x <- 100
my_env$y <- 200
cat("\nEnvironment example:\n")
cat("  Variables in environment:", ls(my_env), "\n")
cat("  Value of my_env$x:", my_env$x, "\n")

# Advanced coercion rules
cat("\nAdvanced type coercion hierarchy:\n")
cat("  logical < integer < numeric < complex < character\n")
cat("  Example mixed vector c(TRUE, 1L, 2.5, 3+2i, 'text'):\n")
mixed <- c(TRUE, 1L, 2.5, 3+2i, "text")
cat("  Class:", class(mixed), "\n")

# Working with missing data
df_with_na <- data.frame(
  id = 1:5,
  x = c(1, NA, 3, NA, 5),
  y = c(NA, 2, 3, 4, 5)
)
cat("\nWorking with missing data:\n")
print(df_with_na)
cat("  complete.cases():\n")
print(df_with_na[complete.cases(df_with_na), ])
cat("  na.omit():\n")
print(na.omit(df_with_na))

cat("\n=== END OF DEMONSTRATION ===\n")
