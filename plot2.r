#read data
DATA<-read.csv("household_power_consumption.txt",sep=";",header=T,colClasses = "character")
#convert the field "Date"  to Date Format
DATA$Date <- as.Date(DATA$Date,"%d/%m/%Y") 
# define the 1/2/2007
firstFebrary<-as.Date("01/02/2007","%d/%m/%Y") 
#extract the 01/02/2007 data
DT<-DATA[which((DATA$Date-firstFebrary>=0) & (DATA$Date-firstFebrary<=1) ),]
#convert Global_active_power to number
DT$Global_active_power<-as.numeric(DT$Global_active_power)
#concate  date & time  and convert the result to Date format
DT$Long_Date<-paste(DT$Date,DT$Time, sep=' ')
DT$Long_Date = strptime(DT$Long_Date,"%Y-%m-%d %H:%M:%S")

#produce plot 2
png("plot2.png", units = "px", width=480, height=480)

plot(DT$Long_Date,DT$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

