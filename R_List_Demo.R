# R List Demo
# This script demonstrates list operations and concepts in R

# Clear workspace
rm(list = ls())

cat("========== LIST CREATION ==========\n")

# Create a simple list
simple_list <- list(1, "hello", TRUE)
cat("Simple list:\n")
print(simple_list)

# Create a named list
named_list <- list(
  id = 1234,
  name = "Alice Smith",
  scores = c(85, 92, 78),
  passed = TRUE
)
cat("\nNamed list:\n")
print(named_list)

# Create a nested list (list containing lists)
nested_list <- list(
  personal = list(
    name = "Bob Johnson",
    age = 35,
    email = "bob@example.com"
  ),
  employment = list(
    company = "ABC Corp",
    position = "Analyst",
    years = 5
  ),
  skills = c("R", "Python", "SQL")
)
cat("\nNested list:\n")
print(nested_list)

# Create a list from existing objects
v1 <- 1:5
v2 <- c("a", "b", "c")
m1 <- matrix(1:4, nrow = 2)
list_from_objects <- list(
  numbers = v1,
  letters = v2,
  matrix_data = m1
)
cat("\nList created from various objects:\n")
print(list_from_objects)

# Convert a vector to a list
vector_to_list <- as.list(1:5)
cat("\nVector converted to list:\n")
print(vector_to_list)

cat("\n========== ACCESSING LIST ELEMENTS ==========\n")

# Setup a list for demonstrations
demo_list <- list(
  numbers = 1:5,
  text = "Hello World",
  logical = c(TRUE, FALSE, TRUE),
  nested = list(a = 10, b = 20)
)
cat("Demo list for access examples:\n")
print(demo_list)

# Access by $ notation
cat("\nAccessing by $ notation:\n")
cat("demo_list$numbers:", demo_list$numbers, "\n")
cat("demo_list$text:", demo_list$text, "\n")

# Access by position with [[]]
cat("\nAccessing by position with [[]]:\n")
cat("demo_list[[1]]:", demo_list[[1]], "\n")
cat("demo_list[[2]]:", demo_list[[2]], "\n")

# Access by name with [[]]
cat("\nAccessing by name with [[]]:\n")
cat("demo_list[['numbers']]:", demo_list[["numbers"]], "\n")
cat("demo_list[['text']]:", demo_list[["text"]], "\n")

# Access nested elements
cat("\nAccessing nested elements:\n")
cat("demo_list$nested$a:", demo_list$nested$a, "\n")
cat("demo_list[[4]][[1]]:", demo_list[[4]][[1]], "\n")
cat("demo_list[['nested']][['b']]:", demo_list[["nested"]][["b"]], "\n")

cat("\n========== LIST SLICES WITH [ ] ==========\n")

# Single element slice
cat("Single element slice - demo_list[1]:\n")
print(demo_list[1])
cat("Class:", class(demo_list[1]), "\n")

# Multiple element slice
cat("\nMultiple element slice - demo_list[c(1, 3)]:\n")
print(demo_list[c(1, 3)])

# Named slice
cat("\nNamed slice - demo_list[c('numbers', 'logical')]:\n")
print(demo_list[c("numbers", "logical")])

# Negative indices (exclude elements)
cat("\nExcluding elements - demo_list[-2]:\n")
print(demo_list[-2])

cat("\n========== SIMPLIFYING VS PRESERVING ==========\n")

# Demonstration of the difference between [ ] and [[ ]]
cat("Access with [[ ]] (simplifies):\n")
cat("demo_list[[1]]:", demo_list[[1]], "\n")
cat("Class:", class(demo_list[[1]]), "\n")

cat("\nAccess with [ ] (preserves list structure):\n")
cat("demo_list[1]:\n")
print(demo_list[1])
cat("Class:", class(demo_list[1]), "\n")

cat("\nSimplifying vs preserving with $ and [[]]:\n")
cat("demo_list$numbers:", demo_list$numbers, "\n")
cat("Class of demo_list$numbers:", class(demo_list$numbers), "\n")
cat("demo_list[['numbers']]:", demo_list[["numbers"]], "\n")
cat("Class of demo_list[['numbers']]:", class(demo_list[["numbers"]]), "\n")

cat("\n========== NAMED LIST SLICES ==========\n")

# Create named slices
slice1 <- demo_list[c("numbers", "logical")]
cat("Named slice - slice1:\n")
print(slice1)
cat("Names of slice1:", names(slice1), "\n")

# Rename elements in a slice
slice2 <- demo_list[c("numbers", "text")]
names(slice2) <- c("values", "message")
cat("\nRenamed slice - slice2:\n")
print(slice2)

# Create a new list with renamed elements
renamed_list <- list(
  values = demo_list$numbers,
  message = demo_list$text
)
cat("\nNewly created list with renamed elements:\n")
print(renamed_list)

cat("\n========== MODIFYING LISTS ==========\n")

# Start with a simple list
mod_list <- list(a = 1:3, b = "hello")
cat("Original list:\n")
print(mod_list)

# Add new elements
mod_list$c <- TRUE
mod_list[["d"]] <- c(2.5, 7.8)
cat("\nAfter adding elements:\n")
print(mod_list)

# Modify existing elements
mod_list$a <- c(10, 20, 30)
mod_list[["b"]] <- "goodbye"
cat("\nAfter modifying elements:\n")
print(mod_list)

# Remove elements
mod_list$b <- NULL
cat("\nAfter removing element 'b':\n")
print(mod_list)

cat("\n========== LIST OPERATIONS ==========\n")

# Combine lists
list1 <- list(a = 1, b = 2)
list2 <- list(c = 3, d = 4)
combined <- c(list1, list2)
cat("Combining lists with c():\n")
cat("list1:\n")
print(list1)
cat("list2:\n")
print(list2)
cat("combined:\n")
print(combined)

# Get list length
cat("\nLength of combined list:", length(combined), "\n")

# Check if elements exist
cat("\nChecking if elements exist:\n")
cat("'a' in combined:", "a" %in% names(combined), "\n")
cat("'x' in combined:", "x" %in% names(combined), "\n")

# Apply functions to list elements
numeric_list <- list(a = 1:5, b = c(10, 20, 30), c = c(1.5, 2.5))
cat("\nApplying functions to list elements:\n")

# lapply - returns a list
lapply_result <- lapply(numeric_list, sum)
cat("lapply(numeric_list, sum):\n")
print(lapply_result)

# sapply - simplifies result when possible
sapply_result <- sapply(numeric_list, mean)
cat("\nsapply(numeric_list, mean):\n")
print(sapply_result)
cat("Class of sapply result:", class(sapply_result), "\n")

cat("\n========== PRACTICAL EXAMPLES ==========\n")

# Example 1: Student records
students <- list(
  student1 = list(
    name = "John Smith",
    grades = c(85, 90, 78),
    courses = c("Math", "Science", "English")
  ),
  student2 = list(
    name = "Mary Johnson",
    grades = c(92, 88, 95),
    courses = c("Math", "History", "Art")
  )
)

cat("Example 1: Student records\n")
print(students)

# Calculate average grade for each student
cat("\nAverage grades:\n")
cat(students$student1$name, ":", mean(students$student1$grades), "\n")
cat(students$student2$name, ":", mean(students$student2$grades), "\n")

# Example 2: Working with JSON-like data
cat("\nExample 2: Working with JSON-like data\n")
json_data <- list(
  id = "12345",
  timestamp = "2023-05-15 14:30:00",
  user = list(
    name = "Alex Garcia",
    role = "admin"
  ),
  settings = list(
    theme = "dark",
    notifications = TRUE
  ),
  data = list(
    values = c(1.2, 3.4, 5.6),
    labels = c("A", "B", "C")
  )
)

# Extract and transform data
cat("User role:", json_data$user$role, "\n")
cat("Theme setting:", json_data$settings$theme, "\n")
cat("Data values mean:", mean(json_data$data$values), "\n")

cat("\n========== END OF LIST DEMO ==========\n")
