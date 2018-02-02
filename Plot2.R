
# Create Plot2

# Set working directory
setwd("C:/Users/Patrick/Documents/Coursera/DataScience/Assignments/Course4/CourseProject1")

# Load data set
household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                                          stringsAsFactors = FALSE)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y") # change formate to "Date"

# Subset for days 2007-02-01 and 2007-02-02
household_power_consumption <- household_power_consumption[household_power_consumption$Date %in%
                                                               c(as.Date("2007-02-01"),as.Date("2007-02-02")),]

# Create time variable datetime with the format POSIXlt
household_power_consumption$datetime <- strptime(paste(household_power_consumption[,c("Date")],
                                                       household_power_consumption[,c("Time")], sep = " "), "%Y-%m-%d %H:%M:%S")

# Create plot and save it as png
plot(household_power_consumption$datetime, household_power_consumption$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.copy(png, file = "Plot2.png", width = 480, height = 480, units = "px")
dev.off()
