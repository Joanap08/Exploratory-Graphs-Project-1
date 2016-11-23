## Read the text file
ele<-read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = F, quote = '\"', dec = '.')

##1.Trying to subset the datasets

## 1st possible way I found by myself
eleright<-ele[which (ele$Date=="1/2/2007"|ele$Date=="2/2/2007"),]

#convert dates
datetime <- strptime(paste(eleright$Date,eleright$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow=c(2,2),mar=c(4,4,2,1))
#1plot
globact <- as.numeric(eleright$Global_active_power)
plot(datetime, globact, type="l", xlab="", ylab="Global Active Power")

#2 plot
volt<-as.numeric(eleright$Voltage)
plot(datetime,volt, type = 'l',xlab= "datetime", ylab="Voltage")

#3plot
subm1<-as.numeric(eleright$Sub_metering_1)
subm2<-as.numeric(eleright$Sub_metering_2)
subm3<-as.numeric(eleright$Sub_metering_3)
plot(datetime, subm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,subm2, col="red")
lines(datetime,subm3, col="blue")
legend("topright",col = c("black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1)

#plot4
globreact<-as.numeric(eleright$Global_reactive_power)
plot(datetime,globreact, type = 'l',xlab= "datetime", ylab="Global_reactive_power")

dev.copy(png, 'plot4.png',width=480, height=480)
dev.off()
