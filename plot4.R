## Reading entire Data set from household_power_consumption.txt 
completeDataSet <- read.table("./household_power_consumption.txt" , header = TRUE, sep = ";", quote = '\"', na.strings = "?", stringsAsFactors = FALSE, dec = ".") 

## Subsetting data using the date range from dates 2007-02-01 and 2007-02-02
subSetData0102 <- completeDataSet[completeDataSet$Date %in% c("1/2/2007","2/2/2007") ,] 

##Clearing memory by removimg completeDataSet
rm(completeDataSet)


#Converting Date & Time using strptime function  
convertedDateTime <- strptime(paste(subSetData0102$Date, subSetData0102$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

#Converting Global_Active_Power using as.numeric function  
convertedGlobalActivePower <- as.numeric(subSetData0102$Global_active_power)

#Converting Global_Reactive_Power using as.numeric function  
convertedGlobalReactivePower <- as.numeric(subSetData0102$Global_reactive_power)

#Converting Global_Reactive_Power using as.numeric function  
convertedVoltage <- as.numeric(subSetData0102$Voltage)

#Converting all sub_metering_n using as.numeric function  
convertedSubMetering1  <- as.numeric(subSetData0102$Sub_metering_1) 
convertedSubMetering2  <- as.numeric(subSetData0102$Sub_metering_2) 
convertedSubMetering3  <- as.numeric(subSetData0102$Sub_metering_3) 

## Ploting and Saving to file in plot4.png

## Plotting the graph using plot function

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  

#1-1  Global Active Power Plot 
plot(convertedDateTime, convertedGlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) 

# 1-2 Voltage Plot 
plot(convertedDateTime, convertedVoltage, type="l", xlab="datetime", ylab="Voltage") 

# 2-1 Energy Sub Metering  Plot 
plot(convertedDateTime, convertedSubMetering1, type="l", ylab="Energy Sub metering", xlab="") 
lines(convertedDateTime, convertedSubMetering2, type="l", col="red") 
lines(convertedDateTime, convertedSubMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n") 

#2-2 Global Reactive Power Plot 
plot(convertedDateTime, convertedGlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") 
