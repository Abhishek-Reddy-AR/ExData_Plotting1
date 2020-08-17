png(filename = "plot2.png",width = 480,height = 480)
powerdata<-read.csv('household_power_consumption.txt',sep=';')
DateTime <- strptime(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S")
powerdata<-mutate(powerdata,DateTime=DateTime)
wrongdateformat<-powerdata[,1]
correctdateformat<-as.Date(wrongdateformat,'%d/%m/%Y')
powerdata[,1]<-correctdateformat
logicalvectorofdates<-powerdata$Date=='2007-02-01'|powerdata$Date=='2007-02-02'
reqdata<-powerdata[logicalvectorofdates,]
with(reqdata,plot(DateTime,Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)'))
dev.off()