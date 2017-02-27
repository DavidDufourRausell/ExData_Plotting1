library(lubridate)

#Import data and Select the dates
allData <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
allData$Date2 <- as.Date(allData$Date, format = "%d/%m/%Y")
selData <- subset(allData, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Transform the data so it can be plotted
selData$Global_active_power <- as.numeric(as.character(selData$Global_active_power))
selData$Date2 <- dmy_hms(paste(selData$Date, selData$Time))

#Plot it
png(filename = "plot2.png")
with(selData, plot(Date2, Global_active_power, type= "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))
dev.off()





