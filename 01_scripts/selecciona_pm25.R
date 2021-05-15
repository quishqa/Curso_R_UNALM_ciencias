# Script para leer los datos de contamintates de marzo
# Y tener sólo dos columnas

SelecionaPM25 <- function(file_path){
  mes <- read.table(file_path, header = T, sep = ",", dec = ".")
  mes <- subset(mes, subset = QC.Name == "Valid")
  mes <- mes[c("Date..LT.", "Raw.Conc.")]
  names(mes) <- c("date", "pm25")
  mes$date <- as.POSIXct(
    strptime(mes$date, format = "%Y-%m-%d %I:%M %p"),
    tz = "America/Lima"
  )
  return(mes)
}

mar19 <- SelecionaPM25("02_data/pm25_0319.csv") # Alt + Shift + abajo
mar20 <- SelecionaPM25("02_data/pm25_0320.csv") # Alt + Shift + abajo
mar21 <- SelecionaPM25("02_data/pm25_0321_complete.csv") # Alt + Shift + abajo



plot(mar19$date, mar19$pm25, t = "l", 
     ylab = "PM2.5 (ug/m3)", xlab = "")
