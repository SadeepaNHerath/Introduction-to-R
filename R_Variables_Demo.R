# R Variables Demo
# This script demonstrates the concepts from R_Variables_Guide.md

# Clear the environment to start fresh
rm(list = ls())

cat("========== VARIABLE NAMING CONVENTIONS ==========\n")

# camelCase naming
myVariableName <- 10
cat("camelCase variable value:", myVariableName, "\n")

# snake_case naming
my_variable_name <- 20
cat("snake_case variable value:", my_variable_name, "\n")

# period.case naming
my.variable.name <- 30
cat("period.case variable value:", my.variable.name, "\n")

# Variable names are case sensitive
myvar <- 40
MyVar <- 50
cat("myvar:", myvar, "| MyVar:", MyVar, "\n")

cat("\n========== VARIABLE ASSIGNMENT ==========\n")

# Different assignment operators
x <- 100        # Left assignment
cat("Left assignment (x <- 100):", x, "\n")

200 -> y        # Right assignment
cat("Right assignment (200 -> y):", y, "\n")

z = 300         # Equal sign assignment
cat("Equal sign assignment (z = 300):", z, "\n")

cat("\n========== VARIABLE DATA TYPES ==========\n")

# Assigning different data types
num_var <- 42                 # Numeric
int_var <- 42L                # Integer (note the L suffix)
char_var <- "Hello World"     # Character
logic_var <- TRUE             # Logical
complex_var <- 3 + 4i         # Complex
null_var <- NULL              # NULL

# Display the variables and their types
cat("num_var:", num_var, "- class:", class(num_var), "\n")
cat("int_var:", int_var, "- class:", class(int_var), "\n")
cat("char_var:", char_var, "- class:", class(char_var), "\n")
cat("logic_var:", logic_var, "- class:", class(logic_var), "\n")
cat("complex_var:", complex_var, "- class:", class(complex_var), "\n")
cat("null_var is NULL:", is.null(null_var), "\n")

cat("\n========== CHECKING VARIABLE TYPES ==========\n")

# Different ways to check types
cat("Different ways to check the type of num_var (42):\n")
cat("  class():", class(num_var), "\n")
cat("  typeof():", typeof(num_var), "\n") 
cat("  mode():", mode(num_var), "\n")
cat("  str():", "\n")
str(num_var)

# Type testing functions
cat("\nType testing functions for num_var (42):\n")
cat("  is.numeric():", is.numeric(num_var), "\n")
cat("  is.integer():", is.integer(num_var), "\n")
cat("  is.character():", is.character(num_var), "\n")
cat("  is.logical():", is.logical(num_var), "\n")

cat("\n========== DYNAMIC TYPING ==========\n")

# Demonstrating dynamic typing
dynamic_var <- 100
cat("Initial value and type:\n")
cat("  dynamic_var =", dynamic_var, "- class:", class(dynamic_var), "\n")

dynamic_var <- "Now I'm text"
cat("After changing to character:\n")
cat("  dynamic_var =", dynamic_var, "- class:", class(dynamic_var), "\n")

dynamic_var <- FALSE
cat("After changing to logical:\n")
cat("  dynamic_var =", dynamic_var, "- class:", class(dynamic_var), "\n")

cat("\n========== TYPE CONVERSION ==========\n")

# Type conversion examples
num_to_convert <- 123.45
text_to_convert <- "987.65"
logical_to_convert <- TRUE

cat("Original values:\n")
cat("  num_to_convert =", num_to_convert, "- class:", class(num_to_convert), "\n")
cat("  text_to_convert =", text_to_convert, "- class:", class(text_to_convert), "\n")
cat("  logical_to_convert =", logical_to_convert, "- class:", class(logical_to_convert), "\n")

cat("\nConverted values:\n")
cat("  as.character(num_to_convert) =", as.character(num_to_convert), 
    "- class:", class(as.character(num_to_convert)), "\n")
cat("  as.numeric(text_to_convert) =", as.numeric(text_to_convert),
    "- class:", class(as.numeric(text_to_convert)), "\n")
cat("  as.integer(num_to_convert) =", as.integer(num_to_convert),
    "- class:", class(as.integer(num_to_convert)), "\n")
cat("  as.numeric(logical_to_convert) =", as.numeric(logical_to_convert),
    "- class:", class(as.numeric(logical_to_convert)), "\n")

cat("\n========== DELETING VARIABLES ==========\n")

# Create some variables for deletion
temp_var1 <- "I will be deleted individually"
temp_var2 <- "I will be deleted too"
temp_var3 <- "I will remain"
pattern_var1 <- "I match a pattern"
pattern_var2 <- "I also match a pattern"

# List all variables
cat("Variables before deletion:", ls(), "\n")

# Remove a single variable
rm(temp_var1)
cat("After removing temp_var1:", ls(), "\n")

# Remove multiple variables
rm(temp_var2, pattern_var1)
cat("After removing temp_var2 and pattern_var1:", ls(), "\n")

# Remove by pattern
rm(list = ls(pattern = "pattern"))
cat("After removing variables matching 'pattern':", ls(), "\n")

cat("\n========== VARIABLE SCOPING ==========\n")

# Global variable
global_var <- "I am global"

# Function demonstrating variable scope
demonstrate_scope <- function() {
  local_var <- "I am local to the function"
  cat("Inside function - can access global_var:", global_var, "\n")
  cat("Inside function - can access local_var:", local_var, "\n")
  
  # Create a variable with the same name as a global variable
  global_var <- "I am a local variable that shadows the global one"
  cat("Inside function - modified 'global_var' locally:", global_var, "\n")
}

# Call the function
demonstrate_scope()

# Show that local_var is not accessible outside the function
cat("Outside function - can access global_var:", global_var, "\n")
cat("Outside function - trying to access local_var will cause an error (commented out)\n")
# Uncommenting the next line would cause an error:
# cat("local_var:", local_var)

cat("\n========== HANDLING MISSING VALUES ==========\n")

# Creating variables with missing values
vec_with_na <- c(10, 20, NA, 40, 50)
char_with_na <- c("a", "b", NA, "d")
df_with_na <- data.frame(
  id = 1:5,
  value1 = c(10, NA, 30, NA, 50),
  value2 = c("a", "b", NA, "d", "e")
)

cat("Vector with NA values:", vec_with_na, "\n")
cat("Character vector with NA:", char_with_na, "\n")
cat("Data frame with NA values:\n")
print(df_with_na)

# Different types of NA
cat("\nDifferent types of NA:\n")
cat("Default NA:", NA, "- class:", class(NA), "\n")
cat("Integer NA:", NA_integer_, "- class:", class(NA_integer_), "\n")
cat("Real NA:", NA_real_, "- class:", class(NA_real_), "\n")
cat("Character NA:", NA_character_, "- class:", class(NA_character_), "\n")

# NULL vs NA
null_var <- NULL
na_var <- NA
cat("\nNULL vs NA:\n")
cat("null_var is NULL:", is.null(null_var), "\n")
cat("na_var is NULL:", is.null(na_var), "\n")
cat("na_var is NA:", is.na(na_var), "\n")
cat("Length of null_var:", length(null_var), "\n")
cat("Length of na_var:", length(na_var), "\n")

# Checking for NA values
cat("\nChecking for NA values:\n")
cat("is.na() on vec_with_na:", is.na(vec_with_na), "\n")
cat("anyNA() on vec_with_na:", anyNA(vec_with_na), "\n")
cat("which() to find positions of NA:", which(is.na(vec_with_na)), "\n")
cat("sum() of is.na() to count NAs:", sum(is.na(vec_with_na)), "\n")

# Impact of NA on calculations
cat("\nImpact of NA on calculations:\n")
cat("sum(vec_with_na):", sum(vec_with_na), "\n")
cat("mean(vec_with_na):", mean(vec_with_na), "\n")

# Handling NA in calculations
cat("\nHandling NA in calculations:\n")
cat("sum(vec_with_na, na.rm = TRUE):", sum(vec_with_na, na.rm = TRUE), "\n")
cat("mean(vec_with_na, na.rm = TRUE):", mean(vec_with_na, na.rm = TRUE), "\n")

# Replacing NA values
vec_na_replaced <- vec_with_na
vec_na_replaced[is.na(vec_na_replaced)] <- 0
cat("\nReplacing NA values:\n")
cat("Original vector:", vec_with_na, "\n")
cat("After replacing NA with 0:", vec_na_replaced, "\n")

# Using ifelse for conditional replacement
vec_ifelse_replaced <- ifelse(is.na(vec_with_na), 999, vec_with_na)
cat("After using ifelse to replace NA with 999:", vec_ifelse_replaced, "\n")

# NA in data frames
cat("\nHandling NA in data frames:\n")
cat("Complete cases (rows without any NA):\n")
print(df_with_na[complete.cases(df_with_na), ])

# Function to replace NA in a data frame
df_replaced <- df_with_na
df_replaced$value1[is.na(df_replaced$value1)] <- 0
df_replaced$value2[is.na(df_replaced$value2)] <- "missing"
cat("\nData frame after replacing NA values:\n")
print(df_replaced)

cat("\n========== END OF DEMO ==========\n")
