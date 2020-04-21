#working directory is set to the directory where the household_power_consumption.txt exists

#read full data file
full_data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = c("?"), sep=";")

#filter by Date
data <- full_data[(full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"),]

#format the Date and construct the Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#create the graph
plot(x=data$datetime, y=data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#save the chart to file and close the dev 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()