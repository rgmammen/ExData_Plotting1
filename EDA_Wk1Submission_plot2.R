# Read the data into R
#Define the column classes first
col_class <- c("character", "character", rep("numeric",7))
# Read the data into dataframe
household_power_consumption <- read.csv("~/Growth/Coursera/EDA/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, colClasses = col_class, na.strings = "?")

#Subset the data to the dates interested
EDC <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Create a datetime column and then convert it from class character
library(lubridate)
EDC$datetime <- paste(EDC$Date, EDC$Time, sep = " ")
EDC$datetime <- dmy_hms(EDC$datetime)

#Plot the line graph and save the file
png(filename = "Plot2.png",width = 480, height = 480)
with(EDC, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = " "))

#Disconnect the connection
dev.off()
