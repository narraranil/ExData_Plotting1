#downloading the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile ="datfile.zip")
unzip("datfile.zip",exdir=".")

#Reading CSV Files
data_full <- read.csv("household_power_consumption.txt",na.strings="?",sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#plotting Plot1
hist(as.numeric(data$Global_active_power)/1000,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

