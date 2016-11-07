file1 <- "/Users/styagi/Documents/coursera/exploratorydataanalysis/household_power_consumption.txt"
datafile <- read.table(file1,header=TRUE, sep=';',stringsAsFactors=FALSE, dec='.')

subdatafile <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]

datetime  <- paste(subdatafile$Date,subdatafile$Time)

subdatafile$Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")


globalActivePower <- as.numeric(subdatafile$Global_active_power)
globalReactivePower <- as.numeric(subdatafile$Global_reactive_power)
Voltage <- as.numeric(subdatafile$Voltage)
subMetering1 <- as.numeric(subdatafile$Sub_metering_1)
subMetering2 <- as.numeric(subdatafile$Sub_metering_2)
subMetering3 <- as.numeric(subdatafile$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(subdatafile$Datetime, globalActivePower, type="l", ylab="Global Active Power", xlab="")
plot(subdatafile$Datetime, Voltage, type="l", ylab="Voltage", xlab="datetime")


plot(subdatafile$Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subdatafile$Datetime, subMetering2, type="l", col="red")
lines(subdatafile$Datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(subdatafile$Datetime, globalReactivePower, type="l", ylab="Global Reactive Power", xlab="datetime")

dev.off()



