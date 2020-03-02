#Plot1 Script
#Reading the source file
powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";" , na.strings = "?", 
               colClasses = c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Filtering data to keep only two specific days
Sub_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]

#Converting Date format
Sub_powerdata$Date <- as.Date(Sub_powerdata$Date, format ="%d/%m/%Y")

#Plotting the first Plot
png("plot1.png", width = 480, height = 480)
hist(Sub_powerdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab ="Frequency", col = "Red")
dev.off()


