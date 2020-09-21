#Read data
data<-read.table('household_power_consumption.txt',header = TRUE,sep = ';',na.strings='?')
#Viewing what is the data looks
head(data,n=1)
str(data)
#Transform string to Dates
data$Date<-strptime(data$Date,'%d/%m/%Y')
#Define the start and end of the Dates needed
S<-strptime('2007/02/01','%Y/%m/%d')
E<-strptime('2007/02/02','%Y/%m/%d')
#Getting the data to analyze, the data are from 2007-02-01 to 2007-02-02
data2days<-subset(data,Date>=S & Date<=E)
#Adding a column DateTime
datetime<-paste(data2days$Date,data2days$Time)
datetime<-as.POSIXct(datetime)
pdata<-cbind(data2days,datetime)

#Create the histogram
plot(pdata$Sub_metering_1~pdata$datetime, type="l",ylab="Energy sub metering", xlab="")
lines(pdata$Sub_metering_2~pdata$datetime,col='red')
lines(pdata$Sub_metering_3~pdata$datetime,col='blue')
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lwd=c(1,1,1))
#Create the plot3.png
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()