# Clean the workspace
  rm(list=ls())
  gc()

#Import and prepare data
  #setwd("C:/Users/Damià/Desktop/Data science specialization/4.Exploratory Data Analysis/Course Project 1")
  data <- read.table("household_power_consumption.txt", header=T,na.strings="?", sep=";",dec=".",
                     colClasses=c("character","character","numeric","numeric","numeric",
                                  "numeric","numeric","numeric","numeric"))
  data <- data[(data$Date %in% c("1/2/2007","2/2/2007")),]
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  Sys.setlocale("LC_TIME", "English")
  data$WeekDay <- weekdays(data$Date)


#Plotting
  png("plot1.png", width=480, height=480)

  hist(data$Global_active_power, col="red", main="Global Active Power", 
       xlab="Global Active Power (kilowatts)",ylab="Frequency")
  
  dev.off()

  Sys.setlocale("LC_TIME", "Spanish")
