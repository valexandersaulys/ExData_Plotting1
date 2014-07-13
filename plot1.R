# Data Load (this is assuming the data isn't already loaded)
# Note: the actual "household_power_consumption.txt" was far too 
# large for github to handle, so the assumption is that its there
# 
raw_data <- read.csv('household_power_consumption.txt',header=TRUE,sep=";")
raw_data$Global_active_power <- as.numeric( as.character(raw_data$Global_active_power) )
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")
data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

# Actual plot:=================
graphics.off() # clear everything previously up
quartz(width=4.8, height=4.8) # Using Mac OS X if that wasn't apparent, tried to get resolution close to the samples given
plot.new()    # Begin by creating a new plot

#Plot 1 as Histogram
hist(data$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))

quartz.save(file="plot1.png") # finally save the file to a png named "plot1.png"
dev.off()