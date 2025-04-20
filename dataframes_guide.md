# Data Frames in R: A Comprehensive Guide

Data frames are the most commonly used data structure in R for data analysis. They are tabular data objects with rows representing observations and columns representing variables. Think of them as similar to tables in databases or spreadsheets.

## Creating Data Frames

### From Scratch

```r
# Create a basic data frame
df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David"),
  age = c(25, 30, 35, 28),
  score = c(85, 92, 78, 88),
  stringsAsFactors = FALSE  # Prevents automatic conversion of strings to factors
)

# Create data frame with specific column types
df2 <- data.frame(
  id = 1:3,
  name = c("John", "Mary", "Steve"),
  active = c(TRUE, FALSE, TRUE),
  stringsAsFactors = FALSE
)

# From individual vectors
names <- c("Alice", "Bob", "Charlie")
ages <- c(25, 30, 35)
scores <- c(85, 92, 78)
df3 <- data.frame(name = names, age = ages, score = scores)
```

### From External Sources

```r
# From CSV file
df_csv <- read.csv("data.csv")

# From Excel (requires readxl package)
# library(readxl)
# df_excel <- read_excel("data.xlsx", sheet = "Sheet1")

# From database (requires DBI and appropriate driver)
# library(DBI)
# library(RSQLite)
# con <- dbConnect(SQLite(), "database.db")
# df_sql <- dbGetQuery(con, "SELECT * FROM table")
# dbDisconnect(con)
```

## Basic Information and Structure

```r
# Dimensions of the data frame
dim(df)      # Returns [rows, columns]

# Structure of the data frame
str(df)      # Shows structure with data types

# Summary of the data frame
summary(df)  # Statistical summary of each column

# Column names
names(df)    # Get column names
colnames(df) # Alternative to get column names

# Row names
rownames(df) # Get row names
```

## Accessing Rows and Columns

### Selecting Columns

```r
# By column name using $
df$name     # Returns the 'name' column as a vector

# By column name using [[]]
df[["age"]] # Returns the 'age' column as a vector

# By column index using []
df[, 1]     # Returns the first column as a vector
df[, 1, drop = FALSE]  # Returns the first column as a data frame

# Multiple columns
df[, c("name", "age")]  # Returns columns 'name' and 'age' as a data frame
df[, c(1, 3)]           # Returns first and third columns
```

### Selecting Rows

```r
# By row index
df[1, ]      # Returns the first row as a data frame

# Multiple rows
df[1:3, ]    # Returns rows 1-3
df[c(1, 4), ] # Returns rows 1 and 4
```

### Accessing Specific Cells

```r
# Row, column format
df[2, 3]     # Element in 2nd row, 3rd column

# Row, column name format
df[2, "score"] # Element in 2nd row, 'score' column
```

## Subsetting Data Frames

### Negative Subsetting (Excluding)

```r
# Exclude columns
df[, -1]               # Exclude the first column
df[, -c(1, 3)]         # Exclude the first and third columns
df[, !(names(df) %in% c("name", "age"))]  # Exclude by name

# Exclude rows
df[-1, ]               # Exclude the first row
df[-c(1, 3), ]         # Exclude rows 1 and 3
```

### Subsetting with Logical Conditions

```r
# Filter rows based on a condition
df[df$age > 30, ]      # Rows where age is greater than 30
df[df$name == "Alice", ] # Rows where name is Alice

# Multiple conditions
df[df$age > 25 & df$score >= 85, ]  # AND condition
df[df$age < 25 | df$score > 90, ]   # OR condition

# Subset rows and columns simultaneously
df[df$age > 30, c("name", "score")]  # Age > 30, only name and score columns
```

### Using subset() Function

```r
# Basic subsetting
subset(df, age > 30)  # Rows where age is greater than 30

# Subset with column selection
subset(df, age > 30, select = c(name, score))  # Only name and score columns
subset(df, age > 30, select = -age)           # All columns except age
```

## Sorting Data Frames

### Using order()

```r
# Sort by a single column
df[order(df$age), ]               # Sort by age (ascending)
df[order(df$age, decreasing = TRUE), ] # Sort by age (descending)

# Sort by multiple columns
df[order(df$score, df$age), ]     # Sort by score, then by age
df[order(df$score, -df$age), ]    # Sort by score (asc), then by age (desc)
```

### Using arrange() from dplyr

```r
# library(dplyr)
# arrange(df, age)                  # Sort by age (ascending)
# arrange(df, desc(age))            # Sort by age (descending)
# arrange(df, score, desc(age))     # Sort by score (asc), then by age (desc)
```

## Grouping Data Frames

### Using Base R

```r
# Aggregating data by group
aggregate(score ~ age, data = df, FUN = mean)  # Average score by age
aggregate(cbind(score, age) ~ name, data = df, FUN = mean) # Multiple aggregations
```

### Using dplyr

```r
# library(dplyr)
# Group by name and calculate summary statistics
# df %>%
#   group_by(name) %>%
#   summarize(
#     avg_score = mean(score),
#     max_score = max(score),
#     count = n()
#   )

# Filter after grouping
# df %>%
#   group_by(name) %>%
#   filter(score > mean(score))
```

## Joining Data Frames

### Using Base R

```r
# Prepare sample data frames
df1 <- data.frame(id = 1:3, name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(id = c(1, 2, 4), score = c(85, 92, 77))

# Inner join (only matching rows)
merge(df1, df2, by = "id")

# Left join (all rows from df1)
merge(df1, df2, by = "id", all.x = TRUE)

# Right join (all rows from df2)
merge(df1, df2, by = "id", all.y = TRUE)

# Full join (all rows from both)
merge(df1, df2, by = "id", all = TRUE)

# Join with different key names
df3 <- data.frame(person_id = 1:3, score = c(85, 92, 78))
merge(df1, df3, by.x = "id", by.y = "person_id")
```

### Using dplyr

```r
# library(dplyr)

# Inner join
# inner_join(df1, df2, by = "id")

# Left join
# left_join(df1, df2, by = "id")

# Right join
# right_join(df1, df2, by = "id")

# Full join
# full_join(df1, df2, by = "id")

# Join with different key names
# inner_join(df1, df3, by = c("id" = "person_id"))
```

## Set Operations on Data Frames

### Using Base R

```r
# Create sample data frames with same column structure
df_a <- data.frame(id = 1:4, name = c("Alice", "Bob", "Charlie", "David"))
df_b <- data.frame(id = 3:6, name = c("Charlie", "David", "Eve", "Frank"))

# Union (combining rows, removing duplicates)
union_df <- unique(rbind(df_a, df_b))

# Intersection (common rows)
intersect_rows <- merge(df_a, df_b, by = c("id", "name"))

# Difference (rows in df_a not in df_b)
diff_rows <- df_a[!duplicated(rbind(df_a, df_b))[1:nrow(df_a)], ]
```

### Using dplyr

```r
# library(dplyr)

# Union
# union(df_a, df_b)

# Intersection
# intersect(df_a, df_b)

# Difference
# setdiff(df_a, df_b)
```

## Working with Packages

### dplyr: A Grammar of Data Manipulation

dplyr provides a consistent set of functions for data manipulation:

```r
# library(dplyr)

# Basic operations
# select(df, name, age)              # Select columns
# filter(df, age > 30)               # Filter rows
# mutate(df, age_squared = age^2)    # Add new columns
# arrange(df, desc(age))             # Sort rows
# summarize(df, avg_age = mean(age)) # Summarize data

# Piping operations
# df %>%
#   filter(age > 25) %>%
#   select(name, score) %>%
#   arrange(desc(score))
```

### sqldf: SQL for Data Frames

sqldf allows SQL queries on R data frames:

```r
# library(sqldf)
# query <- "SELECT name, score FROM df WHERE age > 30 ORDER BY score DESC"
# result <- sqldf(query)
```

### data.table: Enhanced Data Frames

data.table provides an enhanced version of data frames with faster operations:

```r
# library(data.table)
# dt <- as.data.table(df)
# dt[age > 30, .(name, score)]  # Query syntax: DT[i, j, by]
# dt[, mean(score), by = name]  # Aggregation by group
```

### tidyr: Tidy Data

tidyr helps reshape data between wide and long formats:

```r
# library(tidyr)
# Wide to long format
# df_wide <- data.frame(
#   name = c("Alice", "Bob", "Charlie"),
#   math = c(90, 80, 70),
#   science = c(85, 95, 80)
# )
# df_long <- pivot_longer(df_wide, cols = c(math, science), 
#                       names_to = "subject", values_to = "score")

# Long to wide format
# pivot_wider(df_long, names_from = "subject", values_from = "score")
```

## Advanced Topics

### Adding and Modifying Columns

```r
# Add new column
df$graduated <- c(TRUE, TRUE, FALSE, TRUE)

# Add multiple columns
df <- transform(df, 
                age_months = age * 12,
                score_normalized = score / 100)

# Modify existing column
df$age <- df$age + 1

# Conditional modification
df$age[df$name == "Alice"] <- 26
```

### Applying Functions to Data Frames

```r
# Apply function to each column
lapply(df, mean)  # Returns a list

# Apply function to each column, returns a vector
sapply(df, class)

# Apply function to each row
apply(df[, c("age", "score")], 1, sum)  # Sum age and score for each person

# Apply function by group
tapply(df$score, df$age, mean)  # Average score for each age group
```

### Handling Missing Data

```r
# Check for missing values
anyNA(df)
colSums(is.na(df))  # Count NAs in each column

# Remove rows with any NA
df_clean <- na.omit(df)

# Replace NAs with specific values
df$score[is.na(df$score)] <- 0  # Replace NA scores with 0

# Mean imputation
df$age[is.na(df$age)] <- mean(df$age, na.rm = TRUE)
```

### Working with Row Names

```r
# Set row names
rownames(df) <- c("student1", "student2", "student3", "student4")

# Reset row names to default
rownames(df) <- NULL

# Convert row names to a column
df$id <- rownames(df)
rownames(df) <- NULL
```

### Writing Data Frames to Files

```r
# Write to CSV
write.csv(df, "output.csv", row.names = FALSE)

# Write to RDS (R binary format)
saveRDS(df, "data.rds")

# Write to Excel (requires writexl)
# library(writexl)
# write_xlsx(df, "output.xlsx")
```

## Performance Tips

1. Pre-allocate data frames instead of growing them incrementally
2. Use `data.table` or `dplyr` for large data operations
3. Avoid repeated `$` access in loops
4. Use vectorized operations when possible
5. Consider using a database backend for very large datasets
