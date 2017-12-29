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
  
## Plot1
  ### Open datafile as graphics device
  png("plot1.png")
    #### Print histogram
      hist(data$Global_active_power, 
       col = "red", 
       xlab = "Global Active Power (kilowatts)", 
       main = "Global Active Power")
  ### Close graphics device
  dev.off()
  