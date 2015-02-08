plot4 <- function(){
        data<-subset(read.table("household_power_consumption.txt", header=TRUE, 
                                sep=";", na.strings="?"), 
                     Date=="1/2/2007"|Date=="2/2/2007")
        data$T<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
        data$wday<-format(data$T,"%a")
        
        par(mfrow=c(2,2))
        plot(data$T,data$Global_active_power,type="l", xlab="", 
             ylab="Global Active Power (kilowatts)")
        plot(data$T,data$Voltage,type="l", xlab="datetime", 
             ylab="Voltage")
        plot(data$T,data$Sub_metering_1,type="l",xlab="", 
             ylab="Energy sub metering")
        lines(data$T,data$Sub_metering_2,col="red")
        lines(data$T,data$Sub_metering_3,col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),lty=1)
        plot(data$T,data$Global_reactive_power, type="l", xlab="datatimes")
        
        dev.copy(png, file="plot4.png")
        dev.off()
}