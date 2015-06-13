sample <- read.csv2("household_power_consumption.txt")
elec <- subset(sample, sample$Date %in% c("2/2/2007","1/2/2007"))
elec[,3] <- as.numeric(as.character(elec[,3]))
elec$datetime <- as.POSIXct(paste(elec$Date,elec$Time), format = "%d/%m/%Y %H:%M:%S")
plot(elec$datetime, elec[,3],type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()

#take a subset of the huge data frame for the required dates
#convert global active power column from factor to numeric
# make a separate column where the date and time are read together corresponding to one another.
# This is necesaary for plotting the graph