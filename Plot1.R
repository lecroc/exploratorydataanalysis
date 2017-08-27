# Exploratory Data Analysis Course Project 1

# Plot 1

# Read in Data

alldat<-read.table("./household_power_consumption.txt", header=T, sep=";", na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Convert Date column to class(date)

alldat$Date <- as.Date(alldat$Date, format="%d/%m/%Y")

# Subset to dates needed

plotdat<-subset(alldat, alldat$Date>="2007-02-01" & alldat$Date<="2007-02-01")

# plot histogram with appropriate labels, color

with(plotdat, hist(Global_active_power, col="red", main = "Global Active Power",
                   xlab="Global Active Power (kilowatts)",
                   ylab="Frequency"))

# copy to .png file in working directory

dev.copy(png, file="plot1.png", height=480, width=480)

# turn off device

dev.off()

