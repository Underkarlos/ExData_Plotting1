datos <- fread("household_power_consumption.txt", sep=";", header=TRUE,colClasses = "character")
datos [, Date :=as.Date(Date, format='%d/%m/%Y')]
datos <- datos[datos$Date %between% c("2007/02/01", "2007/02/02")]
datos[,tiempo:=paste(datos$Date,datos$Time)]
x <- as.numeric(datos$Sub_metering_1)
y <- as.numeric(datos$Sub_metering_2)
z <- as.numeric(datos$Sub_metering_3)
t <-as.POSIXlt(datos$tiempo, format="%Y-%m-%d %H:%M:%S")
with(datos,{
        x <- as.numeric(datos$Sub_metering_1)
        y <- as.numeric(datos$Sub_metering_2)
        z <- as.numeric(datos$Sub_metering_3)
        t <-as.POSIXlt(datos$tiempo, format="%Y-%m-%d %H:%M:%S")
        h <- as.numeric(datos$Global_active_power)
        v <- as.numeric(datos$Voltage)
        r <- as.numeric(datos$Global_reactive_power)
        par(mfrow = c(2, 2))
        plot(t,h, xlab="",ylab="Global Active Power", type="l")
        plot(t,v, xlab="datetime",ylab="Voltage", type="l")
        plot(t,x, xlab="", ylab="Energysub metering", type="l")
        lines(t,y, type="l", col="red")
        lines(t,z, type="l", col="blue")
        legend("topright", cex=0.75 ,bty="n", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(t,r, xlab="datetime",ylab="Global_reactive_power", type="l")
         }
     )
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()