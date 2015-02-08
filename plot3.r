#read data
DATA<-read.csv("household_power_consumption.txt",sep=";",header=T,colClasses = "character")
#convert the field "Date"  to Date Format
DATA$Date <- as.Date(DATA$Date,"%d/%m/%Y") 
# define the 1/2/2007
firstFebrary<-as.Date("01/02/2007","%d/%m/%Y") 
#extract the 01/02/2007 data
DT<-DATA[which((DATA$Date-firstFebrary>=0) & (DATA$Date-firstFebrary<=1) ),]
#convert Sub_Metring_X to number
DT$Sub_metering_1<-as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2<-as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3<-as.numeric(DT$Sub_metering_3)
#concate  date & time  and convert the result to Date format
DT$Long_Date<-paste(DT$Date,DT$Time, sep=' ')
DT$Long_Date = strptime(DT$Long_Date,"%Y-%m-%d %H:%M:%S")

#produce plot 3

png("plot3.png", units = "px", width=480, height=480)
plot(DT$Long_Date,DT$Sub_metering_1,type="l" ,xlab="",ylab="Energy sub metering")
lines(DT$Long_Date,DT$Sub_metering_2,type="l",col="red")
lines(DT$Long_Date,DT$Sub_metering_3,type="l", col="blue")


legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()





