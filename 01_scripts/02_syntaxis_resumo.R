# Resumen de syntaxis

# Como calculadora
((5 + 3) / 2 )^2 - 1

# Asignar valores con "<-"
## Valor numérico
number <- 10
float <- 7.9

## Character
word <- "rstudio"
phrase <- "Aprendo R y RStudio y me divierto"

## Llamar una función
print("Hello world!")

## Un vector c()
vector <- c(1, 3, 5, 7, 9)

vector_chr <- c("a", "b", "c", "d")

vector_chr_num <- c("a", 1, 2, "b") # ???? Sólo un tipo de valores

## Una función se define así

al_cuadrado <- function(x){
  sqr <- x * x
  return(sqr)
}

al_cuadrado(2)

## Un loop
for (i in seq(1, 3)){
  print(paste("A la ", i))
}

## Un dataframe

df <- data.frame(letras = c("a", "b", "c"),
                  num = c(1, 2, 3))