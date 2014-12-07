## Ensure that "household_power_consumption.txt" file is present in the working directory

library(data.table)

#Set column type to "character" for all columns in the given data set
ColTyp <- c("character", "character", "character", "character", "character", "character", "character", "character", "character")

# Read content from the file into "data"
data <- fread("household_power_consumption.txt", colClasses = ColTyp, na.strings = "?")

#Subset data for 01/02/2007 and 01/02/2007 into "dat"
dat <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## Plot histogram 
png("plot1.png")

with(dat, hist(as.numeric(dat$Global_active_power), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()