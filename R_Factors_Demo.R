# R Factors Demo
# This script demonstrates factor operations and concepts in R

# Clear workspace
rm(list = ls())

cat("========== FACTOR BASICS ==========\n")

# Creating a basic factor
colors <- c("red", "blue", "green", "red", "blue", "yellow")
colors_factor <- factor(colors)

cat("Original character vector:\n")
print(colors)
cat("Converted to factor:\n")
print(colors_factor)
cat("Levels of the factor:", levels(colors_factor), "\n")
cat("Class of colors_factor:", class(colors_factor), "\n")
cat("Type of colors_factor:", typeof(colors_factor), "\n")

# Creating a factor with specified levels
cat("\nFactor with specified levels:\n")
sizes <- factor(c("medium", "small", "large", "medium", "small"),
                levels = c("small", "medium", "large"))
print(sizes)
cat("Levels (in specified order):", levels(sizes), "\n")

# Creating a factor with specified level order
cat("\nFactor with non-alphabetical level order:\n")
grades <- factor(c("B", "A", "C", "A", "B"),
                 levels = c("C", "B", "A"))  # Worst to best
print(grades)
cat("Levels (from worst to best):", levels(grades), "\n")

# Including levels not present in the data
cat("\nFactor with levels not in the data:\n")
statuses <- factor(c("active", "inactive", "active"),
                   levels = c("active", "inactive", "pending", "deleted"))
print(statuses)
cat("All levels:", levels(statuses), "\n")
cat("Table of frequencies:\n")
print(table(statuses))

cat("\n========== ORDERED FACTORS ==========\n")

# Unordered factor
sizes_unordered <- factor(c("small", "medium", "large", "medium"))
cat("Unordered factor:\n")
print(sizes_unordered)
cat("Is ordered:", is.ordered(sizes_unordered), "\n")

# Ordered factor
sizes_ordered <- factor(c("small", "medium", "large", "medium"),
                        levels = c("small", "medium", "large"),
                        ordered = TRUE)
cat("\nOrdered factor:\n")
print(sizes_ordered)
cat("Is ordered:", is.ordered(sizes_ordered), "\n")

# Alternative using ordered() function
cat("\nOrdered factor using ordered() function:\n")
education <- ordered(c("High School", "Bachelor's", "Master's", "PhD"),
                    levels = c("High School", "Bachelor's", "Master's", "PhD"))
print(education)

# Comparing ordered factors
cat("\nComparisons with ordered factors:\n")
cat("small < large:", sizes_ordered[1] < sizes_ordered[3], "\n")
cat("medium > small:", sizes_ordered[2] > sizes_ordered[1], "\n")

# Try to compare unordered factors (uncomment to see error)
# cat("Comparing unordered factors (would cause an error):\n")
# sizes_unordered[1] < sizes_unordered[3]

cat("\n========== WORKING WITH FACTOR LEVELS ==========\n")

# Get and change level names
cat("Original education levels:", levels(education), "\n")

# Change level names
levels(education)[levels(education) == "Bachelor's"] <- "Undergraduate"
levels(education)[levels(education) == "Master's"] <- "Graduate"
cat("After renaming levels:", levels(education), "\n")
cat("Updated education factor:\n")
print(education)

# Reordering levels
cat("\nReordering levels:\n")
days <- factor(c("Mon", "Wed", "Tue", "Fri", "Mon"))
cat("Original days factor (alphabetical):\n")
print(days)

days_ordered <- factor(days,
                       levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
cat("Days with proper weekday order:\n")
print(days_ordered)

# Combining levels
cat("\nCombining factor levels:\n")
feedback <- factor(c("Poor", "Average", "Good", "Excellent", "Good"))
cat("Original feedback:\n")
print(feedback)

# Combine "Good" and "Excellent" into "Positive"
feedback_grouped <- feedback
levels(feedback_grouped)[c(3, 4)] <- "Positive"
levels(feedback_grouped)[c(1)] <- "Negative"
cat("After combining levels:\n")
print(feedback_grouped)
cat("New levels:", levels(feedback_grouped), "\n")

# Dropping unused levels
cat("\nDropping unused levels:\n")
regions <- factor(c("North", "South", "East", "West", "North"))
cat("Original regions:\n")
print(regions)

regions_subset <- regions[regions != "East" & regions != "West"]
cat("After subsetting (unused levels still present):\n")
print(regions_subset)
cat("Levels:", levels(regions_subset), "\n")

regions_dropped <- droplevels(regions_subset)
cat("After dropping unused levels:\n")
print(regions_dropped)
cat("Levels:", levels(regions_dropped), "\n")

cat("\n========== CONVERTING FACTORS ==========\n")

# Factor to character
car_types <- factor(c("Sedan", "SUV", "Hatchback", "Sedan"))
cat("Original factor:\n")
print(car_types)

car_types_char <- as.character(car_types)
cat("\nConverted to character:\n")
print(car_types_char)
cat("Class:", class(car_types_char), "\n")

# Factor to numeric
cat("\nFactor to numeric conversion:\n")
ratings <- factor(c("Low", "Medium", "High", "Medium"))
cat("Original factor:\n")
print(ratings)

# Direct conversion gives the internal integer codes
ratings_num1 <- as.numeric(ratings)
cat("Direct conversion (internal codes):", ratings_num1, "\n")

# To get meaningful numeric values, specify them explicitly
ratings_levels <- c(1, 5, 10)  # Define numeric values for each level
ratings_num2 <- ratings_levels[as.numeric(ratings)]
cat("Conversion with explicit values:", ratings_num2, "\n")

cat("\n========== PRACTICAL APPLICATIONS ==========\n")

# Sample dataset with factors
cat("Example: Analyzing test scores by group\n")
student_data <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David", "Emma", "Frank", "Grace", "Henry"),
  gender = factor(c("F", "M", "M", "M", "F", "M", "F", "M")),
  grade_level = factor(c("9th", "10th", "9th", "12th", "11th", "10th", "11th", "12th"),
                       levels = c("9th", "10th", "11th", "12th"),
                       ordered = TRUE),
  score = c(85, 92, 78, 95, 88, 79, 91, 86)
)
cat("Student data:\n")
print(student_data)

# Analyze scores by gender
cat("\nMean score by gender:\n")
gender_means <- aggregate(score ~ gender, data = student_data, FUN = mean)
print(gender_means)

# Analyze scores by grade level
cat("\nMean score by grade level:\n")
grade_means <- aggregate(score ~ grade_level, data = student_data, FUN = mean)
print(grade_means)

# Counts by factor levels
cat("\nCounts by gender and grade level:\n")
table_result <- table(student_data$gender, student_data$grade_level)
print(table_result)

# Using factors in visualization (would create a plot in interactive mode)
cat("\nFactors are useful in plots for grouping and ordering categories\n")
# barplot(table(student_data$grade_level), main = "Students by Grade Level")

cat("\n========== ADVANCED FACTOR TECHNIQUES ==========\n")

# Using functions from the forcats package (comment code to run without forcats)
cat("Note: The following code requires the forcats package\n")
cat("To use these functions, uncomment the code and install forcats if needed\n")

# # Reorder factors by frequency
# library(forcats)
# colors <- factor(c("red", "blue", "green", "red", "blue", "red", "green"))
# colors_by_freq <- forcats::fct_infreq(colors)
# cat("Factors reordered by frequency:\n")
# print(levels(colors_by_freq))
# 
# # Reorder factors by another variable
# library(forcats)
# cat("\nReordering grade levels by average score:\n")
# student_data$grade_by_score <- forcats::fct_reorder(
#   student_data$grade_level, student_data$score, .fun = mean
# )
# print(levels(student_data$grade_by_score))

cat("\n========== END OF FACTOR DEMO ==========\n")
