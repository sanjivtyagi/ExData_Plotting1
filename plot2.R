file1 <- "/Users/styagi/Documents/coursera/exploratorydataanalysis/household_power_consumption.txt"
datafile <- read.table(file1,header=TRUE, sep=';',stringsAsFactors=FALSE, dec='.')

subdatafile <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]

datetime  <- paste(subdatafile$Date,subdatafile$Time)

subdatafile$Datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))

plot(subdatafile$Global_active_power~subdatafile$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

