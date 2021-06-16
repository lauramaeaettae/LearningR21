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
    rename(physically_active = phys_active)

# Ex. 9.9

nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_diagnosis_age = diabetes_age)

# Re-write with pipe
select(nhanes_small, bmi, contains("age"))

nhanes_small %>% select(bmi, contains("age"))

# Re-write with pipe
physical_activity <- select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)

physical_activity <- nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

## Filtering

# Filter for all females
nhanes_small %>%
    filter(sex == "female")

# Filter non-female
nhanes_small %>%
    filter(sex != "female")

# Filter BMI=25
nhanes_small %>%
    filter(bmi == 25)

# Filter bmi > 25
nhanes_small %>%
    filter(bmi >= 25)

# Filtering by several variables (bmi is 25 and sex is female) with AND
nhanes_small %>%
    filter(bmi>25 & sex == "female")

# with OR
nhanes_small %>%
    filter(bmi > 25 | sex == "female")

## Arranging data

# Arranging by age
nhanes_small %>%
    arrange(age) # ascending order by default

# by sex
nhanes_small %>%
    arrange(sex) # alphabetical order by default

# by descending order for age
nhanes_small %>%
    arrange(desc(age))

# by several variables, first sex, then age
nhanes_small %>%
    arrange(sex, age)

# to switch sexes but keep age ascending
nhanes_small %>%
    arrange(desc(sex), age)

## Transform or add columns

# Mutate height in cm to height in m
nhanes_small %>%
    mutate(height = height / 100) # new col = old col

# Add new col with log-height
nhanes_small %>%
    mutate(log_height = log(height))

# mutate several columns
nhanes_small %>%
    mutate(height = height /100,
           log_height = log(height))

# mutate with logical operators
nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "yes", "no"))

# Save new dataframe
nhanes_update <- nhanes_small %>%
    mutate(height = height / 100,
           log_height = log(height),
           highly_active = if_else(phys_active_days >= 5, "yes", "no"))

str(nhanes_update)
