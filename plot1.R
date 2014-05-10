filename2<-"household_power_consumption.2.2007.txt"
filename<-"household_power_consumption.txt"
currentworkingdirectory="/Users/mohamedelkholy/coursera/datascience/exploratory/week1/pa1"
setwd(currentworkingdirectory)
setClass('MyDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
skiprows=66636
readrows=2881
png(filename="plot1.png",width = 480, height = 480)
x<-read.csv(filename,sep=";",na.strings="?",nrows=1)
xnames<-colnames(x)
y<-read.csv(filename,header=TRUE,sep=";",na.strings="?",skip=skiprows,nrows=readrows,col.names=xnames)
y$Global_active_power<-as.numeric(y$Global_active_power)
hist(y$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
#hist(y[,3],col="red")