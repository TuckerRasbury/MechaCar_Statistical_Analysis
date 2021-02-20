# Challenge 15 - R

# ------------------ Deliverable 1
## Tip: Remember to keep track of past and current working directories

# Library imports
library(dplyr)

#Reading in .csv
## ?read.csv()
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg)

# Perform linear regression
  # using the lm() function; use ?lm() for help
  # passin all six variables (i.e., columns), 
  # and add the dataframe created as the data parameter.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

# Determine p-value and r-squared value for the linear regression model