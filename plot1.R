#Read data
data<-read.table('household_power_consumption.txt',header = TRUE,sep = ';',na.strings='?')
#Viewing what is the data looks
head(data,n=1)
str(data)
#Transform strings to Dates
data$Date<-strptime(data$Date,'%d/%m/%Y')
#Define the start and end of the Dates needed
S<-strptime('2007/02/01','%Y/%m/%d')
E<-strptime('2007/02/02','%Y/%m/%d')
#Getting the data to analyze, the data are from 2007-02-01 to 2007-02-02
data2days<-subset(data,Date>=S & Date<=E)

#Create an histogram, first graph
hist(data2days$Global_active_power,main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)',col = 'red')
#Create the plot1.png
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()