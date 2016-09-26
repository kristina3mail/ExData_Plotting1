whole_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
sub_data_date <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"), ]

date_time_combined <- paste(sub_data_date$Date, sub_data_date$Time, sep = " ")
date_time_combined <- strptime(date_time_combined, format = "%d/%m/%Y %H:%M:%S")
global_active_power <- as.numeric(sub_data_date$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(date_time_combined, global_active_power, ylab = "Global Active Power (kilowatts)",type="l", xlab = "")
dev.off()