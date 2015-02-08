#Load file into R
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert dates into better format
data$Date<-strptime(data$Date,"%d/%m/%Y")

#Pick only needed data for plot nr.2
plotData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",c(1,2,3)]

#Create new variale and convert its format
plotData$Date_Time<-paste(plotData$Date,plotData$Time)
plotData$Date_Time<-strptime(plotData$Date_Time, "%Y-%m-%d %H:%M:%S")

#Create plot
plot(plotData$Date_Time,plotData$Global_active_power, 
     xlab="",
     ylab="Global active power (kilowatts)",
     type="l")

#Save plot
dev.copy(png,"plot2.png")
dev.off()