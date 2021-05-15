# Solución Laboratorio 1

## 1. Leer los archivos de marzo de 2019, 2020, y de 2021
mar19 <- read.table("02_data/pm25_0319.csv", 
                    header = TRUE, # Tiene nombre las columnas?
                    sep = ",") # Cómo están separadas las columnas?
# mar19 <- read.table(file.choose(), header = T, sep = ",")
mar20 <- read.table("02_data/pm25_0320.csv", 
                    header = TRUE,
                    sep = ",")
mar21 <- read.table("02_data/pm25_0321_complete.csv", 
                    sep = ",",
                    header = T)

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
## Oh sorpresa, nuestro máximo es un dato inválido
###########################################################
# Vamos a retirar el máximo invalido
new_mar19 <- mar19[!(mar19$Raw.Conc. == max_mar19), ]#
new_max_mar19 <- max(new_mar19$Raw.Conc.)#
###########################################

new_mar19[new_mar19$Raw.Conc. == new_max_mar19, c("Day", "Hour")]
mar20[mar20$Raw.Conc. == max_mar20, ] # Yo quiero que me muestres todas las filas que tengan Raw.Conc igual a la máxima, y todas las columnsa
mar21[mar21$Raw.Conc. == max_mar21, ]

# Willian si quiero sólo los del primer día
mar19_1ro <- mar19[mar19$Day == 1, ]

# Sólo quiero la fecha y la conctración del primer día
mar19_1ro <- mar19[mar19$Day == 1, c("Date..LT.", "Raw.Conc.")]

# 4. Mínima tarea para la casa

# 5 media mensual
mean_mar19 <- mean(mar19$Raw.Conc.)
mean_mar20 <- mean(mar20$Raw.Conc.)
mean_mar21 <- mean(mar21$Raw.Conc.)

# 6. variación respecto a 2019
var_20 <- (mean_mar20 - mean_mar19)/mean_mar19 * 100
var_21 <- (mean_mar21 - mean_mar19)/mean_mar19 * 100


