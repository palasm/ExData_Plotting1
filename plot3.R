## Reading entire Data set from household_power_consumption.txt 
completeDataSet <- read.table("./household_power_consumption.txt" , header = TRUE, sep = ";", quote = '\"', na.strings = "?", stringsAsFactors = FALSE, dec = ".") 

## Subsetting data using the date range from dates 2007-02-01 and 2007-02-02
subSetData0102 <- completeDataSet[completeDataSet$Date %in% c("1/2/2007","2/2/2007") ,] 

##Clearing memory by removimg completeDataSet
rm(completeDataSet)


#Converting Date & Time using strptime function  
convertedDateTime <- strptime(paste(subSetData0102$Date, subSetData0102$Time, sep = " "), "%d/%m/%Y %H:%M:%S")  

#Converting Global_Active_Power using as.numeric function  
convertedGlobalActivePower <- as.numeric(subSetData0102$Global_active_power)

#Converting all sub_metering_n using as.numeric function  
convertedSubMetering1  <- as.numeric(subSetData0102$Sub_metering_1) 
convertedSubMetering2  <- as.numeric(subSetData0102$Sub_metering_2) 
convertedSubMetering3  <- as.numeric(subSetData0102$Sub_metering_3) 
 
## Ploting and Saving to file in plot3.png

## Saving to file
png("plot3.png", width = 480, height = 480)

## Plotting the graph using plot function 
plot(convertedDateTime, convertedSubMetering1, type = "l", ylab = "Energy Sub metering", xlab = "") 
lines(convertedDateTime, convertedSubMetering2, type = "l", col = "red") 
lines(convertedDateTime, convertedSubMetering3, type = "l", col = "blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue")) 

dev.off()
