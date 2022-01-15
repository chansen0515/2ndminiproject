library(lubridate)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()
# Data reading
data <- read.table("specdata/household_power_consumption.txt", sep=";")
names(data) <- data[1, ]
data <- data[-1, ]

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date >="2007-02-01" & data$Date <="2007-02-02", ]

#################### PLOT 1 ######################################
plot1 <- function(){
  # Opens the file to write to
  png("plot1.png")
  # Creating the histogram plot
  hist(as.numeric(data$Global_active_power), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
  
  dev.off() 
}

#################### PLOT 2 ######################################
plot2 <- function(){
  
  png("plot2.png")
  # x-axis labels
  days <- c("Thu", "Fri", "Sat")
  # Creating the plot
  plot(as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xaxt = "n", xlab="Day of the Week")
  # x-axis labels
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  dev.off() 
}

#################### PLOT 3 ######################################
plot3 <- function(){
  # Opens the file to write to
  png("plot3.png")
  # x-axis labels
  days <- c("Thu", "Fri", "Sat")
  
  # Creating the plot
  plot(as.numeric(data$Sub_metering_1), type="l", ylab="Energy sub metering", xaxt = "n", xlab="Day of the Week", col="black")
  
  # legend lines for the submetering( changing the colors for 2 and 3)
  lines(as.numeric(data$Sub_metering_2), type="l", col="red")
  lines(as.numeric(data$Sub_metering_3), type="l", col="blue")
  
  # Add legend
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=1)
  
  # x-axis labels
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  dev.off() 
}


#################### PLOT 4 ######################################
plot4 <- function(){
  
  png("plot4.png")
  # x-axis labels
  days <- c("Thu", "Fri", "Sat")
  
  # row of figures 2x2 using cs
  attach(mtcars)
  par(mfrow=c(2,2))
  
  
  
  
  #######################COMBINING THE PLOTS ##########################################
  # 1st plot
  plot(as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xaxt = "n", xlab="Day of the Week")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  # 2nd plot
  plot(as.numeric(data$Voltage), type="l", ylab="Voltage", xaxt = "n", xlab="Day of the Week", col="black")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  # 3rd plot
  plot(as.numeric(data$Sub_metering_1), type="l", ylab="Energy sub metering", xaxt = "n", xlab="Day of the Week", col="black")
  lines(as.numeric(data$Sub_metering_2), type="l", col="red")
  lines(as.numeric(data$Sub_metering_3), type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=1)
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  # 4th plot
  plot(as.numeric(data$Global_reactive_power), type="l", ylab="Voltage", xaxt = "n", xlab="Day of the Week", col="black")
  axis(1, at = c(0, nrow(data)/2, nrow(data)), labels = days)
  
  dev.off() 
}
plot4()