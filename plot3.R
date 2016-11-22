#read the dataset
ele<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = '?')

##1.Trying to subset the datasets

eleright<-ele[which (ele$Date=="1/2/2007"|ele$Date=="2/2/2007"),]


#Creating Datetime so I could read properly my dates and time
# Strptime only works if it has both date and time. 
# Thats why it is paste in the same vector
datetime <- strptime(paste(eleright$Date,eleright$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subm1<-as.numeric(eleright$Sub_metering_1)
subm2<-as.numeric(eleright$Sub_metering_2)
subm3<-as.numeric(eleright$Sub_metering_3)

# create the plots 
png("plot3.png", width = 480, height = 480)
plot(datetime, subm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,subm2, type="l", col="red")
lines(datetime,subm3, type="l", col="blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
