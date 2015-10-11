my_data <- read.table("household_power_consumption.txt", header = TRUE, na.strings="?", sep = ";")

my_data$Date <- as.Date(my_data$Date, format = "%d/%m/%Y")

my_data$timetemp <- paste(my_data$Date, my_data$Time)

my_data$Time <- strptime(my_data$timetemp, format = "%Y-%m-%d %H:%M:%S")

sub_data <- my_data[(my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02"),]

rm(my_data)

png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

plot(sub_data$Time , sub_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(sub_data$Time , sub_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(sub_data$Time , sub_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub_data$Time , sub_data$Sub_metering_2, col = "red")
lines(sub_data$Time , sub_data$Sub_metering_3, col = "blue")

legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(sub_data$Time , sub_data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()
