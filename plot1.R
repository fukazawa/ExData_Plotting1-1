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
houseTg$Global_active_power <- as.numeric(houseTg$Global_active_power)
class(houseTg$Global_active_power)

#plot
hist(houseTg$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col ="red", 
     main = "Global Active Power")

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

