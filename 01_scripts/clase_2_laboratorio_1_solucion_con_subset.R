# Solución Laboratorio 1

## 1. Leer los archivos de marzo de 2019, 2020, y de 2021
## Pueden usar file.choose()
mar19 <- read.table("02_data/pm25_0319.csv", 
                    header = TRUE, # Tiene nombre las columnas?
                    sep = ",") # Cómo están separadas las columnas?
mar20 <- read.table("02_data/pm25_0320.csv", 
                    header = TRUE,
                    sep = ",")
mar21 <- read.table("02_data/pm25_0321_complete.csv", 
                    sep = ",",
                    header = T)

## 1.1. Usemos subset() para sólo incluir los datos válidos
mar19 <- subset(mar19, subset = QC.Name == "Valid")
mar20 <- subset(mar20, subset = QC.Name == "Valid")
mar21 <- subset(mar21, subset = QC.Name == "Valid")

## 2. Datos completos? No lo están
marzo_horas <- 31 * 24

horas_mar19 <- nrow(mar19)
horas_mar20 <- nrow(mar20)
horas_mar21 <- nrow(mar21)

datos_comp_mar19 <- horas_mar19 * 100 / marzo_horas
datos_comp_mar20 <- horas_mar20 * 100 / marzo_horas
datos_comp_mar21 <- horas_mar21 * 100 / marzo_horas

### Como tenemos más del 70 - 80 % de nuestros completos
### Podemos seguir con nuestro análisis

## 3. Maxima concentración horaria PM25
max_mar19 <- max(mar19$Raw.Conc.)
max_mar20 <- max(mar20$Raw.Conc.)
max_mar21 <- max(mar21$Raw.Conc.)

## En qué día y qué hora
max_day19 <- subset(mar19, subset = Raw.Conc. == max_mar19)
max_day20 <- subset(mar20, subset = Raw.Conc. == max_mar20)
max_day21 <- subset(mar21, subset = Raw.Conc. == max_mar21)

max_day19[c("Day", "Hour")]
max_day20[c("Day", "Hour")]
max_day21[c("Day", "Hour")]

# 4. Mínima tarea para la casa
min_mar19 <- min(mar19$Raw.Conc.)
min_mar20 <- min(mar20$Raw.Conc.)
min_mar21 <- min(mar21$Raw.Conc.)

## En qué día y qué hora
min_day19 <- subset(mar19, subset = Raw.Conc. == min_mar19)
min_day20 <- subset(mar20, subset = Raw.Conc. == min_mar20)
min_day21 <- subset(mar21, subset = Raw.Conc. == min_mar21)

min_day19[c("Day", "Hour")]
min_day20[c("Day", "Hour")]
min_day21[c("Day", "Hour")]

# 5 media mensual
mean_mar19 <- mean(mar19$Raw.Conc.)
mean_mar20 <- mean(mar20$Raw.Conc.)
mean_mar21 <- mean(mar21$Raw.Conc.)

# 6. variación respecto a 2019
var_20 <- (mean_mar20 - mean_mar19)/mean_mar19 * 100
var_21 <- (mean_mar21 - mean_mar19)/mean_mar19 * 100


