png(filename = "plot1.png",width = 480,height = 480)
powerdata<-read.csv('household_power_consumption.txt',sep=';')
wrongdateformat<-powerdata[,1]
correctdateformat<-as.Date(wrongdateformat,'%d/%m/%Y')
powerdata[,1]<-correctdateformat
logicalvectorofdates<-powerdata$Date=='2007-02-01'|powerdata$Date=='2007-02-02'
reqdata<-powerdata[logicalvectorofdates,]
hist(as.numeric(reqdata$Global_active_power),main='Global Active Power',xlab='Global Active Power(kilowatts)',breaks=12,xlim=c(0,6),ylim=c(0,1200),col='red')
dev.off()
