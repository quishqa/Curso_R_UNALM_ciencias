# Don't repeat yourself

ReadPM25Data <- function(file_path){
  mes <- read.table(file_path, header = T, sep = ",", dec = ".")
  horas_faltantes <- 31*24 - nrow(mes)
  max_value <- max(mes$Raw.Conc.)
  day_max  <- mes$Day[mes$Raw.Conc. == max_value]
  hour_max <- mes$Hour[mes$Raw.Conc. == max_value]
  mean_mes <- mean(mes$Raw.Conc.)
  ans <-  data.frame(miss_hour = horas_faltantes,
                     max_pm25 = max_value,
                     max_day = day_max,
                     max_hour = hour_max,
                     mean = mean_mes)
  return(ans)
}

mar19_file <- "02_data/pm25_0319.csv"
mar20_file <- "02_data/pm25_0320.csv"
mar21_file <- "02_data/pm25_0321.csv"

ReadPM25Data(mar19_file)
ReadPM25Data(mar20_file)
ReadPM25Data(mar21_file)