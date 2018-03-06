require(lubridate)

# Read and prepare dataset
power <- read.table("~/Exploratory data analysis/project 1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# Convert to date
power$Date <- dmy(power$Date)
# Subset database
power <- subset(power, power$Date=="2007-02-01"|power$Date=="2007-02-02")
# Create date-time variable
power$Date_time <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
# Convert to numeric variables  
power$Global_active_power <- as.numeric(power$Global_active_power)

# Create plot
png(filename = "~/Exploratory data analysis/project 1/plot3.png", width = 480, height = 480)
  plot(power$Date_time, power$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

# Add lines
  lines(power$Date_time, power$Sub_metering_2, type = "l", col = "orange")
  lines(power$Date_time, power$Sub_metering_3, type = "l", col = "blue")
# Add legend
  legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "orange", "blue"), lty = 1)
  
  dev.off()