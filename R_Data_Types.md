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
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE)
```

### Matrices
- Two-dimensional, homogeneous data structure
```r
my_matrix <- matrix(1:9, nrow = 3, ncol = 3)
```

### Arrays
- Multi-dimensional generalizations of matrices
```r
my_array <- array(1:24, dim = c(2, 3, 4))
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
