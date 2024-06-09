NEI_LA <-subset(NEI, fips=="06037")
NEI_LA_MotorVeh<-subset(NEI_LA,SCC %in% SCC_MotorVeh$SCC)
NEI_LA_MotorVeh_year<-tapply(NEI_LA_MotorVeh$Emissions,
                             NEI_LA_MotorVeh$year, sum, na.rm=TRUE)
Balt_LA<-data.frame(year=as.numeric(names(NEI_LA_MotorVeh_year)),
                    Baltimore.Emissions = NEI_Baltimore_MotorVeh_year,
                    LA.Emissions = NEI_LA_MotorVeh_year)

rng<-c(0,max(Balt_LA$Baltimore.Emissions,Balt_LA$LA.Emissions)+1000)
##png("plot6.png", width=480, height=720)
par(mfrow=c(1,1),mar=c(5,5,4,2))
plot(Balt_LA$year, Balt_LA$LA.Emissions, type="l", lwd=2, pch=19,  
     col="darkorchid3", main="Emissions of PM2.5 from motor vehicles by year", 
     xlab = "Year", ylab="Amount of emissions (tons)", ylim=rng)
lines(Balt_LA$year,Balt_LA$Baltimore.Emissions, lwd=2, col="darkorchid3")
points(Balt_LA$year,Balt_LA$Baltimore.Emissions, lwd=2, pch=19, col="darkorchid3")
points(Balt_LA$year,Balt_LA$LA.Emissions, lwd=2, pch=19, col="chartreuse3")
lines(Balt_LA$year,Balt_LA$LA.Emissions, lwd=2, col="chartreuse3")
legend("topright", lwd=2, col=c("darkorchid3", "chartreuse3"), 
       legend=c("Baltimore City","Los Angeles County"), bty="n") ##dev.off()