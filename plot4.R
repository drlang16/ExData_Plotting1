library(tidyverse)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>% subset(Date %in% c("1/2/2007","2/2/2007"))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- mutate(data, datetime = ymd_hms(paste(Date, Time)))

par(mfrow = c(2, 2))

plot(Global_active_power~datetime, data, type="l", ylab="Global Active Power", xlab= NA)
plot(Voltage~datetime, data, type="l")
plot(Sub_metering_1~datetime, data, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(Sub_metering_2~datetime, data, type = "l", col = "red")
lines(Sub_metering_3~datetime, data, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, bty = "n", y.intersp = 0.5)
plot(Global_reactive_power~datetime, data, type="l")

dev.copy(png, "pic4.png", width  = 480, height = 480)

dev.off()