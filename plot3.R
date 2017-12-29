# Coursera Data Science Specialization
# Course 4 - Exploratory Data Analysis
# Week 1 - Course Project 1
# Thomas Miebach

## Read data, unzip and extract assignment data from the dates 2007-02-01 and 2007-02-02
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, "zipdata.zip")
  unzip("zipdata.zip")
  alldata <- read.table("household_power_consumption.txt", 
                        sep = ";", 
                        header = TRUE, 
                        na.strings = "?")
## Combine date & time columns into one and convert to date/Time class  
  alldata$date_time <- paste(alldata$Date, alldata$Time)
  alldata$date_time <- strptime(alldata$date_time, format = "%d/%m/%Y %H:%M:%S")

## Subset data and remove original dataset
  data <- subset(alldata, date_time >= "2007-02-01 00:00:00" 
                 & date_time <= "2007-02-02 23:59:59")
  rm(alldata)
  
## Plot3
  ### Open datafile as graphics device
  png("plot3.png")
    #### Plot first line graph
    plot(data$date_time, data$Sub_metering_1, 
       type = "l", 
       ylab = "Global Active Power (kilowatts)", 
       xlab = "")
    #### Add second line graph
    lines(data$date_time, data$Sub_metering_2, 
       col = "red") 
    #### Add third line graph
    lines(data$date_time, data$Sub_metering_3, 
        col = "blue")
    ### Add legend
    legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"), 
         lty = 1, 
         y.intersp = 1)
  ### close graphiscs device
  dev.off()
  