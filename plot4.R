# Plot 4 Script
#Reading the source file
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?", 
                        colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filtering data to keep only two specific days
Sub_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]

#Creating Datetime variable by combining Date and Time
Datetime <-strptime(paste(Sub_powerdata$Date,Sub_powerdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Plotting the forth Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#Plot 1 from upper left
plot(Datetime, Sub_powerdata$Global_active_power, type="l", xlab="",ylab ="Global Active Power (kilowatts)")
#Plot 2 from upper left
plot(Datetime, Sub_powerdata$Voltage, type="l", xlab="datetime",ylab ="Voltage")
#Plot 3 from upper left
plot(Datetime, Sub_powerdata$Sub_metering_1, type="l",ylab ="Energy sub metering")
lines(Datetime, Sub_powerdata$Sub_metering_2, col ="red")
lines(Datetime, Sub_powerdata$Sub_metering_3, col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Plot 4 from upper left
plot(Datetime, Sub_powerdata$Global_reactive_power, type="l", xlab="datetime",ylab ="Voltage")

dev.off()