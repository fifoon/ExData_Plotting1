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

#Plotting
hist(power_set$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

#Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
