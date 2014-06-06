#open png device with the required width and height

png(file = "Plot2.png", width = 480, height = 480, res = 70)

#read the data but only the first 100000 rows

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 100000, stringsAsFactors = TRUE)

#convert column 1 to class "Date"

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#select the required data

data1 <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

# create a new variable that joins date and time
# set locale so that the weekdays appear in English

dates <- data1[ ,1]
times <- data1[ ,2]
fusion <- paste(dates, times)
Sys.setlocale("LC_TIME", "C")
fusion2 <- strptime(fusion, "%Y-%m-%d %H:%M:%S")
data2 <- data.frame(data1, fusion2)

#plot the data using the plot and lines functions

plot(data2$fusion2, data2$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data2$fusion2, data2$Global_active_power)

#close the device

dev.off()