
# Read the data into R (Assumes that data has been downloaded)
household_power_consumption <- read.csv("~/Growth/Coursera/EDA/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

#Subset the data to the dates interested
date_interested_1 <- c("1/2/2007")
subsetted_household_1 <- subset.data.frame(household_power_consumption, household_power_consumption$Date == date_interested_1, drop = FALSE)
date_interested_2 <- c("2/2/2007")
subsetted_household_2 <- subset.data.frame(household_power_consumption, household_power_consumption$Date == date_interested_2, drop = FALSE)
#Row bind the two data frames to create data frame of interest
subsetted_household <- rbind.data.frame(subsetted_household_1, subsetted_household_2)

#Change the column classes
subsetted_household$Global_active_power <- as.numeric(subsetted_household$Global_active_power)
subsetted_household$Global_reactive_power <- as.numeric(subsetted_household$Global_reactive_power)
subsetted_household$Voltage <- as.numeric(subsetted_household$Voltage)
subsetted_household$Global_intensity <- as.numeric(subsetted_household$Global_intensity)
subsetted_household$Sub_metering_1 <- as.numeric(subsetted_household$Sub_metering_1)
subsetted_household$Sub_metering_2 <- as.numeric(subsetted_household$Sub_metering_2)
subsetted_household$Sub_metering_3 <- as.numeric(subsetted_household$Sub_metering_3)

#Create new column called datetime of type PSOXit
library(lubridate)
subsetted_household$datetime <- paste(subsetted_household$Date, subsetted_household$Time, sep = " ")
subsetted_household$datetime <- dmy_hms(subsetted_household$datetime)

#Plot and save the second graph
with(subsetted_household, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power"), xlab = " ")
png(filename = "Plot2.png",
    width = 480, height = 480)
dev.off()


