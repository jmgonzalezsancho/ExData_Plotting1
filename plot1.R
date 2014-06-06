#open png device with the required width and height

png(file = "Plot1.png", width = 480, height = 480, res = 70)

#read the data but only the first 100000 rows

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 100000, stringsAsFactors = TRUE)

#convert column 1 to class "Date"

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#select the required data

data1 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#plot the histogram

hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close the device

dev.off()

