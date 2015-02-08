## Reading entire Data set from household_power_consumption.txt 
completeDataSet <- read.table("./household_power_consumption.txt" , header = TRUE, sep = ";", quote = '\"', na.strings = "?", stringsAsFactors = FALSE, dec = ".") 

## Subsetting data using the date range from dates 2007-02-01 and 2007-02-02
subSetData0102 <- completeDataSet[completeDataSet$Date %in% c("1/2/2007","2/2/2007") ,] 

##Clearing memory by removimg completeDataSet
rm(completeDataSet)
 

#Converting Global_Active_Power using as.numeric function
convertedGlobalActivePower <- as.numeric(subSetData0102$Global_active_power) 

## Ploting and saving to file in plot1.png with width=480, height=480

## Plot & check in display first to debug
hist(convertedGlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

## Save plot in plot1.png
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
dev.off()
