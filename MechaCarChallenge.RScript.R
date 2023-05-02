library(dplyr)

#Import CSV
MechaCar_data <- read.csv(file="MechaCar_mpg.csv")

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_data)

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_data))

# Part 2 import csv
suspension_coil <- read.csv(file="Suspension_Coil.csv")

# create a total_summary df
total_summary <- summarize(suspension_coil, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# create lot_summary df using groupby() and summarize() use pipe function 16.2.5
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize( mean(PSI), median(PSI),var(PSI),sd(PSI))

# part 3 write t.test() function to determine PSI for each lot to see if different from pop mean of 1500
t.test(suspension_coil$PSI, mu=1500)


# write 3 scripts using t.test and subset() on all 3 lots to determine if PSI is different for 1500 mean

t.test(subset(suspension_coil, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)

#2nd lot test

t.test(subset(suspension_coil, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)

#3rd lot test

t.test(subset(suspension_coil, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

