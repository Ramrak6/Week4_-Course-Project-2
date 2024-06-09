

gl<-grepl("(.*)(Comb)(.*)(Coal)(.*)",SCC$Short.Name)
subscc<-SCC[gl,]
NEI_Coal<-subset(NEI, SCC %in% subscc$SCC)
NEI_Coal_year<-tapply(NEI_Coal$Emissions, NEI_Coal$year, sum, na.rm=TRUE)

##png("plot4.png", width=640, height=640)
par(mfrow=c(1,1),mar=c(5,5,4,2))
barplot(NEI_Coal_year, names.arg = names(NEI_Coal_year), col="darkorchid3", 
        main="Emissions of PM2.5 from coal combustion-related sources by year", 
        xlab = "Year", ylab="Amount of emissions (tons)", ylim = range(0,NEI_Coal_year)*1.1) 

##dev.off()