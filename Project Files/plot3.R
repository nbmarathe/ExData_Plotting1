## Ensure that "household_power_consumption.txt" file is present in the working directory

library(data.table)

#Set column type to "character" for all columns in the given data set
ColTyp <- c("character", "character", "character", "character", "character", "character", "character", "character", "character")

# Read content from the file into "data"
data <- fread("household_power_consumption.txt", colClasses = ColTyp, na.strings = "?")

#Subset data for 01/02/2007 and 01/02/2007 into "dat"
dat <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

dat <- dat[, DateTime:= paste(Date, Time)]   ## Add a new column "DateTime" by joining "Date" and "Time" columns

dat$DateTime <- as.POSIXct(strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S"))

## Plot the graph

png("plot3.png")
with(dat, plot(DateTime, Sub_metering_1, type= "n", ylab = " Entergy sub metering"))
with(dat, points(DateTime, Sub_metering_1, type="l", col = "black"))
with(dat, points(DateTime, Sub_metering_2, type="l", col = "red"))
with(dat, points(DateTime, Sub_metering_3, type="l", col = "blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()