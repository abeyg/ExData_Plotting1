# Fix the column types before reading.
colCl <- c("character","character","numeric","numeric","numeric",
           "numeric","numeric","numeric","numeric")

# Read the data set.
hpc <- read.csv("./household_power_consumption.txt", sep = ";",
                na.strings = "?", colClasses=colCl)

# Subset and get keep only the data we are interested in.
hpc<-subset(hpc,Date=='1/2/2007'|Date=='2/2/2007')

# Combine date and time to a single column (not needed for this plot)
DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc <- cbind(hpc,DateTime)

# Plot to a PNG file.
# 
png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
##par(mfcol = c(2, 2))
with(hpc, {
plot(DateTime, Global_active_power, type="l", xlab = "",
     ylab="Global Active Power")

plot(DateTime, Sub_metering_1, xlab="",
     ylab="Energy sub metering", type="l", col="black")
lines(DateTime, Sub_metering_2, col="red")
lines(DateTime, Sub_metering_3, col="blue")
legend(x="topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue" ),
       lty=1,
       bty='n')

plot(DateTime, Voltage, type="l", xlab="datetime")

plot(DateTime, Global_reactive_power, type="l", xlab="datetime")

})

dev.off()

