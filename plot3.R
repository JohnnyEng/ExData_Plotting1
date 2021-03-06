hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings= "?") 
hpcsub <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))
hpcsub$Date <- as.Date(hpcsub$Date, "%d/%m/%Y")
hpcsub$DateTime <- paste(hpcsub$Date, hpcsub$Time, sep = " ")
hpcsub$DateTime <- strptime(hpcsub$DateTime, "%Y-%m-%d %H:%M:%S") 
png(file="plot3.png", width=480, height=480)
plot(hpcsub$DateTime, hpcsub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
points(hpcsub$DateTime, hpcsub$Sub_metering_2, type="l", ylab=" ", xlab=" ", col = "red")
points(hpcsub$DateTime, hpcsub$Sub_metering_3, type="l", ylab=" ", xlab=" ", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
