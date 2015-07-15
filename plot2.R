library(lubridate)
fileName <- "household_power_consumption.txt"
top5rows <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", nrows = 5)
classes <- sapply(top5rows, class)
raw_data <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", colClasses = classes)
selected <- raw_data[raw_data$Date == "1/2/2007"| raw_data$Date == '2/2/2007',]
rm(raw_data)
selected$Date <- as.Date(strptime(selected$Date, "%d/%m/%Y"))
selected$Time <- hms(selected$Time)
selected <-  cbind(selected, DateTime = selected$Date + selected$Time)
png(file = "plot2.png")
plot(selected$DateTime, selected$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts")
dev.off()