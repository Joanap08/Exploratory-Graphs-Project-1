## Read the text file

ele<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

##1.Trying to subset the datasets

eleright<-ele[which (ele$Date=="1/2/2007"|ele$Date=="2/2/2007"),]

#Creating Datetime so I could read properly my dates and time
# Strptime only works if it has both date and time. 
# Thats why it is paste in the same vector

datetime <- strptime(paste(eleright$Date,eleright$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globact <- as.numeric(eleright$Global_active_power)

#Creating the plot line and printing it
png("plot2.png", width=480, height=480)
plot(datetime, globact, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
