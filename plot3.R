setwd("E:/R_data/Course4_Ass1")

file.in <- "data/household_power_consumption.txt"
#samplefile <- readLines(file.in, 20)

# get column classes to accelerate read:
tab5rows <- read.table(file.in, header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)
classes[1:2] <- "character"
dat.in <- read.table(file.in, header = TRUE, sep = ";", colClasses = classes, na.strings = "?")
dat <- dat.in[dat.in$Date %in% c("1/2/2007", "2/2/2007"),] # confirmed no 0-padding
dat.datetimestr <- paste0(dat$Date, " ", dat$Time)
dat.datetime <- strptime(dat.datetimestr, format = "%d/%m/%Y %H:%M:%S")

#plot3.R:
dat.out <- data.frame(dat.datetime, dat$Sub_metering_1, dat$Sub_metering_2, dat$Sub_metering_3)
#names(dat.out)[[1]] <- "datetime"
names(dat.out) <- gsub("^dat\\.", "", names(dat.out))

#E: plot(dat.out, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
plot(x = dat.out$datetime, y = dat.out$Sub_metering_1, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
lines(x = dat.out$datetime, y = dat.out$Sub_metering_2, col = "red")
lines(x = dat.out$datetime, y = dat.out$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png(filename = "plot3.png", width = 600, height = 600)
plot(x = dat.out$datetime, y = dat.out$Sub_metering_1, type = "l", col = "black", main = "", xlab = "", ylab = "Energy sub metering")
lines(x = dat.out$datetime, y = dat.out$Sub_metering_2, col = "red")
lines(x = dat.out$datetime, y = dat.out$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

