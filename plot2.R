#This R-code is written for Coursera Course Exploratory Data Analysis
#by Jouni Huopana May 8th 2015

#Reading the data set, taking into account the ? = NA and column types
colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
data<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",colClasses=colClasses)

#Combining the date and time to one column and adding it to the data frame
data <- within(data, { dateTime=strptime((paste(Date, Time)), format="%d/%m/%Y %H:%M:%S") })

#Selecting only the two specific dates (strings used, but dateTime could also be used)
data<-data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

#Note that if you have some other locales than English, you wont get the "correct" day names
#Sys.setlocale("LC_ALL","English")

#Plotting Plot 2
png("plot2.png",width=480,height=480,units="px")

plot(data$dateTime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()