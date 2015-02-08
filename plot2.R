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


## Ploting and Saving to file in plot2.png

## Plotting the graph using plot function 
plot(convertedDateTime, convertedGlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 

## Save plot in plot2.png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
