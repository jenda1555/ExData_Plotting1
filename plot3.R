##########################################################################################################
##########################################################################################################
########################################### plot1.png ####################################################

#### LOAD DATA ####
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#### TIDY DATA ####
data[data == "?"] <- NA
data <- data[complete.cases(data), ]

#### LIBRARY LUBRIDATE ####
library(lubridate)

#### CHOICE DATA FROM THE DATES 2007-02-01 AND 2007-02-02 ####
Dates <- as.Date(dmy(data$Date))
dats <- data[(as.Date(Dates) >= as.Date("2007-02-01")) & (as.Date(Dates) <= as.Date("2007-02-02")), ]
dats$Global_active_power <- as.numeric(as.vector(dats$Global_active_power))
dats$Global_reactive_power <- as.numeric(as.vector(dats$Global_reactive_power))
dats$Voltage <- as.numeric(as.vector(dats$Voltage))
dats$Global_intensity <- as.numeric(as.vector(dats$Global_intensity))
dats$Sub_metering_1 <- as.numeric(as.vector(dats$Sub_metering_1))
dats$Sub_metering_2 <- as.numeric(as.vector(dats$Sub_metering_2))
dats$Sub_metering_3 <- as.numeric(as.vector(dats$Sub_metering_3))


#### CREATE plot3.png ####
png("plot3.png", width = 480, height = 480)
with(dats, {
  plot(Sub_metering_1, type = "l", xaxt = "n", xlab = "", ylab = "Energy sub metering", 
       ylim = c(min(c(Sub_metering_1, Sub_metering_2, Sub_metering_3)), 
                max(c(Sub_metering_1, Sub_metering_2, Sub_metering_3))))
  lines(Sub_metering_2, col = "red")
  lines(Sub_metering_3, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
axis(side = 1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()