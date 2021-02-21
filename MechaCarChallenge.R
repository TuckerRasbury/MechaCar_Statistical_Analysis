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

# Results, interpreting p-value and r-squared 
# P-value 
# vehicle_length and ground_clearance had statistically significant impact on mpg. 
# However, the intercept also was statistically significant leading me to believe 
# that there are material variables not included in this regression.

# R-squared
# The r-squared value denotes that the model is a strong predictor of mpg.

# ------------------ Deliverable 2

#Reading in .csv
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
head(Suspension_Coil)

# Write an RScript that creates a total_summary dataframe 
  # using the summarize() 
  # get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
head(total_summary)

# Write an RScript that creates a lot_summary dataframe 
  # using the group_by() and the summarize() functions 
  # to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
head(lot_summary)

# ------------------ Deliverable 3
?t.test()

# T.Test(All Lots)
# Use the t.test() function to determine if the PSI **across all manufacturing lots**
# is statistically different from the population mean of 1,500 pounds per square inch

# Visualize Distribution
all_lots_table <- Suspension_Coil %>% sample_n(50) 
plt <- ggplot(all_lots_table,aes(x=PSI)) 
plt + geom_density() 

# t.test() on all lots
t.test(x=Suspension_Coil$PSI, mu=1500)

# Results, interpreting t.tests(All Lots)
# Failed to reject that there is a statistical difference from the sample mean and population mean.

# T.Test(Grouped by Lot)

## Lot 1
Lot1 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot1') 
t.test(x=Lot1$PSI, mu=1500) 

## Lot 2
Lot2 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot2')
t.test(x=Lot2$PSI, mu=1500) 

# Lot 3
Lot3 <- subset(Suspension_Coil, Manufacturing_Lot=='Lot3')
t.test(x=Lot3$PSI, mu=1500) 

# Results, interpreting t.tests(sampled by lot#)
# Failed to reject that there is a statistical difference from the sample mean and population mean 
# for all three lots.

# ----------------------------------------------------- Additional Notes
# INTERPRETING "R" RESULTS
# Absolute Value of r	 ------- + Strength of Correlation
#                   r < 0.3	   | None or very weak
#               0.3 ≤ r < 0.5  | Weak
#               0.5 ≤ r < 0.7	 | Moderate
#                     r ≥ 0.7	 | Strong
#
# MODEL T.TEST()
# may or may not need log10
# t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means
# mu = a number indicating the true value of the mean (or difference in means if you are performing a two sample test).