source(paste(getwd(), "/plot1.R",sep=''))

houseData <- read.table(pipe('grep "^[1-2]/2/2007" "/home/rodney/mooc/exploratory_data/household_power_consumption.txt"'),header=F, na.strings="?",stringsAsFactors=F, sep=';');
colnames(houseData) <-names(read.table('~/mooc/exploratory_data/household_power_consumption.txt', header=TRUE,sep=";",nrows=1));
houseData$Date <- paste(houseData$Date, houseData$Time, sep=' '); #combine Date & Time;
colnames(houseData)[1] <- 'Date_Time'; #rename col[0] ;
houseData <- subset(houseData, select=-c(Time)); #remove 'Time' variable
houseData$Date_Time <- strptime(houseData$Date_Time, "%d/%m/%Y %H:%M:%S");

#recreate plot 1 histogram for assignment
hist(houseData$Global_active_power, col='red', main='Global Active Power', xlab="Global Active Power (kilowatts)",cex.lab=.8, cex.axis=.8);
