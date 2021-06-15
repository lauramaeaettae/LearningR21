
# To load packages through package_loading script or to load eg. another script (eg. a data cleaning script)
source(here::here("R/package_loading.R"))

# Basics of R -------------------------------------------------------------

weight_kilo <- 100
weight_kilo

c("a", "b", "c")
c(TRUE, FALSE)
c(1, 2, 3)
factor(c("high", "median", "low"))


# First six rows of a dataset
head(CO2)

# Column names
colnames(CO2)

# Structure
str(CO2)

# Summary
summary(CO2)

# Following style guide - don't run the code


# Object names
DayOne- -> day_1
T <- FALSE- -> F <- FALSE
c <-
    9- -> non - descriptove name, don't use c because it's a function name c()

# Spacing
x[, 1]
x[, 1] - -> x[, 1]
mean (x, na.rm = TRUE) - -> remove space after mean
mean(x, na.rm = TRUE) - -> no space after bracket
cheight <- feet * 12 + inches- -> c_height <- feet * 12 + inches
df$z- -> df$z
x <- 1:10- -> x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
} - ->

    if (y < 0 && debug) {
        message("y is negative")
    }

# Object names
DayOne
T <- FALSE
c <- 9

# Spacing
x[, 1]
x[, 1]
mean (x, na.rm = TRUE)
mean(x, na.rm = TRUE)
height <- feet * 12 + inches
df$z
x <- 1:10

# Indenting and brackets
if (y < 0 && debug) {
    message("Y is negative")
}

# Ctr+shift+A to quickly manually revert code according to the tsyle quide.
# To revert complete files --> use a package
