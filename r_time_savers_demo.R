# R Time-Savers Demo
# This script demonstrates practical uses of R time-saving functions

# ---- Setup ----
cat("==== R TIME-SAVERS DEMO ====\n\n")

# Create a sample data frame for the examples
cat("Creating sample data...\n")
set.seed(123)  # For reproducible results
students <- data.frame(
  id = 1:12,
  name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", 
           "Grace", "Hannah", "Ian", "Julia", "Kevin", "Liam"),
  age = c(19, 21, 20, 22, 19, 23, 20, 21, 22, 20, 21, 19),
  score = round(rnorm(12, mean = 75, sd = 12)),
  major = c("Math", "English", "Math", "Physics", "Chemistry", "English",
            "Math", "Physics", "Chemistry", "Math", "English", "Chemistry")
)

cat("Sample data frame:\n")
print(students)
cat("\n")

# ---- cut() - Creating Categories ----
cat("==== cut() FUNCTION ====\n\n")

# Create grade categories based on score
cat("Converting scores to letter grades using cut():\n")
students$grade <- cut(students$score, 
                      breaks = c(0, 60, 70, 80, 90, 100),
                      labels = c("F", "D", "C", "B", "A"),
                      include.lowest = TRUE)

cat("Students with grades:\n")
print(students[, c("name", "score", "grade")])
cat("\n")

# Create age groups
cat("Creating age groups using cut():\n")
students$age_group <- cut(students$age, 
                          breaks = c(18, 20, 22, 24),
                          labels = c("Freshman", "Junior", "Senior"))

cat("Students with age groups:\n")
print(students[, c("name", "age", "age_group")])
cat("\n")

# ---- attach() and with() ----
cat("==== attach() AND with() FUNCTIONS ====\n\n")

cat("Using attach() - allows direct access to data frame columns:\n")
attach(students)
cat("Mean age using attach():", mean(age), "\n")
cat("Names of students scoring above 80:", paste(name[score > 80], collapse=", "), "\n")
detach(students)  # Always detach when done
cat("\n")

cat("Using with() - safer alternative to attach():\n")
result <- with(students, {
  mean_age <- mean(age)
  high_scorers <- name[score > 80]
  list(mean_age = mean_age, high_scorers = high_scorers)
})

cat("Mean age using with():", result$mean_age, "\n")
cat("High scorers using with():", paste(result$high_scorers, collapse=", "), "\n\n")

# ---- subset() ----
cat("==== subset() FUNCTION ====\n\n")

cat("Filter students using subset():\n")
math_students <- subset(students, major == "Math")
cat("Math students:\n")
print(math_students[, c("name", "major", "score")])
cat("\n")

cat("Filter AND select columns in one step:\n")
high_performers <- subset(students, score >= 80, select = c(name, major, score, grade))
cat("High performing students:\n")
print(high_performers)
cat("\n")

# ---- transform() ----
cat("==== transform() FUNCTION ====\n\n")

cat("Add multiple columns at once using transform():\n")
students_enhanced <- transform(students,
                              bonus_points = ifelse(score > 90, 5, 0),
                              total_score = score + bonus_points,
                              status = ifelse(age < 21, "Underclass", "Upperclass"))

cat("Enhanced student data (showing select columns):\n")
print(students_enhanced[, c("name", "score", "bonus_points", "total_score", "status")])
cat("\n")

# ---- %in% Operator ----
cat("==== %in% OPERATOR ====\n\n")

cat("Check if values exist in a vector:\n")
science_majors <- c("Physics", "Chemistry", "Biology")
cat("Is 'Math' a science major?", "Math" %in% science_majors, "\n")
cat("Is 'Chemistry' a science major?", "Chemistry" %in% science_majors, "\n\n")

cat("Filter data using %in%:\n")
science_students <- students[students$major %in% science_majors, ]
cat("Science students:\n")
print(science_students[, c("name", "major")])
cat("\n")

# ---- ifelse() ----
cat("==== ifelse() FUNCTION ====\n\n")

cat("Create conditional values with ifelse():\n")
students$performance <- ifelse(students$score >= 80, "Excellent", 
                              ifelse(students$score >= 70, "Good", "Needs Improvement"))

cat("Students with performance categories:\n")
print(students[, c("name", "score", "performance")])
cat("\n")

# ---- table() and prop.table() ----
cat("==== table() AND prop.table() FUNCTIONS ====\n\n")

cat("Frequency table of majors:\n")
major_table <- table(students$major)
print(major_table)
cat("\n")

cat("Proportion table of majors:\n")
print(prop.table(major_table))
cat("\n")

cat("Cross-tabulation of major and performance:\n")
major_performance <- table(Major = students$major, Performance = students$performance)
print(major_performance)
cat("\n")

cat("Proportions by row:\n")
print(prop.table(major_performance, 1))  # 1 means row proportions
cat("\n")

# ---- tapply() ----
cat("==== tapply() FUNCTION ====\n\n")

cat("Calculate average score by major using tapply():\n")
avg_by_major <- tapply(students$score, students$major, mean)
print(avg_by_major)
cat("\n")

cat("Find highest score by major:\n")
max_by_major <- tapply(students$score, students$major, max)
print(max_by_major)
cat("\n")

# ---- aggregate() ----
cat("==== aggregate() FUNCTION ====\n\n")

cat("Calculate multiple statistics by group using aggregate():\n")
agg_results <- aggregate(score ~ major, data = students, 
                         FUN = function(x) c(mean = mean(x), 
                                            max = max(x),
                                            min = min(x),
                                            count = length(x)))
print(agg_results)
cat("\n")

cat("Using formula interface for multiple variables:\n")
agg_multiple <- aggregate(cbind(score, age) ~ major, data = students, FUN = mean)
print(agg_multiple)
cat("\n")

# ---- split() and lapply() ----
cat("==== split() AND lapply() FUNCTIONS ====\n\n")

cat("Split data by major and calculate statistics:\n")
split_by_major <- split(students, students$major)
summary_by_major <- lapply(split_by_major, function(group) {
  data.frame(
    count = nrow(group),
    avg_score = mean(group$score),
    avg_age = mean(group$age)
  )
})
print(summary_by_major)
cat("\n")

# ---- merge() ----
cat("==== merge() FUNCTION ====\n\n")

# Create a second data frame with additional student information
student_details <- data.frame(
  id = c(1, 2, 5, 7, 9, 12, 15),
  scholarship = c("Yes", "No", "Yes", "No", "Yes", "No", "Yes"),
  club = c("Chess", "Drama", "Sports", "Music", "Debate", "Art", "Chess")
)

cat("Original students data (first few rows):\n")
print(head(students[, c("id", "name", "major")]))
cat("\n")

cat("Student details data:\n")
print(student_details)
cat("\n")

cat("Inner join (only matching students):\n")
inner_joined <- merge(students, student_details, by = "id")
print(inner_joined[, c("id", "name", "major", "scholarship", "club")])
cat("\n")

cat("Left join (all students, may have NAs):\n")
left_joined <- merge(students, student_details, by = "id", all.x = TRUE)
print(left_joined[, c("id", "name", "major", "scholarship", "club")])
cat("\n")

# ---- paste() and paste0() ----
cat("==== paste() AND paste0() FUNCTIONS ====\n\n")

cat("Create student IDs with paste():\n")
student_ids <- paste("STU", students$id, sep = "-")
print(student_ids)
cat("\n")

cat("Create full name tags with paste0():\n")
name_tags <- paste0("Name: ", students$name, " (", students$major, ")")
print(name_tags)
cat("\n")

# ---- unique() and duplicated() ----
cat("==== unique() AND duplicated() FUNCTIONS ====\n\n")

cat("Unique majors in the dataset:\n")
unique_majors <- unique(students$major)
print(unique_majors)
cat("\n")

# Create some duplicate data
cat("Creating data with duplicates:\n")
dup_data <- rbind(students[1:3, ], students[2, ], students[5, ], students[5, ])
cat("Row count in duplicate data:", nrow(dup_data), "\n\n")

cat("Find and remove duplicates:\n")
unique_data <- dup_data[!duplicated(dup_data), ]
cat("Row count after removing duplicates:", nrow(unique_data), "\n\n")

# ---- Formula interface ----
cat("==== FORMULA INTERFACE ====\n\n")

cat("Plotting using formula interface:\n")
cat("plot(score ~ age, data = students)\n")
cat("# Would create a scatter plot of score vs age\n\n")

cat("Linear regression using formula:\n")
model <- lm(score ~ age + major, data = students)
cat("Model summary:\n")
print(summary(model))
cat("\n")

# ---- With function creation ----
cat("==== CUSTOM FUNCTIONS ====\n\n")

# Create a percentile function
calculate_percentile <- function(values, percentile = 0.9) {
  sorted <- sort(values)
  position <- percentile * length(values)
  if (position == floor(position)) {
    # When position is a whole number
    return((sorted[position] + sorted[position + 1]) / 2)
  } else {
    # When position is not a whole number
    return(sorted[ceiling(position)])
  }
}

cat("Calculate 90th percentile of scores:\n")
p90 <- calculate_percentile(students$score, 0.9)
cat("90th percentile:", p90, "\n")
cat("Students above 90th percentile:\n")
print(subset(students, score >= p90, select = c(name, score)))
cat("\n")

cat("This demo shows how to use various R time-savers to make your code more efficient.\n")
cat("Experiment with these functions in your own analyses!\n")
