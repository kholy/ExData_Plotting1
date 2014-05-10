filename<-"household_power_consumption.txt"
#setClass('MyDate')
#setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
skiprows=66636
readrows=2881
png(filename="plot2.png",width = 480, height = 480)
x<-read.csv(filename,sep=";",na.strings="?",nrows=1)
xnames<-colnames(x)

y<-read.csv(filename,sep=";",na.strings="?",skip=skiprows,nrows=readrows,col.names=xnames)
names<-c("Date","Time","Global_active_power")
y2<-y[,names]
y<-na.omit(y2)
#L<-length(y[,1])
print(L)
dtime<-paste(y$Date,y$Time,sep=" ")
dtime<-strptime(dtime,format="%d/%m/%Y %H:%M:%S")
y<-na.omit(y)
y$Global_active_power<-as.numeric(y$Global_active_power)

plot(dtime,y$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
#plot()
#lines(dtime,y$Global_active_power,xlabel="",ylabel="Global Active Power (kilowatts)")
dev.off()
