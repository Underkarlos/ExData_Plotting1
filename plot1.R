datos <- fread("household_power_consumption.txt", sep=";", header=TRUE,colClasses = "character")
datos [, Date :=as.Date(Date, format='%d/%m/%Y')]
datos <- datos[datos$Date %between% c("2007/02/01", "2007/02/02")]
x <- as.numeric(datos$Global_active_power)
par(mfrow = c(1, 1))
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480,height=480)
dev.off()