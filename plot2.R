# Data Load
raw_data <- read.csv('household_power_consumption.txt',header=TRUE,sep=";")
raw_data$Global_active_power <- as.numeric( as.character(raw_data$Global_active_power) )
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")
data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

# Set up TD variable to account for time
data$TD <- paste(data$Date, data$Time, sep=' ')
data$TD <- strptime(data$TD, "%Y-%m-%d %H:%M:%S")


# Actual plot:=================
graphics.off() # clear everything previously up
quartz(width=4.8, height=4.8) # approximate resolution of samples in inches at 100dpi
plot.new()    # Begin by creating a new plot

# Plotting with smallest point possible (hence pch='.'), ann="false" to prevent immediate plotting
plot(data$TD, data$Global_active_power, pch='.', ann=FALSE)      

# Plotting lines onto the plot created above, these lines simply connect each point to the next
lines(data$TD, data$Global_active_power)

# Finalize the correct labels on the x and y axis, no title given so none included
title(xlab=" ", ylab="Global Active Power (kilowatts)")

quartz.save(file="plot2.png") # save plot to a file named "plot2.png
dev.off() # close the graphics device
