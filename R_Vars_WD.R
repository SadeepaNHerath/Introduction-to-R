#clear out any old variables
rm(list=ls())

#-------- VARIABLE NAMING CONVENTIONS IN R --------#
#conventions in R
#camel case
myVar1 <-10

#dot notation
myvar.1 <- 5

# snake_case (common in tidyverse packages)
my_variable <- 15

#case is important
print(myVar1)

#-------- DATA TYPES AND TYPE CHECKING --------#
#two ways to test for type
#class, mode
class(myVar1)

#types can be dynamic
myVar1 <- 'Hello World!'
mode(myVar1)

# Common R data types
numeric_var <- 42.5      # double/numeric
integer_var <- 42L       # The 'L' suffix creates an integer
character_var <- "text"  # string/character
logical_var <- TRUE      # boolean
complex_var <- 3+2i      # complex number

# Check types of different variables
print(class(numeric_var))
print(class(integer_var))
print(class(logical_var))

# Type conversion functions
as_char <- as.character(numeric_var)  # Convert to character
as_num <- as.numeric("123")           # Convert to numeric
as_int <- as.integer(4.9)             # Convert to integer (note truncation)

#-------- WORKSPACE MANAGEMENT --------#
#remove a single variable
rm('myvar.1')

# List objects in current workspace
ls()

# Save workspace image
# save.image("myWorkspace.RData")

# Load workspace
# load("myWorkspace.RData")

#-------- WORKING DIRECTORY MANAGEMENT --------#
#get current working directory
getwd()
#change working directory
setwd('E:/Temp')

# List files in current directory
list.files()

# Create a new directory
dir.create("new_folder", showWarnings = FALSE)

#-------- ASSIGNMENT OPERATORS --------#
# In R, there are multiple assignment operators:
x <- 10       # Preferred assignment operator
10 -> x       # Right-to-left assignment
x = 10        # Equal sign works too, but '<-' is preferred in most contexts

#-------- R ENVIRONMENTS --------#
# R has nested environments
# Global environment is where your script runs
environment()

# Create a new environment
my_env <- new.env()
my_env$var <- 100  # Assign a variable in the environment
ls(my_env)         # List variables in environment

#-------- PACKAGES AND LIBRARIES --------#
# Install a package (uncomment to use)
# install.packages("dplyr")

# Load a package
# library(dplyr)

# Check installed packages
installed.packages()[1:5, c("Package", "Version")]
