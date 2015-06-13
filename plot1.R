  sample <- read.csv2("household_power_consumption.txt")
  elec2 <- subset(sample, sample$Date %in% c("2/2/2007","1/2/2007"))
  elec2[,3] <- as.numeric(as.character(elec2[,3]))
  hist(elec2[,3], xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
  dev.copy(png, file = "plot1.png")
  dev.off()

  #take a subset of the huge data frame for the required dates
  #convert global active power column from factor to numeric