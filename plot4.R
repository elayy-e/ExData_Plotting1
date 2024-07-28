setwd("C:/Users/hp/OneDrive/Documents/household_power_consumption") # New working directory assigned for the project

unzip(zipfile = "C:/Users/hp/OneDrive/Documents/exdata_data_household_power_consumption.zip") # unzipped file to my current wd

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") # Reading data in

data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # Subsetting data for getting exact dates that mentioned in task

date1 <- as.Date(data1[, 1], format = "%d/%m/%Y")

time1 <- strptime(data1[, 2], format = "%H:%M:%S")

X_axis <- as.POSIXct(paste(date1, data1[, 2]))

png(filename = "C:/Users/hp/OneDrive/Documents/household_power_consumption/plot4.png", 
    width = 480, height = 480, units = "px") # setting graphic device as png

par(mfrow = c(2,2))

plot(X_axis, data1[, 3], xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(X_axis, data1[, 5], xlab = "datetime", ylab = "Voltage", type = "l")

plot(X_axis, data1[, 7], xlab = "", ylab = "Energy sub metering", type = "l")

lines(X_axis, data1[, 8], col = "red")

lines(X_axis, data1[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), cex = 0.8, lty = 1 , bty = "n")

plot(X_axis, data1[, 4], xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off() # ending png. graphic device