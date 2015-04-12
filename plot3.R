#read file
house <- read.table("household_power_consumption.txt" , header=T , sep=";")

#get target data
house$Date <- strptime(house$Date,"%d/%m/%Y")
house$Date <- as.Date(house$Date) 
houseTg <- subset(mydf, Date >= "2007-02-01" & Date <= "2007-02-02") 

#print
head(houseTg)
ncol(houseTg)
nrow(houseTg)

#to num
houseTg$Sub_metering_1 <- as.numeric(houseTg$Sub_metering_1) 
houseTg$Sub_metering_2 <- as.numeric(houseTg$Sub_metering_2) 
houseTg$Sub_metering_3 <- as.numeric(houseTg$Sub_metering_3) 

#to date time
datetime <- paste(as.Date(houseTg$Date), houseTg$Time)
houseTg$Datetime <- as.POSIXct(datetime)


#plot
par(mar=c(4,4,1,2))
plot(houseTg$Sub_metering_1~houseTg$Datetime, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering") 
lines(houseTg$Sub_metering_2~houseTg$Datetime,col='Red') 
lines(houseTg$Sub_metering_3~houseTg$Datetime,col='Blue') 
legend("topright", 
       c("Sub_1", "Sub_2", "Sub_3"), 
       lty=, lwd=1, 
       col=c("black", "red", "blue"), 
       bty="o")

dev.copy(png, file="plot3.png", height=480, width=480) 
dev.off() 

