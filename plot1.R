file1 <- "/Users/styagi/Documents/coursera/exploratorydataanalysis/household_power_consumption.txt"
datafile <- read.table(file1,header=TRUE, sep=';',stringsAsFactors=FALSE, dec='.')
subdatafile <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
power <- as.numeric(subdatafile$Global_active_power)
hist(power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
