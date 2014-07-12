#source(paste(getwd(), "/plot4.R",sep=''))

houseData <- read.table(pipe('grep "^[1-2]/2/2007" "/home/rodney/mooc/exploratory_data/household_power_consumption.txt"'),header=F, na.strings="?",stringsAsFactors=F, sep=';');
colnames(houseData) <-names(read.table('~/mooc/exploratory_data/household_power_consumption.txt', header=TRUE,sep=";",nrows=1));
houseData$Date <- paste(houseData$Date, houseData$Time, sep=' '); #combine Date & Time;
colnames(houseData)[1] <- 'Date_Time'; #rename col[0] ;
houseData <- subset(houseData, select=-c(Time)); #remove 'Time' variable
houseData$Date_Time <- strptime(houseData$Date_Time, "%d/%m/%Y %H:%M:%S");

png(filename="/home/rodney/mooc/exploratory_data/ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
with(plot(houseData$Date_Time, as.numeric(houseData$Global_active_power),xlab='',ylab="Global Active Power",type="l",cex.lab=.7,cex.axis=.7))
with(plot(houseData$Date_Time, as.numeric(houseData$Voltage), xlab='datetime',ylab='Voltage',type='l',cex.lab=.7, cex.axis=.7))
with(plot(houseData$Date_Time,as.numeric(houseData$Sub_metering_1), xlab='',ylab='Energy sub metering' ,type="l",cex.lab=.7, cex.axis=.7))
with(lines(houseData$Date_Time,as.numeric(houseData$Sub_metering_2),col="red",type="l"))
with(lines(houseData$Date_Time,as.numeric(houseData$Sub_metering_3),col="blue",type="l"))
with(legend('topright',col=c("black","red","blue"),lty="solid",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=.7, inset=.23,y.intersp=.7, bty='n'))
with(plot(houseData$Date_Time, as.numeric(houseData$Global_reactive_power), xlab='datetime',ylab='Global_reactive_power',type='l',cex.lab=.7, cex.axis=.7))

#view png image
library(png)
img <- readPNG('/home/rodney/mooc/exploratory_data/ExData_Plotting1/plot4.png')
grid::grid.raster(img)