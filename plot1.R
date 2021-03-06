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
      png(filename = "~/Exploratory data analysis/project 1/plot1.png", width = 480, height = 480)
      hist(as.numeric(power$Global_active_power), col = "orange", main = NULL, xlab = NULL, ylab = NULL)
      # Title
      title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
      dev.off()