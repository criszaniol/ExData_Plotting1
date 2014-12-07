Sys.setlocale("LC_TIME",'en_US') #Plot xlabel on English
y<-read.table('household_power_consumption.txt',sep=';',header=T,
              na.strings='?',nrows=2879,skip=66637)
colnames(y)<-c('Date','Time','Global_active_power',
               'Global_reactive_power','Voltage','Global_intensity',
               'Sub_metering_1','Sub_metering_2','Sub_metering_3')
png('plot3.png',width=480,height=480,bg='transparent')
y$Date<-as.Date(y$Date,'%d/%m/%Y')
y$Time <- strptime(paste(y$Date,y$Time), "%Y-%m-%d %H:%M:%OS")

plot(y$Time,y$Sub_metering_1,type='n',xlab=' ',
     ylab='Energy sub metering')
#Sub metering 1
lines(y$Time[y$Date=="2007-02-01"],y$Sub_metering_1[y$Date=="2007-02-01"])
lines(y$Time[y$Date=="2007-02-02"],y$Sub_metering_1[y$Date=="2007-02-02"])
#Sub metering 2
lines(y$Time[y$Date=="2007-02-01"],y$Sub_metering_2[y$Date=="2007-02-01"],col='red')
lines(y$Time[y$Date=="2007-02-02"],y$Sub_metering_2[y$Date=="2007-02-02"],col='red')
#Sub metering 3
lines(y$Time[y$Date=="2007-02-01"],y$Sub_metering_3[y$Date=="2007-02-01"],col='blue')
lines(y$Time[y$Date=="2007-02-02"],y$Sub_metering_3[y$Date=="2007-02-02"],col='blue')
legend('topright',lwd=1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()