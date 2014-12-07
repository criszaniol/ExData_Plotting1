Sys.setlocale("LC_TIME",'en_US') #Plot xlabel on English
y<-read.table('household_power_consumption.txt',sep=';',header=T,
              na.strings='?',nrows=2879,skip=66637)
colnames(y)<-c('Date','Time','Global_active_power',
               'Global_reactive_power','Voltage','Global_intensity',
               'Sub_metering_1','Sub_metering_2','Sub_metering_3')
png('plot2.png',width=480,height=480,bg='transparent')
y$Date<-as.Date(y$Date,'%d/%m/%Y')
y$Time <- strptime(paste(y$Date,y$Time), "%Y-%m-%d %H:%M:%OS")

plot(y$Time,y$Global_active_power,type='n',xlab=' ',
     ylab='Global Active Power (kilowatts)')
lines(y$Time[y$Date=="2007-02-01"],y$Global_active_power[y$Date=="2007-02-01"])
lines(y$Time[y$Date=="2007-02-02"],y$Global_active_power[y$Date=="2007-02-02"])
dev.off()