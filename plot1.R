#Load file into R
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert dates into better format
data$Date<-strptime(data$Date,"%d/%m/%Y")

#Pick only needed data for plot nr.1
plotData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",c(1,3)]
#And convert values of second column into numerics
plotData$Global_active_power<-as.character(plotData$Global_active_power)
plotData$Global_active_power<-as.numeric(plotData$Global_active_power)

#Create histogram
hist(plotData2$Global_active_power,
     c="red", 
     xlab="Global active power (kilowatts)",
     main="Global active power")

#Save plot
dev.copy(png,"plot1.png")
dev.off()