# R Time-Savers: A Beginner's Guide to Efficiency

This guide covers helpful functions, techniques, and shortcuts that can save you time when working with R. These tools will make your coding more efficient and streamline your data analysis workflow.

## Data Manipulation Time-Savers

### cut() - Create Categories from Continuous Variables

The `cut()` function divides continuous variables into discrete categories or bins. This is extremely useful for creating groups like age ranges, income brackets, or performance categories.

```r
# Syntax: cut(x, breaks, labels, include.lowest, right, ...)
# x: numeric vector to be categorized
# breaks: numeric vector of break points or number of intervals
# labels: labels for the categories created

# Example with explicit breaks
ages <- c(15, 22, 37, 42, 57, 63, 85)
age_groups <- cut(ages, 
                  breaks = c(0, 18, 35, 65, 100), 
                  labels = c("Child", "Young Adult", "Middle-aged", "Senior"))
# Result: Child, Young Adult, Young Adult, Middle-aged, Middle-aged, Senior, Senior

# Example with number of equal interval breaks
scores <- c(45, 63, 72, 85, 92)
grade_groups <- cut(scores, 
                    breaks = 5,  # Create 5 equal-width intervals
                    labels = c("F", "D", "C", "B", "A"))
```

Tips for using `cut()`:
- Use `include.lowest = TRUE` to include the lowest value in the first interval
- Use `right = FALSE` to make intervals closed on the left (default is right-closed)
- If you omit `labels`, the function will create interval notation like "(0,18]"

### attach() - Access Data Frame Columns Directly

The `attach()` function adds a data frame to the search path, allowing you to access columns directly by name without using the `$` operator.

```r
# Create a data frame
df <- data.frame(name = c("Alice", "Bob", "Charlie"),
                age = c(25, 30, 35),
                score = c(88, 92, 79))

# Without attach
mean(df$age)
df$age[df$score > 80]

# With attach
attach(df)
mean(age)
age[score > 80]
detach(df)  # Always detach when done
```

**Important cautions about `attach()`**:
- Can create name conflicts with existing variables
- Changes to the data frame after `attach()` are not reflected in the attached copy
- Modern R programmers often avoid `attach()` due to these issues
- Always use `detach()` when finished with the data frame
- Consider alternatives like `with()` or `data.table`

### with() - A Safer Alternative to attach()

The `with()` function evaluates expressions within the context of a data frame without attaching it.

```r
# Using with() for cleaner code
with(df, {
  mean_age <- mean(age)
  high_scorers <- name[score > 90]
  list(mean_age = mean_age, high_scorers = high_scorers)
})
```

### subset() - Quick Data Filtering

The `subset()` function provides a cleaner way to filter data frames.

```r
# Instead of df[df$age > 30 & df$score > 80, ]
subset(df, age > 30 & score > 80)

# Select specific columns while filtering
subset(df, age > 30, select = c(name, score))

# Exclude columns
subset(df, age > 30, select = -age)
```

### transform() - Quick Column Creation or Modification

The `transform()` function lets you create or modify multiple columns at once.

```r
# Add multiple columns in one step
transform(df,
         age_months = age * 12,
         score_percent = score / 100,
         pass = score >= 70)
```

## Column and Row Operations

### rbind() and cbind() - Combine Data by Rows or Columns

```r
# Combine data frames by rows (must have same column names)
df1 <- data.frame(id = 1:3, value = c("a", "b", "c"))
df2 <- data.frame(id = 4:5, value = c("d", "e"))
combined <- rbind(df1, df2)

# Combine by columns (must have same number of rows)
df3 <- data.frame(category = c("X", "Y", "Z", "W", "V"))
all_data <- cbind(combined, df3)
```

### merge() - Join Data Frames Efficiently

```r
# Merge data frames on a key column
customers <- data.frame(
  id = 1:3,
  name = c("Alice", "Bob", "Charlie")
)
orders <- data.frame(
  customer_id = c(2, 1, 3, 1),
  amount = c(150, 200, 320, 175)
)
# Join customers with their orders
customer_orders <- merge(customers, orders, by.x = "id", by.y = "customer_id")
```

### unique() and duplicated() - Handle Duplicate Values

```r
# Find unique values
unique(c(1, 2, 2, 3, 4, 4, 5))  # Returns 1 2 3 4 5

# Identify duplicate rows
duplicated(df)  # Returns logical vector

# Remove duplicate rows
df_unique <- df[!duplicated(df), ]
```

## Value Testing and Replacement

### %in% - Membership Testing

The `%in%` operator checks if values are present in another vector.

```r
# Check if values exist in a set
fruits <- c("apple", "banana", "cherry")
"banana" %in% fruits  # TRUE
c("banana", "grape") %in% fruits  # TRUE FALSE

# Filter data by a list of values
subset(df, name %in% c("Alice", "Charlie"))
```

### ifelse() - Vectorized Conditional Values

The `ifelse()` function evaluates conditions element-wise and returns values based on TRUE/FALSE results.

```r
# Create conditional values
ifelse(df$score > 80, "Pass", "Fail")

# Can be nested
ifelse(df$score >= 90, "A", 
       ifelse(df$score >= 80, "B",
              ifelse(df$score >= 70, "C", "F")))
```

### na.omit() - Remove Missing Values

```r
# Remove rows with any NA values
clean_data <- na.omit(df)
```

## Statistical Shortcuts

### summary() - Quick Data Overview

The `summary()` function provides a statistical summary of data.

```r
summary(df)
summary(lm(score ~ age, data = df))  # Works on models too
```

### table() and prop.table() - Quick Frequency Tables

```r
# Frequency table
fruit_counts <- table(c("apple", "banana", "apple", "cherry", "apple"))

# Proportions
prop.table(fruit_counts)  # Convert counts to proportions

# Cross-tabulation
gender <- c("M", "F", "M", "F", "M")
location <- c("Urban", "Rural", "Urban", "Urban", "Rural")
cross_tab <- table(gender, location)
```

### tapply() - Apply Function Over Subsets

```r
# Apply a function to each subset defined by a factor
tapply(df$score, df$name, mean)  # Mean score for each person
```

## Character String Time-Savers

### paste() and paste0() - Combine Strings

```r
# Combine strings with separator
paste("Hello", "World")  # "Hello World"
paste("ID", 1:5, sep = "-")  # "ID-1" "ID-2" "ID-3" "ID-4" "ID-5"

# Combine without separator
paste0("ID", 1:5)  # "ID1" "ID2" "ID3" "ID4" "ID5"

# Collapse a vector into one string
paste(c("apple", "banana", "cherry"), collapse = ", ")  # "apple, banana, cherry"
```

### grep() and grepl() - Pattern Matching

```r
# Find elements matching a pattern
fruits <- c("apple", "banana", "pear", "pineapple")
grep("p", fruits)  # Returns indices: 1 3 4 (apple, pear, pineapple)
grep("p", fruits, value = TRUE)  # Returns values: "apple" "pear" "pineapple"

# Logical vector of matches
grepl("p", fruits)  # Returns TRUE FALSE TRUE TRUE
```

## Data Structure Conversions

### as.type() Functions - Convert Between Types

```r
# Convert between data types
as.numeric(c("1", "2", "3"))  # Convert strings to numbers
as.character(1:5)  # Convert numbers to strings
as.factor(c("low", "medium", "high"))  # Create a factor
as.data.frame(matrix(1:6, nrow = 2))  # Convert matrix to data frame
as.list(1:5)  # Convert vector to list
```

## RStudio Time-Savers

### Keyboard Shortcuts

- **Ctrl+Enter** / **Cmd+Enter**: Run current line/selection
- **Ctrl+Shift+Enter** / **Cmd+Shift+Enter**: Run current script
- **Tab**: Auto-complete
- **Ctrl+Shift+C** / **Cmd+Shift+C**: Comment/uncomment lines
- **Alt+Shift+-** / **Option+Shift+-**: Insert assignment operator (`<-`)
- **Ctrl+Shift+M** / **Cmd+Shift+M**: Insert pipe operator (`%>%`) if installed

### Code Sections

Create foldable sections in your code with comments ending in at least four dashes:

```r
# Data Preparation ----
# This creates a foldable section

# Analysis ----
# Another section
```

## File and Environment Management

### save() and load() - Save and Reload R Objects

```r
# Save specific objects
save(df, file = "my_dataframe.RData")

# Load saved objects
load("my_dataframe.RData")

# Save entire workspace
save.image("workspace.RData")
```

### saveRDS() and readRDS() - Save and Load Single Objects

```r
# Save a single object
saveRDS(df, "data.rds")

# Read the object (with control over the variable name)
new_df <- readRDS("data.rds")
```

## Formula Interface

Many R functions accept a formula interface using the `~` operator:

```r
# Linear model with formula
lm(score ~ age + name, data = df)

# Plotting with formula
plot(score ~ age, data = df)

# Aggregation with formula
aggregate(score ~ name, data = df, FUN = mean)
```

## Creating Simple Functions

```r
# Create a simple function to calculate percent change
percent_change <- function(old, new) {
  return((new - old) / old * 100)
}

# Use the function
percent_change(100, 120)  # Returns 20
```

## Conclusion

These time-savers can significantly improve your coding efficiency in R. As you become more comfortable with these tools, your data analysis workflow will become more streamlined and productive. Remember that the best way to learn is by practice, so try incorporating these shortcuts into your everyday R coding.
