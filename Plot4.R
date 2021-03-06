#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

#plot4
par(mfrow=c(2,2))
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Voltage~data$DateTime, type="l", ylab="Voltage", xlab="datetime")
with(data, {
       plot(Sub_metering_1~DateTime, type="l",
                       ylab="Energy Sub Metering", xlab="", cex=0.8)
       lines(Sub_metering_2~DateTime, col='Red')
       lines(Sub_metering_3~DateTime, col='Blue')
       legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
                           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
   })
plot(data$Global_reactive_power~data$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()