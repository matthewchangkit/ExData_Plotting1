# Exploratory Data Analysis - Course Project 1
### Reading the data and formatting Date
setwd("C:/Users/Matthew/Documents/Coursera")
power <- read.table("household_power_consumption.txt",sep=";"
                    ,header=T,stringsAsFactors = F)
power$Date <- as.character(as.Date(power$Date,"%d/%m/%Y"))
power$Time <- as.character(power$Time,format= "%H:%M:%S")


### Extracting the subset of data and converting Time into Date/Time
Date1 <- "2007-02-01"
Date2 <- "2007-02-02"
subset <- power[power$Date >= Date1 & power$Date <= Date2,]
datetime <- as.POSIXct(paste(subset$Date,subset$Time))
n.sub <- cbind(datetime,subset)

### Creating the plots
png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))
plot(as.numeric(as.character(n.sub$Global_active_power))~
       datetime,type = "l",xlab = "",ylab="Global Active Power")
plot(as.numeric(as.character(n.sub$Voltage))~
       datetime,type = "l",xlab = "datetime",ylab="Voltage")
with(n.sub,plot(datetime,n.sub$Sub_metering_1, type ="n",xlab ="",
                ylab= "Energy Sub Metering"))
with(n.sub,lines(datetime,n.sub$Sub_metering_1))
with(n.sub,lines(datetime,n.sub$Sub_metering_2,col="red"))
with(n.sub,lines(datetime,n.sub$Sub_metering_3,col="blue"))
legend("topright",legend= c("Sub_metering_1","Sub_metering_2",
                            "Sub_metering_3"),col = c("black",
                                                      "red","blue"),
       lwd = 1)
plot(as.numeric(as.character(n.sub$Global_reactive_power))~
       datetime,type = "l",xlab = "datetime",ylab=
       "Global_reactive_power")
dev.off()