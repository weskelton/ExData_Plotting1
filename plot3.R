## download the zipped dataset from the internet and save it in a temp file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

## read the data from the temp file into a dataframe 
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=TRUE, na.strings = "?")

## create a dataframe with a subset of the original
dataToUse <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## create a timestamp value for plotting purposes
dataToUse$timestamp <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## open a graphics file for the output of the plot
png("plot3.png", width=580, height=580) 

## create a plot of sub metering over time
plot(dataToUse$timestamp, dataToUse$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dataToUse$timestamp, dataToUse$Sub_metering_2, type="l", col="red")
lines(dataToUse$timestamp, dataToUse$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

##close the graphics file
dev.off()

