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

##### plot
png('plot1.png', width = 480, height = 480)
hist(df$Global_active_power, main = 'Global Active Power', col = 'red',
    xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency')
dev.off()
