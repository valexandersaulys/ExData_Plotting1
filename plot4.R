# Data Load
raw_data <- read.table('household_power_consumption.txt',header=TRUE,sep=";")
raw_data$Global_active_power <- as.numeric( as.character(raw_data$Global_active_power) )
raw_data$Date <- as.Date(raw_data$Date, format="%d/%m/%Y")
data <- subset(raw_data, raw_data$Date == "2007-02-01" | raw_data$Date == "2007-02-02")

# Set up TD variable to account for time
data$TD <- paste(data$Date, data$Time, sep=' ')
data$TD <- strptime(data$TD, "%Y-%m-%d %H:%M:%S")

# Actual Plot:=========
graphics.off()   # clear whatever was previously on the screen
quartz(width=4.8, height=4.8)  # approximate resolution of samples in inches at 100dpi
plot.new()    # Begin by creating a new plot

par(mfrow=c(2,2))

# Plot Uno (Repeat from Plot One)
plot(data$TD, data$Global_active_power, pch='.', xlab=" ", ylab="Global Active Power", cex.lab=0.75, cex.axis=0.75)      
lines(data$TD, data$Global_active_power)

# Plot Dos
plot(data$TD, as.numeric(as.character(data$Voltage)), pch='.', cex.lab=0.75, xlab="datetime", ylab="Voltage", cex.axis=0.75)      
lines(data$TD, as.numeric(as.character(data$Voltage)))

# Plot Tres (Repeat from Plot Three)
plot(data$TD, as.numeric(as.character(data$Sub_metering_1)), pch='.', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_1)))
points(data$TD, as.numeric(as.character(data$Sub_metering_2)), pch='.', col='red', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_2)), col='red')
points(data$TD, as.numeric(as.character(data$Sub_metering_3)), pch='.', col='blue', cex.axis=0.75, ann=FALSE)      
lines(data$TD, as.numeric(as.character(data$Sub_metering_3)), col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), yjust=0, xjust=0, lty=c(1,1), bty='n', col=c('black', 'red', 'blue'),cex=0.5)
title(cex.lab=0.75,xlab=" ", ylab="Energy sub metering")

# Plot Cuatros
plot(data$TD, as.numeric(as.character(data$Global_reactive_power)), pch='.', cex.lab=0.75, xlab="datetime", ylab="Global_reactive_power", cex.axis=0.75)      
lines(data$TD, as.numeric(as.character(data$Global_reactive_power)))

quartz.save(file = "plot4.png")
dev.off()

