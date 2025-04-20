# Data Tables in R - Demo Script
# This script demonstrates the concepts from data_tables_guide.md

# ---- Setup ----
cat("==== SETUP ====\n\n")

# Load the data.table package
if (!require(data.table)) {
  cat("Installing data.table package...\n")
  install.packages("data.table")
  library(data.table)
}

cat("data.table version:", packageVersion("data.table"), "\n\n")

# ---- Create Sample Data Tables ----
cat("==== CREATING DATA TABLES ====\n\n")

# Create a data.table from scratch
cat("Creating data.table from scratch:\n")
dt_students <- data.table(
  id = 1:6,
  name = c("Alice", "Bob", "Charlie", "David", "Eve", "Frank"),
  score = c(85, 92, 78, 96, 87, 65),
  grade = c("B", "A", "C", "A", "B", "D")
)
print(dt_students)
cat("\n")

# Create a data.table from a data frame
cat("Creating data.table from a data frame:\n")
df <- data.frame(
  student_id = c(1, 2, 3, 6, 7, 8),
  course = c("Math", "Physics", "Chemistry", "Biology", "History", "Art"),
  instructor = c("Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia")
)
dt_courses <- as.data.table(df)
print(dt_courses)
cat("\n")

# ---- Basic Structure and Information ----
cat("==== BASIC STRUCTURE AND INFORMATION ====\n\n")

cat("Structure of dt_students:\n")
str(dt_students)
cat("\n")

cat("Summary of dt_students:\n")
print(summary(dt_students))
cat("\n")

cat("First 3 rows of dt_students:\n")
print(head(dt_students, 3))
cat("\n")

cat("Dimensions of dt_students:\n")
print(dim(dt_students))
cat("\n")

cat("Column names of dt_students:\n")
print(names(dt_students))
cat("\n")

cat("Class of object:\n")
print(class(dt_students))
cat("Note: data.table objects are also data.frames but with enhanced functionality\n\n")

# ---- Basic Operations ----
cat("==== BASIC OPERATIONS ====\n\n")

# Subsetting rows
cat("Select first 2 rows:\n")
print(dt_students[1:2])
cat("\n")

cat("Filter rows with score > 85:\n")
print(dt_students[score > 85])
cat("\n")

cat("Filter rows with multiple conditions (grade A and score > 90):\n")
print(dt_students[grade == "A" & score > 90])
cat("\n")

# Selecting columns
cat("Select specific columns:\n")
print(dt_students[, .(name, score)])
cat("\n")

cat("Alternative column selection using list():\n")
print(dt_students[, list(name, score)])
cat("\n")

# Compute/aggregate columns
cat("Compute average score:\n")
print(dt_students[, .(average_score = mean(score))])
cat("\n")

cat("Compute multiple statistics:\n")
print(dt_students[, .(average = mean(score), minimum = min(score), maximum = max(score))])
cat("\n")

# ---- Adding and Modifying Columns ----
cat("==== ADDING AND MODIFYING COLUMNS ====\n\n")

# Create a copy to avoid modifying original
dt <- copy(dt_students)

cat("Add a new column (normalized score):\n")
dt[, normalized := score / 100]
print(dt)
cat("\n")

cat("Add multiple columns at once:\n")
dt[, `:=`(
  pass = score >= 70,
  score_squared = score^2
)]
print(dt)
cat("\n")

cat("Modify existing column conditionally:\n")
dt[grade == "D", grade := "F"]
print(dt)
cat("\n")

cat("Remove a column:\n")
dt[, score_squared := NULL]
print(dt)
cat("\n")

# ---- Group Operations ----
cat("==== GROUP OPERATIONS ====\n\n")

cat("Count records by grade:\n")
print(dt_students[, .N, by = grade])
cat("\n")

cat("Average score by grade:\n")
print(dt_students[, .(avg_score = mean(score)), by = grade])
cat("\n")

cat("Multiple statistics by grade:\n")
print(dt_students[, .(avg = mean(score), min = min(score), max = max(score), count = .N), by = grade])
cat("\n")

# ---- Keys ----
cat("==== USING KEYS ====\n\n")

# Make copies for demonstration
dt_students_keyed <- copy(dt_students)
dt_courses_keyed <- copy(dt_courses)

cat("Set key on dt_students_keyed:\n")
setkey(dt_students_keyed, id)
cat("Key:", key(dt_students_keyed), "\n\n")

cat("Set key on dt_courses_keyed:\n")
setkey(dt_courses_keyed, student_id)
cat("Key:", key(dt_courses_keyed), "\n\n")

cat("Fast filtering using keys (get student with id 3):\n")
print(dt_students_keyed[.(3)])
cat("\n")

cat("Range filtering with keys (students with ids 2-4):\n")
print(dt_students_keyed[.(2:4)])
cat("\n")

# ---- Join Operations ----
cat("==== JOIN OPERATIONS ====\n\n")

# Create copies with simpler names for demo purposes
students <- copy(dt_students)
courses <- copy(dt_courses)

cat("Students table:\n")
print(students)
cat("\n")

cat("Courses table:\n")
print(courses)
cat("\n")

# Inner join
cat("INNER JOIN (only matching rows in both tables):\n")
inner_join <- merge(students, courses, by.x = "id", by.y = "student_id")
print(inner_join)
cat("\nNote: Only students with matching courses are included (ids 1, 2, 3, 6)\n\n")

# Left join
cat("LEFT JOIN (all students, matching courses):\n")
left_join <- merge(students, courses, by.x = "id", by.y = "student_id", all.x = TRUE)
print(left_join)
cat("\nNote: All students are included; students without courses have NAs\n\n")

# Right join
cat("RIGHT JOIN (all courses, matching students):\n")
right_join <- merge(students, courses, by.x = "id", by.y = "student_id", all.y = TRUE)
print(right_join)
cat("\nNote: All courses are included; courses without students have NAs\n\n")

# Full join
cat("FULL/OUTER JOIN (all records from both tables):\n")
full_join <- merge(students, courses, by.x = "id", by.y = "student_id", all = TRUE)
print(full_join)
cat("\nNote: All students and courses are included with NAs where no match exists\n\n")

# Anti join (not inner join)
cat("ANTI JOIN (students without courses):\n")
# Set keys for efficient operation
setkey(students, id)
setkey(courses, student_id)
anti_join <- students[!courses]
print(anti_join)
cat("\nNote: Only returns students that don't have any courses (ids 4, 5)\n\n")

# Semi join
cat("SEMI JOIN (students with at least one course):\n")
semi_join <- students[id %in% courses$student_id]
print(semi_join)
cat("\nNote: Returns students that have at least one course (ids 1, 2, 3, 6)\n\n")

# ---- Special Symbols ----
cat("==== SPECIAL SYMBOLS ====\n\n")

cat(".N - Count of rows:\n")
print(students[, .N])
cat("\n")

cat(".N by group - Count of students by grade:\n")
print(students[, .N, by = grade])
cat("\n")

cat(".I - Row indices:\n")
print(students[, .I[1:2], by = grade])
cat("Note: Returns the first two row indices for each grade\n\n")

cat(".SD - Subset of data:\n")
print(students[, lapply(.SD, mean), .SDcols = c("score", "id")])
cat("Note: Calculates mean of score and id columns\n\n")

cat(".SD with groups - Mean of numeric columns by grade:\n")
print(students[, lapply(.SD, mean), by = grade, .SDcols = c("score", "id")])
cat("\n")

# ---- Advanced Operations ----
cat("==== ADVANCED OPERATIONS ====\n\n")

# Chaining operations
cat("Chaining operations - Filter then sort:\n")
result <- students[score > 80][order(-score)]
print(result)
cat("\n")

# Add row numbers within group
cat("Add row numbers within each grade group:\n")
students[, row_num := seq_len(.N), by = grade]
print(students)
cat("\n")

# Calculate differences from mean
cat("Calculate deviation from mean score:\n")
mean_score <- students[, mean(score)]
students[, deviation := score - mean_score]
print(students[, .(name, score, deviation)])
cat("\n")

# ---- Performance Comparison ----
cat("==== PERFORMANCE COMPARISON ====\n\n")

cat("Creating larger datasets for performance testing...\n")

# Create larger datasets
n <- 100000
set.seed(123)

# As data.frame
cat("Creating data.frame with", n, "rows\n")
big_df <- data.frame(
  id = 1:n,
  x = sample(1:100, n, replace = TRUE),
  y = rnorm(n),
  group = sample(LETTERS[1:5], n, replace = TRUE),
  stringsAsFactors = FALSE
)

# As data.table
cat("Converting to data.table\n")
big_dt <- as.data.table(big_df)
setkey(big_dt, id)

# Simple filtering operation
cat("\nPerformance comparison for filtering (x > 80):\n")

# With data.frame
cat("Using data.frame: ")
df_time <- system.time({
  result_df <- big_df[big_df$x > 80, ]
})
cat(df_time["elapsed"], "seconds\n")

# With data.table
cat("Using data.table: ")
dt_time <- system.time({
  result_dt <- big_dt[x > 80]
})
cat(dt_time["elapsed"], "seconds\n")

cat("Speed improvement:", round(df_time["elapsed"]/dt_time["elapsed"], 1), "x faster\n\n")

# Group by operation
cat("Performance comparison for group by operation (mean of y by group):\n")

# With data.frame
cat("Using data.frame: ")
df_time <- system.time({
  result_df <- aggregate(y ~ group, data = big_df, FUN = mean)
})
cat(df_time["elapsed"], "seconds\n")

# With data.table
cat("Using data.table: ")
dt_time <- system.time({
  result_dt <- big_dt[, .(avg_y = mean(y)), by = group]
})
cat(dt_time["elapsed"], "seconds\n")

cat("Speed improvement:", round(df_time["elapsed"]/dt_time["elapsed"], 1), "x faster\n\n")

cat("This demo shows the basic and advanced capabilities of data.table in R.\n")
cat("For more information, see the data.table documentation and vignettes.\n")
