plot1 <- function(){
        data<-subset(read.table("household_power_consumption.txt", header=TRUE, 
                                sep=";", na.strings="?"), 
                     Date=="1/2/2007"|Date=="2/2/2007")
        data$T<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
        data$wday<-format(data$T,"%a")
        
        par(mfrow=c(1,1))
        hist(data$Global_active_power,col="red",main="Global Active Power", 
             xlab="Global Active Power (kilowatts)")
        
        dev.copy(png, file="plot1.png")
        dev.off()
}