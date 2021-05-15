# Operaciones lógicas
## Y
TRUE & TRUE # (1 *1) 
TRUE & FALSE # (1 * 0)
FALSE & TRUE # (0 * 1)
FALSE & FALSE # (0 * 0)

#(5 > 3) & (3 < 10)
##  O
TRUE | TRUE # (1 + 1)
TRUE | FALSE # (1 + 0)
FALSE | TRUE # (0 + 1 )
FALSE | FALSE  # (0 + 0)

# > , <
# >= , <=
# ==
# !=

(5 != 10/2)

# Y de qué me sirve esta información?
# vamos usar subset()! o subconjunto!
# sintaxis subset(df, subset = CONDICION!) En CONDICION nombre de columnas sin comillas

mar19 <- read.table("02_data/pm25_0319.csv", header = T, sep = ",")

# Quiero el primer dia
mar19_primero <- subset(mar19, subset = Day == 1)

# Quiero los datos válidos
mar19_validos <- subset(mar19, subset = QC.Name == "Valid")

# Cuántos datos no validos habian
nrow(mar19) - nrow(mar19_validos)

# Quiero los datos validos Y del día primero
mar19_1ro_valid <- subset(mar19, subset = QC.Name == "Valid" & Day == 1)

# Quiero los datos diurnos
mar19_diurnos <- subset(mar19, subset = Hour >= 7 & Hour <= 19 & QC.Name == "Valid")
mar19_nocturnos <- subset(mar19, subset = !(Hour >= 7 & Hour <= 19) & QC.Name == "Valid")

mean(mar19_diurnos$Raw.Conc.)
mean(mar19_nocturnos$Raw.Conc.)

# Leyendo la encuesta
survey <- read.table("02_data/respuestas27.csv", header = T, sep = ",")
names(survey) <- c("date", "name", "last.name",
                "age", "district", "molinero",
                "faculty", "year", "program",
                "prog.lang", "os", "labs",
                "Excel", "R", "why")
ing_amb <- subset(survey, subset = faculty == "Ingeniería ambiental")

program_python <- subset(survey, subset = (program == "Sí" | program == "Algo" & prog.lang == "Python"))

## Funciones

CuboNumero <- function(x){
  cubo <- x * x * x
  return(cubo)
}

MiEdad <- function(anho_actual, anho_naci){
  mi_edad <- anho_actual - anho_naci
  return(mi_edad)
}


MiEdad(2021, 1988)

MediaVector <- function(vec){
  suma <- sum(vec)
  n <- length(vec)
  media <- suma / n
  return(media)
}


LeerDatosMensuales <- function(direccion_archivo){
  mes <- read.table(direccion_archivo, 
                    header = T, sep = ",")
  mes_valida <- subset(mes, subset = QC.Name == "Valid")
  max_valor <- max(mes_valida$Raw.Conc.)
  min_valor <- min(mes_valida$Raw.Conc.)
  mean_valor <- mean(mes_valida$Raw.Conc.)
  sd_valor <- sd(mes_valida$Raw.Conc.)
  completos <- 31 * 24 - nrow(mes_valida)
  ans <- data.frame(max = max_valor,
                    min = min_valor,
                    mean = mean_valor,
                    sd = sd_valor,
                    faltan = completos)
  return(ans)
}

mar19 <- LeerDatosMensuales("02_data/pm25_0319.csv")
mar20 <- LeerDatosMensuales("02_data/pm25_0320.csv")
mar21 <- LeerDatosMensuales("02_data/pm25_0321_complete.csv")
