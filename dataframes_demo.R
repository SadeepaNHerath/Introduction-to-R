# Data Frames in R - Comprehensive Demo
# This script demonstrates the concepts from the dataframes_guide.md

# ---- Creating Data Frames ----
cat("==== CREATING DATA FRAMES ====\n\n")

# Create a basic data frame
df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David"),
  age = c(25, 30, 35, 28),
  score = c(85, 92, 78, 88),
  stringsAsFactors = FALSE
)

cat("Basic data frame:\n")
print(df)
cat("\n")

# Create data frame with different data types
df2 <- data.frame(
  id = 1:3,
  name = c("John", "Mary", "Steve"),
  active = c(TRUE, FALSE, TRUE),
  stringsAsFactors = FALSE
)

cat("Data frame with different data types:\n")
print(df2)
cat("\n")

# ---- Basic Information and Structure ----
cat("==== BASIC INFORMATION AND STRUCTURE ====\n\n")

cat("Dimensions of df (rows, columns):\n")
print(dim(df))
cat("\n")

cat("Structure of df:\n")
str(df)
cat("\n")

cat("Summary of df:\n")
print(summary(df))
cat("\n")

cat("Column names of df:\n")
print(names(df))
cat("\n")

# ---- Accessing Rows and Columns ----
cat("==== ACCESSING ROWS AND COLUMNS ====\n\n")

# Selecting columns
cat("Selecting the 'name' column using $:\n")
print(df$name)
cat("\n")

cat("Selecting the 'age' column using [[]]:\n")
print(df[["age"]])
cat("\n")

cat("Selecting the first column using index:\n")
print(df[, 1])
cat("\n")

cat("Selecting the first column as a data frame (drop=FALSE):\n")
print(df[, 1, drop = FALSE])
cat("\n")

cat("Selecting multiple columns by name:\n")
print(df[, c("name", "age")])
cat("\n")

# Selecting rows
cat("Selecting the first row:\n")
print(df[1, ])
cat("\n")

cat("Selecting multiple rows (1-3):\n")
print(df[1:3, ])
cat("\n")

# Accessing specific cells
cat("Accessing element at row 2, column 3:\n")
print(df[2, 3])
cat("\n")

cat("Accessing element at row 2, column 'score':\n")
print(df[2, "score"])
cat("\n")

# ---- Subsetting Data Frames ----
cat("==== SUBSETTING DATA FRAMES ====\n\n")

# Negative subsetting
cat("Excluding first column:\n")
print(df[, -1])
cat("\n")

cat("Excluding first and third columns:\n")
print(df[, -c(1, 3)])
cat("\n")

cat("Excluding columns by name (name and age):\n")
print(df[, !(names(df) %in% c("name", "age"))])
cat("\n")

cat("Excluding first row:\n")
print(df[-1, ])
cat("\n")

# Subsetting with logical conditions
cat("Rows where age > 30:\n")
print(df[df$age > 30, ])
cat("\n")

cat("Rows where name is 'Alice':\n")
print(df[df$name == "Alice", ])
cat("\n")

cat("Rows where age > 25 AND score >= 85:\n")
print(df[df$age > 25 & df$score >= 85, ])
cat("\n")

cat("Rows where age > 30, showing only name and score columns:\n")
print(df[df$age > 30, c("name", "score")])
cat("\n")

# Using subset() function
cat("Using subset() for age > 30:\n")
print(subset(df, age > 30))
cat("\n")

cat("Using subset() for age > 30 with selected columns:\n")
print(subset(df, age > 30, select = c(name, score)))
cat("\n")

# ---- Sorting Data Frames ----
cat("==== SORTING DATA FRAMES ====\n\n")

cat("Sorting by age (ascending):\n")
print(df[order(df$age), ])
cat("\n")

cat("Sorting by age (descending):\n")
print(df[order(df$age, decreasing = TRUE), ])
cat("\n")

cat("Sorting by score (ascending), then by age (descending):\n")
print(df[order(df$score, -df$age), ])
cat("\n")

# ---- Grouping Data Frames ----
cat("==== GROUPING DATA FRAMES ====\n\n")

# Create a data frame with repeated groups
df_groups <- data.frame(
  department = rep(c("IT", "HR", "Sales"), each = 3),
  employee = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Ian"),
  salary = c(75000, 65000, 70000, 55000, 60000, 52000, 80000, 72000, 68000),
  years = c(5, 3, 4, 7, 2, 1, 10, 6, 4)
)

cat("Data frame with groups:\n")
print(df_groups)
cat("\n")

cat("Average salary by department:\n")
print(aggregate(salary ~ department, data = df_groups, FUN = mean))
cat("\n")

cat("Multiple aggregations by department:\n")
print(aggregate(cbind(salary, years) ~ department, data = df_groups, 
                FUN = function(x) c(mean = mean(x), max = max(x))))
cat("\n")

# ---- Joining Data Frames ----
cat("==== JOINING DATA FRAMES ====\n\n")

# Prepare sample data frames for joining
df1 <- data.frame(id = 1:5, name = c("Alice", "Bob", "Charlie", "David", "Eve"))
df2 <- data.frame(id = c(1, 2, 4, 6, 7), score = c(85, 92, 78, 88, 95))

cat("First data frame (df1):\n")
print(df1)
cat("\n")

cat("Second data frame (df2):\n")
print(df2)
cat("\n")

# Inner join
cat("Inner join (only matching rows):\n")
print(merge(df1, df2, by = "id"))
cat("\n")

# Left join
cat("Left join (all rows from df1):\n")
print(merge(df1, df2, by = "id", all.x = TRUE))
cat("\n")

# Right join
cat("Right join (all rows from df2):\n")
print(merge(df1, df2, by = "id", all.y = TRUE))
cat("\n")

# Full join
cat("Full join (all rows from both):\n")
print(merge(df1, df2, by = "id", all = TRUE))
cat("\n")

# Join with different key names
df3 <- data.frame(person_id = 1:3, score = c(85, 92, 78))
cat("Third data frame (df3) with different key name:\n")
print(df3)
cat("\n")

cat("Join with different key names:\n")
print(merge(df1, df3, by.x = "id", by.y = "person_id"))
cat("\n")

# ---- Set Operations ----
cat("==== SET OPERATIONS ====\n\n")

# Create sample data frames for set operations
df_a <- data.frame(id = 1:4, name = c("Alice", "Bob", "Charlie", "David"))
df_b <- data.frame(id = 3:6, name = c("Charlie", "David", "Eve", "Frank"))

cat("Data frame A:\n")
print(df_a)
cat("\n")

cat("Data frame B:\n")
print(df_b)
cat("\n")

# Union
union_df <- unique(rbind(df_a, df_b))
cat("Union (all unique rows from both):\n")
print(union_df)
cat("\n")

# Intersection
intersect_rows <- merge(df_a, df_b, by = c("id", "name"))
cat("Intersection (common rows):\n")
print(intersect_rows)
cat("\n")

# Difference
diff_rows <- df_a[!paste(df_a$id, df_a$name) %in% paste(df_b$id, df_b$name), ]
cat("Difference (rows in A not in B):\n")
print(diff_rows)
cat("\n")

# ---- Adding and Modifying Columns ----
cat("==== ADDING AND MODIFYING COLUMNS ====\n\n")

# Add new column
df$graduated <- c(TRUE, TRUE, FALSE, TRUE)
cat("Added 'graduated' column:\n")
print(df)
cat("\n")

# Add multiple columns
df <- transform(df, 
                age_months = age * 12,
                score_normalized = score / 100)
cat("Added multiple calculated columns:\n")
print(df)
cat("\n")

# Modify existing column
df$age <- df$age + 1
cat("Modified 'age' column (added 1 to each):\n")
print(df)
cat("\n")

# Conditional modification
df$score[df$name == "Alice"] <- 95
cat("Conditionally modified Alice's score to 95:\n")
print(df)
cat("\n")

# ---- Handling Missing Data ----
cat("==== HANDLING MISSING DATA ====\n\n")

# Create data frame with missing values
df_na <- data.frame(
  id = 1:5,
  name = c("Alice", "Bob", NA, "David", "Eve"),
  score = c(85, NA, 78, NA, 92)
)

cat("Data frame with missing values:\n")
print(df_na)
cat("\n")

cat("Check for any missing values:\n")
print(anyNA(df_na))
cat("\n")

cat("Count missing values by column:\n")
print(colSums(is.na(df_na)))
cat("\n")

cat("Remove rows with any NA:\n")
print(na.omit(df_na))
cat("\n")

# Replace NAs with specific values
df_na$score[is.na(df_na$score)] <- 0
cat("Replace NA scores with 0:\n")
print(df_na)
cat("\n")

# Mean imputation
mean_name_length <- mean(nchar(as.character(df_na$name)), na.rm = TRUE)
df_na$name[is.na(df_na$name)] <- paste0("Unknown_", round(mean_name_length))
cat("Replace NA names with generated placeholder:\n")
print(df_na)
cat("\n")

# ---- Working with Row Names ----
cat("==== WORKING WITH ROW NAMES ====\n\n")

# Set row names
original_df <- df[1:3, c("name", "age", "score")]
rownames(original_df) <- c("student1", "student2", "student3")
cat("Data frame with custom row names:\n")
print(original_df)
cat("\n")

# Reset row names
reset_df <- original_df
rownames(reset_df) <- NULL
cat("Data frame with reset row names:\n")
print(reset_df)
cat("\n")

# Convert row names to column
row_to_col_df <- original_df
row_to_col_df$id <- rownames(row_to_col_df)
rownames(row_to_col_df) <- NULL
cat("Row names converted to column:\n")
print(row_to_col_df)
cat("\n")

cat("This demo covers the basics of working with data frames in R.\n")
cat("For more advanced operations, you can use packages like dplyr, data.table, or sqldf.\n")
