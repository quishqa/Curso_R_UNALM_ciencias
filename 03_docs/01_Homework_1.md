---
output:
  pdf_document: default
  html_document: default
---
# Tarea para la casa 1: Datos Aeropuerto Jorge Chavez

## Problema

Para un trabajo de modelación de dispersión de contaminantes atmosféricos dentro de Lima, 
se va a utilizar los datos metoerológicos del [aeropuerto internacional Jorge Chavez](https://mesonet.agron.iastate.edu/request/download.phtml?network=PE__ASOS).
La información se encuentra en el archivo `SPJC.csv`. 
Usando tus conocientos de R verificarás esta información comparándola con los valores climatológicos (Fuente: Wikipedia).

| Temperatura (ºC) | Humedad Relativa (%) | Velocidad del viento (km/h) | Dirección del viento |
|------------------|----------------------|-----------------------------|----------------------|
|       20         |         87           |           11                |         S            |

# Ejercicios

1. Importa el archivo SPJC.csv a R
2. La información está completa? si la respuesta es negativa, cuántos datos faltan para completar un año
de información horaria?
3. El modelo de dispersión, sólo requiere de temperatura, humedad relativa, velocidad y dirección del
viento y la fecha, reduzca el data frame para 5 columnas.
4. Qué tipo de objeto tiene cada columna? tiene sentido? Haga las modificaciones pertinentes.
5. Tiene sentido los valores de temperatura y velocidad del viento? Recuerda que el modelo utiliza el
Sistema Internacional de Unidades. Haga las modificaciones pertinentes.
6. Calcule la temperatura, humedad relativa y velociadad del viento promedio anual. Qué hay con la
dirección del viento?
7. Halla el día más calido, el más frío, el más húmedo y el más seco.
8. Cree un data.frame con sólo la información de verano y otro con sólo la información de invierno (puede
seleccionar sólo dos meses por estación).
9. Calcule la temperatura, humedad relativa y velocidad del viento promedio para verano e invierno.
10. Comparar los resultados con los valores climatológicos.