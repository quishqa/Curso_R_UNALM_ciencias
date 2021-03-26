# Un curso de R
# Análisis de las respuestas de la encuesta

# Leyendo el archivo csv
respuestas <- read.table("02_data/respuestas-encuesta.csv", 
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
