datos <- fread("household_power_consumption.txt", sep=";", header=TRUE,colClasses = "character")
datos [, Date :=as.Date(Date, format='%d/%m/%Y')]
datos <- datos[datos$Date %between% c("2007/02/01", "2007/02/02")]
datos[,tiempo:=paste(datos$Date,datos$Time)]
dias <- weekdays(datos$Date)
datos [,dias :=weekdays(datos$Date)]
x <- as.numeric(datos$Global_active_power)
y <-as.POSIXlt(datos$tiempo, format="%Y-%m-%d %H:%M:%S") 
plot(y,x, ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()