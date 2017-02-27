library(lubridate)

#Import data and Select the dates
allData <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
allData$Date2 <- as.Date(allData$Date, format = "%d/%m/%Y")
selData <- subset(allData, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Transform the data so it can be plotted
selData$Sub_metering_1 <- as.numeric(as.character(selData$Sub_metering_1))
selData$Sub_metering_2 <- as.numeric(as.character(selData$Sub_metering_2))
selData$Sub_metering_3 <- as.numeric(as.character(selData$Sub_metering_3))
selData$Date2 <- dmy_hms(paste(selData$Date, selData$Time))

#Plot it
png(filename = "plot3.png")
with(selData, plot(Date2, Sub_metering_1, type= "l", xlab = NA, ylab = "Energy sub metering"))
with(selData, lines(Date2, Sub_metering_2, col = "red"))
with(selData, lines(Date2, Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.8)
dev.off()
