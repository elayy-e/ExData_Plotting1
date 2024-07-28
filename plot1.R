setwd("C:/Users/hp/OneDrive/Documents/household_power_consumption") # New working directory assigned for the project

unzip(zipfile = "C:/Users/hp/OneDrive/Documents/exdata_data_household_power_consumption.zip") # unzipped file to my current wd

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # Subsetting data for getting exact dates that mentioned in task

png(filename = "C:/Users/hp/OneDrive/Documents/household_power_consumption/plot1.png", width = 480, height = 480, units = "px") # setting graphic device as png

hist(data1$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)") # first diagram

dev.off() # ending png. graphic device