#Load file into R
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

#Convert dates into better format
data$Date<-strptime(data$Date,"%d/%m/%Y")

#Pick only needed data for plot nr.2
plotData<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

#Create new variable and convert formats
plotData$Date_Time<-paste(plotData$Date,plotData$Time)
plotData$Date_Time<-strptime(plotData$Date_Time, "%Y-%m-%d %H:%M:%S")

plotData$Global_active_power<-as.character(plotData$Global_active_power)
plotData$Global_reactive_power<-as.character(plotData$Global_reactive_power)
plotData$Voltage<-as.character(plotData$Voltage)
plotData$Sub_metering_1<-as.character(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.character(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.character(plotData$Sub_metering_3)


plotData$Global_active_power<-as.numeric(plotData$Global_active_power)
plotData$Global_reactive_power<-as.numeric(plotData$Global_reactive_power)
plotData$Voltage<-as.numeric(plotData$Voltage)
plotData$Sub_metering_1<-as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.numeric(plotData$Sub_metering_3)

#Set correct settings for 4 plots in one image
par(mfrow=c(2,2),mar=c(4,4,4,4), cex.lab=0.5)

#Create plots
with (plotData, {
      plot(plotData$Date_Time,plotData$Global_active_power, 
       xlab="",
       ylab="Global active power",
       type="l")
      
      plot(plotData$Date_Time,plotData$Voltage, 
           xlab="datetime",
           ylab="Voltage",
           type="l")
  
      
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
             border="white",
             col=c('black','red','blue'),
             c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
             lty=1,
             lwd=1,
             cex=0.5,
             bty="n"   
      )
      
      plot(plotData$Date_Time,plotData$Global_reactive_power, 
           xlab="datetime",
           ylab="Global_reactive_power",
           type="l")
      
    
    })

#Save plot
dev.copy(png,"plot4.png")
dev.off()


