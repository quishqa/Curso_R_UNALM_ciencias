# Script para leer data horaria por mes de PM2.5
# medido en la embajada de los EEUU en Perú

## Dirección del archivo
pm25_file <- "02_data/pm25_0319.csv"

## Importando datos
mar19 <- read.table(pm25_file, header = T, sep = ",", dec = ".")

## Los datos están completos?
horas_marzo <- 31 * 24
horas_faltantes <- horas_marzo - nrow(mar19)

## Máxima concentración horaria
max_mar19 <- max(mar19$Raw.Conc.)

## Qué día y hora?
day_max  <- mar19$Day[mar19$Raw.Conc. == max_mar19]
hour_max <- mar19$Hour[mar19$Raw.Conc. == max_mar19]

# Media mensuak
mean_mar19 <- mean(mar19$Raw.Conc.)

# Solución
ans <- data.frame(miss_hour = horas_faltantes,
                  max_pm25 = max_mar19,
                  max_day = day_max,
                  max_hour = hour_max,
                  mean = mean_mar19)