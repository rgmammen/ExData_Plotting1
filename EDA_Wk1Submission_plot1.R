# Read the data into R
#Define the column classes first
col_class <- c("character", "character", rep("numeric",7))
# Read the data into dataframe
household_power_consumption <- read.csv("~/Growth/Coursera/EDA/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, colClasses = col_class, na.strings = "?")

#Subset the data to the dates interested
EDC <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"),]

#Plot the histogram and save the file
png(filename = "Plot1.png",width = 480, height = 480)
with(EDC, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"), ylim = c(0,1200), units = "px")

#Disconnect the connection
dev.off()
