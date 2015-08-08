library(lubridate)
fileName <- "household_power_consumption.txt"
top5rows <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", nrows = 5)
classes <- sapply(top5rows, class)
raw_data <- read.table(fileName, header = TRUE, sep = ";", na.string = "?", colClasses = classes)
selected <- raw_data[raw_data$Date == "1/2/2007"| raw_data$Date == '2/2/2007',]
rm(raw_data)
# Date is a POSIXlt class
selected$Date <- as.Date(strptime(selected$Date, "%d/%m/%Y"))
# Time is a Period class
selected$Time <- hms(selected$Time)
selected <-  cbind(selected, DateTime = selected$Date + selected$Time)
## Another methond to combine date and time below
# library(dplyr)
## Assume Date and Tme were not converted to POSIXlt or Period, instead they are still strings
# selected <- mutate(selected, DateTime = as.POSIXct (paste(Date, Time), format("%d/%m/%Y %H:%M:%S))
## Now you should be able to plot vs Date_Time

png(file = "plot2.png")
plot(selected$DateTime, selected$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
