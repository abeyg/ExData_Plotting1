# Fix the column types before reading.

colCl <- c("character","character","numeric","numeric","numeric",
           "numeric","numeric","numeric","numeric")

# Read the data set.
hpc <- read.csv("./household_power_consumption.txt", sep = ";",
                na.strings = "?", colClasses=colCl)

# Subset and get keep only the data we are interested in.
hpc<-subset(hpc,Date=='1/2/2007'|Date=='2/2/2007')

# Plot to a PNG file.
# 
png("plot1.png", width = 480, height = 480)

hist(hpc$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

dev.off()

