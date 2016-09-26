whole_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
sub_data_date <- whole_data[whole_data$Date %in% c("1/2/2007", "2/2/2007"), ]

global_active_power <- as.numeric(sub_data_date$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(global_active_power, main ="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()