#plot 3

path <- "household_exploratory/household_power_consumption.txt"
data <- read.table(path,sep = ";",stringsAsFactors = FALSE)

colnames(data) <- data[1,]

data <- data[2:nrow(data),]


select_data <- data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]

dates <- strptime(paste(select_data$Date , select_data$Time,sep= " "),format = "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(select_data$Sub_metering_1)
sub_metering_2 <- as.numeric(select_data$Sub_metering_2)
sub_metering_3 <- as.numeric(select_data$Sub_metering_3)

plot(dates,sub_metering_1,type = "l" ,ylab = "Energy sub metering",xlab = "")
lines(dates,sub_metering_2,col = "red")
lines(dates,sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","blue","red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png")
dev.off()