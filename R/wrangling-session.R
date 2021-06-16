# Load packages
source(here::here("R/package_loading.R"))

# Glimpse the NHANES dataset
glimpse(NHANES)

# Column names
colnames(NHANES)

# Structure
str(NHANES)

# Summary
summary(NHANES)


# Selecting columns
select(NHANES, Age)

select(NHANES, Age, Weight, BMI)

# Exclude a column
select(NHANES, -HeadCirc)

# Selecting all columns starting with "BP"
select(NHANES, starts_with("BP"))

# Selecting columns ending with "day"
select(NHANES, ends_with("Day"))

# Selecting all columns with "age"
select(NHANES, contains("Age"))

?select_helpers # select help functions

# Select and select a subset of the dataset
nhanes_small <- select(NHANES, Age, Gender, Height, Weight, BMI, Diabetes,
                       DiabetesAge, PhysActiveDays, PhysActive, TotChol, BPSysAve,
                       BPDiaAve, SmokeNow, Poverty)
nhanes_small

## Renaming

# Renaming to snake_case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# Renaming specific columns
rename(nhanes_small, sex = gender) # new name = old name
# if you don't assign the action to an object it doesn't get saved
nhanes_small <- rename(nhanes_small, sex = gender)

## Learning to pipe %>%

nhanes_small %>% colnames()
# is equal to
colnames(nhanes_small)

# piping several functions together
nhanes_small %>%
    select(phys_active) %>%
    rename(physicalle_active = phys_active)
