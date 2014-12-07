y<-read.table('household_power_consumption.txt',sep=';',header=T,
              na.strings='?',nrows=2879,skip=66637)
colnames(y)<-c('Date','Time','Global_active_power',
          'Global_reactive_power','Voltage','Global_intensity',
         'Sub_metering_1','Sub_metering_2','Sub_metering_3')
png('plot1.png',width=480,height=480,bg='transparent')
hist(y$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',
     main='Global Active Power')
dev.off()