# Exploratory Data Analysis Course Project 1

# Plot 3

# Read in Data

alldat<-read.table("./household_power_consumption.txt", header=T, sep=";", na.strings = "?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Convert Date column to class(date)

alldat$Date <- as.Date(alldat$Date, format="%d/%m/%Y")

# Subset to dates needed

plotdat<-subset(alldat, alldat$Date>="2007-02-01" & alldat$Date<="2007-02-02")

# Create new variable DT buy combining Date and Time

# Cobble together date and time as string
DT<-paste(as.Date(plotdat$Date), plotdat$Time)

# convert string to class datetime
plotdat$DT<-as.POSIXct(DT)


# Create plot

with(plotdat, {
              plot(Sub_metering_1~DT, type="l", ylab="Energy sub metering", xlab="")
              lines(Sub_metering_2~DT, col="red")
              lines(Sub_metering_3~DT, col="blue")
})

# Add legend

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = .4)
     
# copy to .png file in working directory

dev.copy(png, file="plot3.png", height=480, width=480)

# turn off device

dev.off()

