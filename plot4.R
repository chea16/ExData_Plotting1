sample <- read.csv2("household_power_consumption.txt")
elec <- subset(sample, sample$Date %in% c("2/2/2007","1/2/2007"))
elec[,3] <- as.numeric(as.character(elec[,3]))
elec$datetime <- as.POSIXct(paste(elec$Date,elec$Time), format = "%d/%m/%Y %H:%M:%S")
elec[,7] <- as.numeric(as.character(elec[,7]))
elec[,8] <- as.numeric(as.character(elec[,8]))
elec[,9] <- as.numeric(as.character(elec[,9]))
elec[,4] <- as.numeric(as.character(elec[,4]))
elec[,5] <- as.numeric(as.character(elec[,5]))
par(mfrow = c(2,2))
with(elec,{
  plot(datetime, Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(datetime, Voltage)
})
  with(elec,{plot(elec$datetime, elec[,7],type="l", xlab="", ylab="Energy sub metering")
  lines(elec$datetime,elec[,8], col = "red")
  lines(elec$datetime,elec[,9], col = "blue")
  legend("topright", lty = c(1,1,1),bty = "n",y.intersp = 0.3, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)
  
})
  with(elec,plot(datetime,Global_reactive_power,type="l"))
dev.copy(png, file = "plot4.png")
dev.off()