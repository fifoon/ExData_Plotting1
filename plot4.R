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

##plotting 4 
par(mfrow=c(2,2), mar=c(4,4,2,2)) 
with(power_set, { 
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="", ) 
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="Datetime") 
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="") 
  
  lines(Sub_metering_2~Datetime,col='Red') 
  lines(Sub_metering_3~Datetime,col='Blue') 
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", cex=0.5, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_Rective_Power",xlab="Datetime") }) 


dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off()
