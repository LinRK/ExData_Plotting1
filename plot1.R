df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses="character")
df<-df[df$Date=="1/2/2007"|df$Date=="2/2/2007",]

dateTime<-paste(df$Date,df$Time)

dateTime<-as.POSIXct(strptime(dateTime,format="%d/%m/%Y %H:%M:%S"))

ndf<-data.frame(dateTime,df)

for (i in 4:10){
  ndf[,i]<-as.numeric(ndf[,i])      
}

hist(ndf[,4],col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
