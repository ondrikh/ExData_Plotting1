#Load file into R
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert dates into better format
data$Date<-strptime(data$Date,"%d/%m/%Y")

#Pick only needed data for plot nr.2
plotData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",c(1,2,7,8,9)]

#Create new variable and convert formats
plotData$Date_Time<-paste(plotData$Date,plotData$Time)
plotData$Date_Time<-strptime(plotData$Date_Time, "%Y-%m-%d %H:%M:%S")

plotData$Sub_metering_1<-as.character(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.character(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.character(plotData$Sub_metering_3)

plotData$Sub_metering_1<-as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.numeric(plotData$Sub_metering_3)

#Create plot
plot(plotData$Date_Time,plotData$Sub_metering_1, 
     xlab="",
     ylab="Energy sub metering",
     type="l",
     col="black")

lines(plotData$Date_Time,plotData$Sub_metering_2,
      type="l",
      col="red")

lines(plotData$Date_Time,plotData$Sub_metering_3,
      type="l",
      col="blue")


legend("topright",
       border="black",
       col=c('black','red','blue'),
       c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1,
       lwd=1,
       cex=0.9     
       )

#Save plot
dev.copy(png,"plot3.png")
dev.off()