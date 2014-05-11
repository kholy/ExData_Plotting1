filename<-"household_power_consumption.txt"

skiprows=66636
readrows=2881
png(filename="plot3.png",width = 480, height = 480)
x<-read.csv(filename,sep=";",na.strings="?",nrows=1)
xnames<-colnames(x)

y<-read.csv(filename,sep=";",na.strings="?",skip=skiprows,nrows=readrows,col.names=xnames)
sub1<-"Sub_metering_1"
sub2<-"Sub_metering_2"
sub3<-"Sub_metering_3"
names<-c("Date","Time",sub1,sub2,sub3)
subs<-c(sub1,sub2,sub3)
y2<-y[,names]
y<-na.omit(y2)
#L<-length(y[,1])
#print(L)
dtime<-paste(y$Date,y$Time,sep=" ")
dtime<-strptime(dtime,format="%d/%m/%Y %H:%M:%S")
y<-na.omit(y)
#y$Global_active_power<-as.numeric(y$Global_active_power)

plot(dtime,y[[sub1]],xlab="",ylab="Energy sub metering",type="l")
lines(dtime,y[[sub2]],xlab="",ylab="Energy sub metering",type="l",col="red")
lines(dtime,y[[sub3]],xlab="",ylab="Energy sub metering",type="l",col="blue")
#plot()
#lines(dtime,y$Global_active_power,xlabel="",ylabel="Global Active Power (kilowatts)")
legend("topright",lwd=c(2,2,2),col=c("black","red","blue"),legend=c(sub1,sub2,sub3))
dev.off()
