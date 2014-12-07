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

png("plot2.png")
with(dat, plot(Global_active_power, type = "l", ylab = "Global Active Power(kilowatts"))
dev.off()