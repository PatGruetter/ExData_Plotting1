# Create Plot4

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
png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(household_power_consumption$datetime, household_power_consumption$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(household_power_consumption$datetime, household_power_consumption$Voltage,
     xlab = "datetime", ylab = "Voltage", type = "l")
with(household_power_consumption, plot(datetime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(household_power_consumption, lines(datetime,Sub_metering_2, col = "red"))
with(household_power_consumption, lines(datetime,Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n", cex = 0.9)
plot(household_power_consumption$datetime, household_power_consumption$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()

