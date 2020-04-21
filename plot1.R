#working directory is set to the directory where the household_power_consumption.txt exists

#read full data file
full_data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = c("?"), sep=";")

#filter by Date
data <- full_data[(full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"),]

#format the Date and construct the Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#create the graph
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save the chart to file and close the dev 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
