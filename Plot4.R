# Clean the workspace
  rm(list=ls())
  gc()

#Import data
  #setwd("C:/Users/Damià/Desktop/Data science specialization/4.Exploratory Data Analysis/Course Project 1")
  data <- read.table("household_power_consumption.txt", header=T,na.strings="?", sep=";",dec=".",
                     colClasses=c("character","character","numeric","numeric","numeric",
                                  "numeric","numeric","numeric","numeric"))
  data <- data[(data$Date %in% c("1/2/2007","2/2/2007")),]
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  Sys.setlocale("LC_TIME", "English")
  data$Day <- as.POSIXlt(paste(data$Date, data$Time, sep=" "))

  
#Plotting
  png("Plot4.png", width=480, height=480)

  par(mfrow = c(2, 2))
  
  #Plot 1: Global Active Power
  plot(data$Day, data$Global_active_power, type="l",ylab = "Global Active Power", 
       xlab="")
  
  #Plot 2: Voltage
  plot(data$Day, data$Voltage, type="l",ylab = "Voltage", 
       xlab="datetime")
  
  #Plot 3: Sub meterings
  plot(data$Day, data$Sub_metering_1, type="l",ylab = "Energy sub metering", 
       xlab="")
  lines(data$Day, data$Sub_metering_2, col="red", lwd=2.5)
  lines(data$Day, data$Sub_metering_3, col="blue", lwd=2.5)
  legend("topright", lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"),
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),)
  
  #Plot 4: Global reactive power
  plot(data$Day, data$Global_reactive_power, type="l",ylab="Global_reactive_power",
       xlab="datetime")

  dev.off()
  Sys.setlocale("LC_TIME", "Spanish")
  
