setwd("E:/R_data/Course4_Ass1")

file.in <- "./data/household_power_consumption.txt"
#samplefile <- readLines(file.in, 20)

# get column classes to accelerate read:
tab5rows <- read.table(file.in, header = TRUE, sep = ";", nrows = 5)
classes <- sapply(tab5rows, class)
classes[1:2] <- "character"
dat.in <- read.table(file.in, header = TRUE, sep = ";", colClasses = classes, na.strings = "?")
dat <- dat.in[dat.in$Date %in% c("1/2/2007", "2/2/2007"),] # confirmed no 0-padding
dat.out <- dat$Global_active_power

hist(dat.out, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")#, ylab = "Frequency")

png(filename = "plot1.png", width = 600, height = 600)
hist(dat.out, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")#, ylab = "Frequency")
dev.off()
