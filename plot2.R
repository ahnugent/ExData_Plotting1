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

#plot2.R:
dat.out <- data.frame(dat.datetime, dat$Global_active_power)

plot(dat.out, type = "l", col = "black", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

png(filename = "plot2.png", width = 600, height = 600)
plot(dat.out, type = "l", col = "black", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
