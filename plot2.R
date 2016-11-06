#Read in data
power <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE , na.strings = "?") 
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#subset to from the dates 2007-02-01 and 2007-02-02. 
power_set <- subset(power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#remove all
rm(power)

#converting date
datetime <- paste(as.Date(power_set$Date), power_set$Time)
power_set$Datetime <- as.POSIXct(datetime)

#plotting 2
plot(power_set$Global_active_power~power_set$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off()  

