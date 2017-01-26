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
png(filename = "Plot3.png",width = 480, height = 480)
plot(EDC$datetime, EDC$Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = "")
lines(EDC$datetime, EDC$Sub_metering_2, col = "red")
lines(EDC$datetime, EDC$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), xjust = 1)


#Disconnect the connection
dev.off()
