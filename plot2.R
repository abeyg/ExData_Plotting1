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
png("plot2.png", width = 480, height = 480)

plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab = "",
     ylab="Global Active Power (kilowatts)")

dev.off()

