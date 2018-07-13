path <- "household_exploratory/household_power_consumption.txt"
data <- read.table(path,sep = ";",stringsAsFactors = FALSE)

colnames(data) <- data[1,]

data <- data[2:nrow(data),]


select_data <- data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]

dates <- strptime(paste(select_data$Date , select_data$Time,sep= " "),format = "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(select_data$Sub_metering_1)
sub_metering_2 <- as.numeric(select_data$Sub_metering_2)
sub_metering_3 <- as.numeric(select_data$Sub_metering_3)


Global_active_power <- as.numeric(select_data$Global_active_power)

Global_reactive_power <- as.numeric(select_data$Global_reactive_power)


Voltage <- as.numeric(select_data$Voltage)

grid <- matrix(c(1,2,3,4),nrow = 2, byrow = TRUE)

layout(grid)
plot(dates,Global_active_power,type = "l",xlab = "",ylab = "Global_Active_power (kilowatts)" )

plot(dates,Voltage,type = "l",xlab = "datetime",ylab = "Voltage" )

plot(dates,sub_metering_1,type = "l" ,ylab = "Energy sub metering",xlab = "")
lines(dates,sub_metering_2,col = "red")
lines(dates,sub_metering_3,col="blue")
legend("topright",lty = 1,lwd = 2 ,inset = 0.015,box.col = "white",cex= 0.7,col = c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dates,Global_active_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power" )

dev.copy(png,"plot4.png")
dev.off()
