png(filename = "plot4.png",width = 480,height = 480)
powerdata<-read.csv('household_power_consumption.txt',sep=';')
DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata<-mutate(powerdata,DateTime=DateTime)
wrongdateformat<-powerdata[,1]
correctdateformat<-as.Date(wrongdateformat,'%d/%m/%Y')
powerdata[,1]<-correctdateformat
logicalvectorofdates<-powerdata$Date=='2007-02-01'|powerdata$Date=='2007-02-02'
reqdata<-powerdata[logicalvectorofdates,]
par(mfrow=c(2,2))
with(reqdata,plot(DateTime,as.numeric(Global_active_power),xlab='',ylab='Global Active Power',type='l'))
with(reqdata,plot(DateTime,as.numeric(Voltage),ylab='Voltage',type='l'))
with(reqdata,plot(DateTime,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))
with(reqdata,points(DateTime,Sub_metering_1,type='l',col='black'))
with(reqdata,points(DateTime,Sub_metering_2,type='l',col='red'))
with(reqdata,points(DateTime,Sub_metering_3,type='l',col='blue'))
legend("topright",lty=1,lwd=2,col=c("black","red","blue"),cex=0.7,bty='n',legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(reqdata,plot(DateTime,Global_reactive_power,ylab='Global_reactive_power',type='l'))
dev.off()