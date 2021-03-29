# Estos es lo que voy a aprender hoy (Ctr + Enter)

# R funciona como calculadora
(((5 + 1) - 0.25) / 3) * 2

# Usamos <- para asignar variables
R <- 8.314 # J / K mol
R

# funcion()
class(R)

# Characteres (python strings) ""/' '
una_palabra <- "palabra"
cat <- "gato"
vallejo <- "Pero el cadaver ay! siguío muriendo"
lyrics <- "una palabra no dice nada y al mismo tiempo lo esconde todo"
neruda <- 'me gustas cuando callas porque estas como ausente'
neruda
class(cat)
class(vallejo)
class(R)

# Logical T or F
verdad <- TRUE
class(verdad)
falso <- 5 > 10
falso
3 < 1
falsazo <- "cinco" == "5"
falsazo
10 * 10 == 100 
# Operaciones logicas: & (y), | (o), == (igual)

#Vectores c()
puntos_cardinales <- c("N", "S", "E", "W")
class(puntos_cardinales)
puntos_cardinale_grados <- c(0, 180, 90, 270) # Según Rosa de viento

vector_mixto <- c(1, 2, 4, "5")
class(vector_mixto)
otro.vector.mixto <- c("a", 1, "2")

una_mala_praxis<-c(1,2,3) # Feo!
PuntosCardinales <- c("s", "n", "e", "w")
mi_nombre <- "Mario Gavidia-Calderón"

# Buenas practicas para denifir variables
# 1. Nombres simples con significado
# 2. Para separar nombre de variables puede "_" , "." , MiNombre
# 3. No numero ni character al inicio.
# siempre buenos usar un espacio despues de cada ","
# 
# Resumiendo: 
# Definir variales, crear un vector, tipo de variables:
# numeric, charactes, logical

sqrt((4 * 3) + 5)
word <- "Help!"
my_pi <- 3.14
verdadero <- 81 > 1
verdadero
a <- 1
a <- 10000000

# Vectores una secuencia: 
# seq(valor_inicial, valor_final, intervalo)
del1al5 <- c(1, 2, 3, 4, 5)
del1al5
del1al10 <- seq(1, 10)
del1al1000 <- seq(1, 1000)
del1al10par <- seq(0, 10, 2)
del1al10par
del0a1 <- seq(0, 1, 0.1)

# Selecionando valores vector
# vector[posición]

del1al10[5]
letras <- c("a", "b", "c", "d", "e", "f", "g")
# Cuál es la quinta letra
letras[5]
letras[1]

# Seleccionar más letras, usamos un vector con la posición
letras[c(1, 3)]
tres_prim_letras <- letras[seq(1, 3)]

# Selecinar basodo en el elemento
# saber posición which
which(letras == "d") # Que elemento del vector ES IGUAL A "d" 
which(puntos_cardinales == "S")
valores <- c(1, 2, 4, 10, 3, 30)
valores == 10

# Para ELIMINAR elementos de un vector usamos [-posición]
#          1     2      3      4      
GHG <- c("H2O", "CH4", "CO2", "O2")
GHG_no_o2 <- GHG[-4]
GHG[4] <- "O3" # Que el elemento 4 sea O3
GHG <- GHG[-c(1, 4)]
# [posición] es el operador selección de un vector

# LLegamos data.frames (respiren profundo)
# data.frame()
# conjunto de vectors

gases <- c("N2", "O2", "Ar", "CO2")
peso_molecular <- c(28, 32, 40, 12 + 2* 16)
porcentaje <- c("78.98", "20.95", "0.9", "0.04")

aire <- data.frame(gas = gases,
                   w = peso_molecular,
                   per = porcentaje)

# Recuerden mismo numero de elementos en cada vector
# R la separación decimal es "."
aire_seco <- data.frame(gas = c("N2", "O2", "Ar", "O2"),
                        w = c(28, 32, 40, 12 + 2 * 16),
                        per = c(78.98, 20.95, 0.9, 0.04))

# Data frame de los beatles
beatles <- data.frame(name = c("John", "Paul", "George", "Ringo"),
                      born = c(1940, 1941, 1943, 1940),
                      inst = c("guitar", "bass", "guitar", "drums"),
                      stringsAsFactors = F) # Asegura que los character sean convertidos a Factor

# Selecionar valores del data frame
# df[fila, columna]

# Seleccionamos a John
beatles[1, 1]

# Selecionarmos John y su año de nacimiento
beatles[1, c(1, 2)]

# Selecionamos a los guitarristas
beatles[c(1, 3), c(1,2, 3)]
beatles[c(1, 3), seq(1, 3)]
beatles[c(1, 3), 1:3]  # inicio:final vector secuencia numeros ENTEROS 

# df[fila, columns] el " " todo
beatles[, 1]
beatles
beatles[4, ]
# Los guitarristas más simplificado aún
beatles[c(1, 3), ]
t(beatles) # cambia columnas * filas

# df[N] va a selecionar columnas
beatles[1]
class(beatles[1])

# $ para seleccionar columnas
# df$nombre_columna
nombres_beatles <- beatles$name
anho_naci <- beatles$born
beatles_nombres <- beatles$name

# Mucho OJO!
# df[N] un dataframe
# df$nombre_de_columna un vector

mean(beatles[2])
mean(beatles$born)

# Cómo adicionas otra columna? con dolar $
# df$nombre_columna_nueva <- c()
beatles$solo <- c("Imagine",
                  "Band on the run",
                  "Oh sweet lord",
                  "Photograph")
beatles$prefe <- c(1, 4, 3, 2)

# El nuevo de observaciones = numero de filas
nrow(beatles)
# El numero de variable = numero de columnsa
ncol(beatles)
# Tipo de objeto de cada variable str=structure
str(beatles)
# summary() resumen
summary(beatles)
# Nombre de las columnas
names(beatles)
# Valores únicos
unique(beatles$inst)
unique(beatles$born)
# primeros valores head(df)
# ultimos valores tail(df)
head(beatles)
tail(beatles)
head(beatles, 2)
tail(beatles, 1)

# Subsituir todos los valores de solisita
beatles$solo <- c("Working class hero",
                  "Maybe I'm amazed",
                  "What is life?",
                  "I don't come easy")

# Operaciones element wise
# QUé edad tendrían los beatles este año?
edad_beatles <- 2021 - beatles$born
beatles$now <- 2021 - beatles$born
beatles

tempC <- c(28, 25, 32, 29)
tempK <- tempC + 273.15
tempK_chr <- as.character(tempK)

to_K <- c(273.15, 273.15, 273.15, 273.15)
tempC + to_K

# Leer archivo de texto como data frame TADA!!!!
# read.table(path, header= T, sep =",", stringsAsFactor=F)

survey <- read.table("02_data/respuestas27.csv", # la dirección del archivo
                     header = T,  # Tienen nombre las columnas? Sí = T, No = F
                     sep = ",") # Cómo están separadas las columnas
names(survey) <- c("date", "name", "last_name", "age",
                   "where", "unalm", "study", "year",
                   "program", "lang", "os", "lab", 
                   "excel", "R", "why")

# vamos a hacer unas estadisticas
edad_media <- mean(survey$age)
survey$study == "Ingeniería ambiental"

# Quiénes son colegas?
sum(survey$study == "Ingeniería ambiental")

hist(survey$age)

# Aprender R es una historia de ENSAYOy 
# ERROR (+ HORROR)


  