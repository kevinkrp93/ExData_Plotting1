##plot1 

path <- "household_exploratory/household_power_consumption.txt"
data <- read.table(path,sep = ";",stringsAsFactors = FALSE)

colnames(data) <- data[1,]

data <- data[2:nrow(data),]


data$Date <- as.Date(data$Date,format = "%d/%m/%Y")


select_data <- data[data$Date >= "2007-02-01" & data$Date <="2007-02-02",]

Global_active_power <- as.numeric(select_data$Global_active_power)

hist(Global_active_power,main = "Global Active Power",xlab = " Global Active Power (kilowatts)",ylab = "frequency", col = "red")
dev.copy(png,"plot1.png")
dev.off()

