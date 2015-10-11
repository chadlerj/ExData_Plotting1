my_data <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";")

my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

my_data$timetemp <- paste(my_data$Date, my_data$Time)

my_data$Time <- strptime(my_data$timetemp, format = "%Y-%m-%d %H:%M:%S")

sub_data <- my_data[(my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02"),]

rm(my_data)

png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")

dev.off()
