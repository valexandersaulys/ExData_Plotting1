graphics.off()

# Data Load (I make the assumption this isn't done beforehand)
raw_data <- read.csv('household_power_consumption.txt',header=TRUE,sep=";")
raw_data$Global_active_power <- as.numeric( as.character(raw_data$Global_active_power) )
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")
data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

# Set up TD variable to account for time
data$TD <- paste(data$Date, data$Time, sep=' ')
data$TD <- strptime(data$TD, "%Y-%m-%d %H:%M:%S")


# Actual plot:=================
graphics.off()
quartz(width=4.8, height=4.8)  # approximate resolution of samples in inches at 100dpi
plot.new()    # Begin by creating a new plot

plot(data$TD, as.numeric(as.character(data$Sub_metering_1)), pch='.', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_1)))
points(data$TD, as.numeric(as.character(data$Sub_metering_2)), pch='.', col='red', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_2)), col='red')
points(data$TD, as.numeric(as.character(data$Sub_metering_3)), pch='.', col='blue', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_3)), col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1), bty='o', col=c('black', 'red', 'blue'),y.intersp=0.8 ,cex=0.75)
title(cex.lab=0.75,xlab=" ", ylab="Energy sub metering")

# Write to file
#dev.copy(png, file = "plot3.png", width=504, height=504) 
quartz.save(file="plot3.png")
dev.off()
