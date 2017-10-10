setwd('C://Users/Kevin/Dropbox/Coursera/Exploratory Data Analysis/Week 1/Project')

zipUrl = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipFile = 'Electric power consumption.zip'
if (!file.exists(zipFile)){download.file(zipUrl, zipFile, method = 'curl')}
filePath = 'Electric power consumption'
if (!file.exists(filePath)){unzip(zipFile)}
list.files()

df = read.table('household_power_consumption.txt', 
                header = TRUE, sep = ';', na.strings = '?')

##### subset data from the dates 2007-02-01 and 2007-02-02

df$Date = as.Date(df$Date, format = '%d/%m/%Y')
df = df[(df$Date == '2007-02-01')|(df$Date == '2007-02-02'),]

##### create new variable dateTime which combine date and time
dateTime = paste(df$Date, df$Time)
df$dateTime = as.POSIXct(dateTime)

##### plot
png('plot4.png', width = 480, height = 480)

par(mfrow= c(2,2))

# plot 1
plot(df$dateTime, df$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power')

# plot 2
plot(df$dateTime, df$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

# plot 3
plot(df$dateTime, df$Sub_metering_1, type = 'l', 
     xlab = '', ylab = 'Energy sub metering')
lines(df$dateTime, df$Sub_metering_2, type = 'l', col = 'red')
lines(df$dateTime, df$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lty = 1, bty = 'n', cex = .9)

# plot 4
plot(df$dateTime, df$Global_reactive_power, type = 'l', 
     xlab = 'datetime', ylab = 'Global_reactive_power')


dev.off()
