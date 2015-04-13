# Exploratory Data Analysis - Course Project 1
### Reading the data and formatting Date
setwd("C:/Users/Matthew/Documents/Coursera")
power <- read.table("household_power_consumption.txt",sep=";"
                    ,header=T)
power$Date <- as.character(as.Date(power$Date,"%d/%m/%Y"))
power$Time <- as.character(power$Time,format= "%H:%M:%S")


### Extracting the subset of data and converting Time into Date/Time
Date1 <- "2007-02-01"
Date2 <- "2007-02-02"
subset <- power[power$Date >= Date1 & power$Date <= Date2,]
datetime <- as.POSIXct(paste(subset$Date,subset$Time))
n.sub <- cbind(datetime,subset)

### Creating the plot for Global Active Power against datetime
png("plot2.png",width=480,height=480)
plot(as.numeric(as.character(n.sub$Global_active_power))~n.sub$datetime,
     type='l',xlab="",ylab="Global Active Power (Kilowatts)")
dev.off()
