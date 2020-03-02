# Plot 2 Script
#Reading the source file
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?", 
                        colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filtering data to keep only two specific days
Sub_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]

#Creating Datetime variable by combining Date and Time
Datetime <-strptime(paste(Sub_powerdata$Date,Sub_powerdata$Time, sep = " "),"%d/%m/%Y %H:%M:%S")

#Plotting the second Plot
png("plot2.png", width = 480, height = 480)
plot(Datetime, Sub_powerdata$Global_active_power, type="l", xlab="",ylab ="Global Active Power (kilowatts)")
dev.off()
