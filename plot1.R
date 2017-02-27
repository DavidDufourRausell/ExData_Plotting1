#Import data and Select the dates
allData <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
allData$Date2 <- as.Date(allData$Date, format = "%d/%m/%Y")
selData <- subset(allData, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Transform the data so it can be plotted
global_active_power <- selData$Global_active_power
global_active_power <- as.numeric(as.character(global_active_power))
global_active_power <- global_active_power[!is.na(global_active_power)]

#Plot it
png(filename = "plot1.png")
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
