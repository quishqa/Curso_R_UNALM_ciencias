# Función abre el archivo y datos completos

OpenData <- function(file, start_date, end_date){
  mar <- read.table(file, header = T,
                    sep = ",", dec = ".")
  mar <- subset(mar, subset = QC.Name == "Valid")
  mar$date <- as.POSIXct(strptime(mar$Date..LT., format = "%Y-%m-%d %I:%M %p"))
  mar <- mar[!duplicated(mar$Date..LT.), ]
  all_dates <- data.frame(
    date = seq(as.POSIXct(start_date),
               as.POSIXct(end_date),
               by = "hour")
  )
  mar_all <- merge(all_dates, mar, all = T)
  ans <- mar_all[c("date", "Raw.Conc.")]
  names(ans) <- c("date", "pm25")
  return(ans)
}

mar19 <- OpenData("02_data/pm25_0319.csv", 
                  "2019-03-01 00:00",
                  "2019-03-31 23:00")
mar20 <- OpenData("02_data/pm25_0320.csv",
                  "2020-03-01 00:00",
                  "2020-03-31 23:00")

plot(mar19$pm25, t = "l",
     ylab = "PM25 (ug/m3)", xlab = "")
lines(mar20$pm25, t = "l", col = "red")

library(openair)
mar19_day <- timeAverage(mar19, avg.time = "day")
mar20_day <- timeAverage(mar20, avg.time = "day")


plot(mar19_day$pm25, t = "l", ylab = "PM25", xlab ="",
     ylim = c(5, 25))
lines(mar20_day$pm25, t = "l", col ="red")

plot(mar19_day$pm25[3:31], t = "l", ylab = "PM2.5 (ug/m3)", xlab ="",
     ylim = c(5, 25))
lines(mar20_day$pm25[1:29], t = "l", col ="red")


plot(mar19_day$pm25[3:31], t = "l", ylab = "PM2.5 (ug/m3)", xlab ="",
     ylim = c(5, 25))
points(mar19_day$pm25[3:31], pch = 19, col = "black")
lines(mar20_day$pm25[1:29], t = "l", col ="red")
points(mar20_day$pm25[1:29], pch = 19, col = "red")


plot(mar19_day$pm25[3:31], t = "l", ylab = "PM2.5 (ug/m3)", xlab ="",
     ylim = c(5, 25), axes = F, xlab = "Marzo 2020")
points(mar19_day$pm25[3:31], pch = 19, col = "black")
lines(mar20_day$pm25[1:29], t = "l", col ="red")
points(mar20_day$pm25[1:29], pch = 19, col = "red")
axis(2)
axis(1, at = 1:28, labels = 1:28)
box()

plot(mar19_day$pm25[3:31], t = "l", ylab = "PM2.5 (ug/m3)",
     ylim = c(5, 25), axes = F, xlab = "Marzo 2020",
     main = "Embajada de EE.UU - Lima, Perú")
abline(v = 16, col = "grey")
points(mar19_day$pm25[3:31], pch = 19, col = "black")
lines(mar20_day$pm25[1:29], t = "l", col ="red")
points(mar20_day$pm25[1:29], pch = 19, col = "red")
axis(2)
axis(1, at = 1:28, labels = 1:28)
legend("bottomleft", lty = c(1, 1), pch =c(19, 19),
       col = c("black", "red"), legend=c("2019", "2020"), bty = "n")
box()

, xlab = "", axes = F,
main = "")
abline(v = 16, col = "grey")
points(mar19_day$pm25[3:31], pch = 19, col = "black")
lines(mar20_day$pm25[1:29], t = "l", col = "red")
points(mar20_day$pm25[1:29], pch=19, col = "red")
text(25, 7, "2020", col = "red", cex = 1.3)
text(25, 16, "2019", col = "black", cex = 1.3)
mtext("16 de Marzo", side = 1, at =16, col = "grey")
mtext("Niveles de contaminación decrecieron durante la cuarentena", 
      side = 3, adj = 0, cex = 1, font = 2, line = 1.5)
mtext("Concentración de PM2.5 diaria (ug/m3) en la embajada americana" , 
      side = 3, adj = 0, cex = 0.75, font = 3, line = .7)