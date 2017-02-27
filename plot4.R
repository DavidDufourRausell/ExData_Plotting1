library(lubridate)

#Import data and Select the dates
allData <- read.table("household_power_consumption.txt", sep = ';', header = TRUE)
allData$Date2 <- as.Date(allData$Date, format = "%d/%m/%Y")
selData <- subset(allData, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Transform the data so it can be plotted
selData$Date2 <- dmy_hms(paste(selData$Date, selData$Time))
selData$Global_active_power <- as.numeric(as.character(selData$Global_active_power))
selData$Sub_metering_1 <- as.numeric(as.character(selData$Sub_metering_1))
selData$Sub_metering_2 <- as.numeric(as.character(selData$Sub_metering_2))
selData$Sub_metering_3 <- as.numeric(as.character(selData$Sub_metering_3))
selData$Voltage <- as.numeric(as.character(selData$Voltage))
selData$Global_reactive_power <- as.numeric(as.character(selData$Global_reactive_power))

#Plotting time
png(filename = "plot4.png")

#Multiple plot
par(mfcol = c(2,2), mar = c(5,5,2,1))

#First plot
with(selData, plot(Date2, Global_active_power, type= "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

#Second plot
with(selData, plot(Date2, Sub_metering_1, type= "l", xlab = NA, ylab = "Energy sub metering"))
with(selData, lines(Date2, Sub_metering_2, col = "red"))
with(selData, lines(Date2, Sub_metering_3, col = "blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.8)

#Third plot
with(selData, plot(Date2, Voltage, type= "l", xlab = "datetime", ylab = "Voltage"))

#Fourth plot
with(selData, plot(Date2, Global_reactive_power, type= "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()