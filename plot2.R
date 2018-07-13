##plot2

path <- "household_exploratory/household_power_consumption.txt"
data <- read.table(path,sep = ";",stringsAsFactors = FALSE)

colnames(data) <- data[1,]

data <- data[2:nrow(data),]


select_data <- data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]

dates <- strptime(paste(select_data$Date , select_data$Time,sep= " "),format = "%d/%m/%Y %H:%M:%S")

str(dates)

Global_active_power <- as.numeric(select_data$Global_active_power)

plot(dates,Global_active_power,type = "l",xlab = "",ylab = "Global_Active_power (kilowatts)" )

dev.copy(png,"plot2.png")
dev.off()