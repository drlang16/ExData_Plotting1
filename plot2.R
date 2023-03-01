library(tidyverse)
library(lubridate)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?") %>% subset(Date %in% c("1/2/2007","2/2/2007"))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- mutate(data, datetime = ymd_hms(paste(Date, Time)))

plot(Global_active_power~datetime, data, type="l", ylab="Global Active Power (kilowatts)", xlab= NA)

dev.copy(png, "pic2.png", width  = 480, height = 480)

dev.off()