# Un curso introductorio de R
# Análisis de las respuestas de la encuesta

# Leyendo el archivo csv
respuestas <- read.table("02_data/respuestas.csv", 
                         header = T,
                         sep = ",",
                         stringsAsFactors = F)

# Cambiando el nombre del encabezado
names(respuestas) <- c("date", "name", "last.name",
                       "age", "district", "molinero",
                       "faculty", "year", "program",
                       "prog.lang", "os", "labs",
                       "Excel", "R", "why")

# Calculando algunas médias
edad_media <- mean(respuestas$age)
molineros <- prop.table(table(respuestas$molinero))[3] + prop.table(table(respuestas$molinero))[4]  * 100
faculty <- prop.table(table(respuestas$faculty)) * 100
graduados <-  prop.table(table(respuestas$year))["Ya me gradué"] * 100
program <- prop.table(table(respuestas$program)) * 100
os <- prop.table(table(respuestas$os)) * 100
labs <- prop.table(table(respuestas$labs)) * 100
excel <- prop.table(table(respuestas$Excel)) * 100
r <- prop.table(table(respuestas$R)) * 100
r


# Haciendo unas figuras
library(scales)
fac <- sort(faculty, decreasing = T)
bp <- barplot(fac, col = alpha("red", 0.7),
              axes=F, ylim = c(0, 100),
              border=NA,
              font.lab=2,
              cex.names = 0.85, width=c(0.1, 0.1, 0.1, 0.1, 0.1))
mtext('Qué estudias?', side = 3, adj = 0,
      line = 1.2, cex = 1.75, font = 2) #  Adding the main title
mtext('Frecuencia (%)', side = 3, adj=0, cex = 1.25, font =3) # Add the subtitle
text(x = bp, y = fac + 3.5, labels = fac, cex = 1.25) # Adding % to each bar

RespuestasBarplot <- function(table, title, bar_col, ylim=c(0,100), size = 0.85, sorted=T){
  if (sorted){
    table_sort <- sort(table, decreasing = T)
  } else {
    table_sort <- table
  }
  
  bp <- barplot(table_sort, col = alpha(bar_col, 0.7),
                axes=F, ylim=ylim,
                border=NA, font.lab=2,
                cex.names=size)
  mtext(title, side = 3, adj = 0,
        line = 1.2, cex = 1.75, font = 2) # Adding the main title
  mtext('Frecuencia (%)', side = 3, adj=0, cex = 1.25, font =3) # Add the subtitle
  text(x = bp, y = table_sort + 3.5, labels = table_sort, cex = 1.25) # Adding % to each bar
}

RespuestasBarplot(faculty, "Qué estudias?", "red")
RespuestasBarplot(program[c("Sí", "Algo", "Nada")], "Sabes programar?", "red", sorted = F)
RespuestasBarplot(labs, "Qué usas para hacer tus prácticas?", "forestgreen")
RespuestasBarplot(excel, "Nivel de Excel?", "forestgreen")

# Hora en que respondieron la encuesta
date_res <- as.POSIXct(strptime(respuestas$date, format = "%m/%d/%Y %H:%M:%S"),
                       tz = "America/Sao_Paulo")
attributes(date_res)$tzone <- "America/Lima"
date_res_per <- as.POSIXlt(date_res)

hour_res <- as.data.frame(table(date_res_per$hour), stringsAsFactors = F)
names(hour_res) <- c("hour", "freq")

hour_freq <- data.frame(hour=as.character(0:23))
hour <- merge(hour_freq, hour_res, all=T)
hour$hour <- as.numeric(hour$hour)
hour <- hour[order(hour$hour), ]

plot(hour$hour, hour$freq, ylim = c(0, 8), col = "red", pch=19, cex=1.25,
     xlab = "Horas", ylab = "Frecuencia", axes = F,
     main= "Hora del día de respuesta de la encuesta")
segments(hour$hour,0, hour$hour, hour$freq, col="red")
axis(2)
axis(1, at=seq(0,23, 2), labels = seq(0,23, 2))
box()