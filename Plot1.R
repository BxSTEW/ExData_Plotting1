library(dplyr)
library(lubridate)
library(ggplot2)
library(naniar)

df <- tbl_df(read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = c('?','')))

df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

df$Date <- as.Date(df$Date, format = "%m/%d/%Y")
df$timetemp <- paste(df$Date, df$Time)
df$Time <- strptime(df$timetemp, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()