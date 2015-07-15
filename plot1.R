fileName <- "household_power_consumption.txt"
top5rows <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", nrows = 5)
classes <- sapply(top5rows, class)
raw_data <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", colClasses = classes)
selected <- raw_data[raw_data$Date == "1/2/2007"| raw_data$Date == '2/2/2007',]
rm(raw_data)
selected$Date <- as.Date(strptime(selected$Date, "%d/%m/%Y"))
png(file = "plot1.png")
hist(selected$Global_active_power,col="red", main="Global Active Power",xlab = "Global Active Power (killowatts)")
dev.off()

