getwd()
setwd("C://Users//milic//Desktop///DataScientistCourse//ExploratoryAnalysis//exdata%2Fdata%2Fhousehold_power_consumption")

install.packages("dplyr")
library(dplyr)
## Read the text file
ele<-read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = F, quote = '\"', dec = '.')

##1.Trying to subset the datasets

eleright<-ele[which (ele$Date=="1/2/2007"|ele$Date=="2/2/2007"),

#read dates and time
## Converting dates
datetime <- paste(as.Date(eleright$Date), eleright$Time)
eleright$Datetime <- as.POSIXct(datetime)

eleright$Date <- as.Date(ele$Date, format="%d/%m/%Y")


#2.Global Active power hist.
eleglobact<-as.numeric(eleright$Global_active_power)
hist(eleglobact, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Saving the png
dev.copy(png, 'plot1.png',width=480, height=480)
dev.off()
