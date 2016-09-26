whole_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
sub_data_date <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"), ]

date_time_combined <- paste(sub_data_date$Date, sub_data_date$Time, sep = " ")
date_time_combined <- strptime(date_time_combined, format = "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(sub_data_date$Global_active_power)
voltage <- as.numeric(sub_data_date$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

plot(date_time_combined, global_active_power, ylab = "Global Active Power",type="l", xlab = "")

plot(date_time_combined, sub_data_date$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(date_time_combined,sub_data_date$Sub_metering_2, col = "red")
lines(date_time_combined, sub_data_date$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(date_time_combined, voltage, xlab = "datetime", ylab = "Voltage", type="l")

plot(date_time_combined, sub_data_date$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.off()