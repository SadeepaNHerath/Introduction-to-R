# R Variables: A Beginner's Guide

Variables are fundamental to any programming language. In R, variables store data that can be used and manipulated throughout your code. This guide covers everything a beginner needs to know about variables in R.

## Variable Naming Rules in R

When naming variables in R, follow these rules:

1. **Valid characters**: Variable names can contain:
   - Letters (a-z, A-Z)
   - Digits (0-9)
   - Periods (`.`)
   - Underscores (`_`)

2. **First character**: Variable names must start with a letter or a period. If starting with a period, it cannot be followed by a number.

3. **Case sensitivity**: R is case-sensitive, so `myVariable`, `myvariable`, and `MyVariable` are all different variables.

4. **No reserved words**: You cannot use R's reserved words like `if`, `else`, `for`, `function`, etc.

### Common Naming Conventions

R programmers use several naming styles:

- **camelCase**: First word lowercase, then capitalize first letter of subsequent words
  ```r
  myVariableName <- 10
  ```

- **snake_case**: Words separated by underscores (common in tidyverse packages)
  ```r
  my_variable_name <- 10
  ```

- **period.case**: Words separated by periods
  ```r
  my.variable.name <- 10
  ```

**Best Practice**: Choose one convention and stick to it for consistency. For modern R programming, `snake_case` is increasingly preferred.

## Assigning Variables in R

R offers multiple ways to assign values to variables:

### Assignment Operators

1. **Left assignment** `<-` (most common)
   ```r
   x <- 10
   ```

2. **Right assignment** `->` (less common)
   ```r
   10 -> x
   ```

3. **Equal sign** `=` (works, but not preferred for variable assignment)
   ```r
   x = 10
   ```

**Best Practice**: Use `<-` for variable assignment. Reserve `=` for function arguments.

### Assignment Examples

```r
# Assigning different data types
my_number <- 42           # Numeric
my_text <- "Hello world"  # Character
my_logical <- TRUE        # Logical
my_nothing <- NULL        # NULL value
```

## Variable Data Types in R

R is a dynamically typed language, meaning a variable can change its data type during execution.

### Basic Data Types

- **numeric**: Decimal values (double precision)
- **integer**: Whole numbers (add `L` suffix)
- **character**: Text strings
- **logical**: Boolean values (`TRUE` or `FALSE`)
- **complex**: Complex numbers with real and imaginary parts

### Checking Variable Types

There are multiple ways to check a variable's type:

```r
x <- 42

# Different ways to check type
class(x)     # Returns "numeric"
typeof(x)    # Returns "double"
mode(x)      # Returns "numeric"
str(x)       # Displays structure: num 42

# Testing specific types
is.numeric(x)   # TRUE
is.character(x) # FALSE
is.logical(x)   # FALSE
```

### Dynamic Typing Examples

Variables in R can change types:

```r
my_var <- 10       # Numeric
class(my_var)      # "numeric"

my_var <- "Hello"  # Changed to character
class(my_var)      # "character"

my_var <- TRUE     # Changed to logical
class(my_var)      # "logical"
```

### Type Conversion

Convert between types using `as.` functions:

```r
# Converting between types
as.character(123)   # "123"
as.numeric("456")   # 456
as.integer(3.14)    # 3 (truncates decimal)
as.logical(0)       # FALSE (0 is FALSE, non-zero is TRUE)
```

## Variables in RStudio

RStudio provides visual tools to manage and inspect variables.

### Environment Pane

- Located in the top-right corner by default
- Lists all variables in the current environment
- Shows variable names, values, and types
- Allows sorting and filtering variables

### Working with Variables in RStudio

1. **Viewing variables**: Click on a variable in the Environment pane to see its structure

2. **Environment tab options**:
   - List: Displays variables in a list format
   - Grid: Displays variables in a tabular format

3. **Importing/Exporting**: 
   - Use "Import Dataset" to create variables from external data
   - Save variables to disk with `save()` or `write.csv()`

4. **Environment history**:
   - RStudio maintains an environment history you can navigate

## Deleting Variables in R

When you no longer need a variable, you can remove it from memory.

### Removing Single Variables

```r
# Create a variable
my_var <- 42

# Remove the variable
rm(my_var)

# After removal, this would result in an error:
# print(my_var)
```

### Removing Multiple Variables

```r
# Create multiple variables
var1 <- 10
var2 <- 20
var3 <- 30

# Remove specific variables
rm(var1, var2)

# Remove variables matching a pattern
rm(list = ls(pattern = "var"))
```

### Clearing All Variables

```r
# Remove all variables in the current environment
rm(list = ls())
```

**Warning**: Be careful with `rm(list = ls())` as it removes all variables without confirmation.

## Variable Scoping in R

Variables exist within specific environments:

1. **Global Environment**: Variables created in the console or at script level
2. **Function Environment**: Variables created inside a function

```r
# Global variable
global_var <- 100

# Function with local variable
my_function <- function() {
  local_var <- 200
  print(paste("Inside function - global_var:", global_var))
  print(paste("Inside function - local_var:", local_var))
}

my_function()

# This works - global_var is in global environment
print(global_var)

# This would fail - local_var only exists inside the function
# print(local_var)
```

## Tips for Beginners

1. **Use descriptive names**: `age` is better than `a`, `student_score` is better than `ss`
2. **Be consistent**: Choose one naming convention and stick with it
3. **Check your environment**: Use `ls()` or RStudio's Environment pane to see what variables exist
4. **Clean up**: Remove variables you no longer need to free memory
5. **Pay attention to types**: Type mismatches can cause unexpected errors

## Handling Missing Values in R

R provides specific representations for missing or undefined data:

### NA (Not Available)

The `NA` value represents missing or undefined values in datasets:

```r
# Creating variables with missing values
x <- c(10, 20, NA, 30)
y <- c("a", "b", NA, "d")
```

### Types of NA

R has different types of NA values depending on the data type:

```r
NA           # Logical NA
NA_integer_  # Integer NA
NA_real_     # Numeric NA
NA_character_ # Character NA
```

### NULL vs NA

- `NULL` represents the absence of a value or object
- `NA` represents a missing value within an existing object

```r
# NULL example (no value)
a <- NULL

# NA example (missing value)
b <- NA
```

### Checking for Missing Values

```r
# Check for NA values
is.na(x)     # Returns TRUE only for NA values
anyNA(x)     # Returns TRUE if any NA values exist

# Check for NULL
is.null(a)   # Returns TRUE for NULL values
```

### Handling Missing Values in Calculations

Missing values can affect calculations:

```r
# NA propagates in calculations
sum(c(1, 2, NA, 4))        # Returns NA
mean(c(1, 2, NA, 4))       # Returns NA

# Use na.rm parameter to remove NA values
sum(c(1, 2, NA, 4), na.rm = TRUE)   # Returns 7
mean(c(1, 2, NA, 4), na.rm = TRUE)  # Returns 2.33...
```

### Replacing Missing Values

```r
# Replace NA with a specific value
x <- c(1, 2, NA, 4)
x[is.na(x)] <- 0           # Replace NA with 0

# Use ifelse for conditional replacement
y <- c(1, 2, NA, 4, NA, 6)
ifelse(is.na(y), 999, y)   # Replace NA with 999, keep others as is
```

---

Remember, good variable management is key to writing clean, efficient R code that's easy to understand and debug!
