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


#### CREATE plot1.png ####
png("plot1.png", width = 480, height = 480)
hist(dats$Global_active_power, col = 2, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()