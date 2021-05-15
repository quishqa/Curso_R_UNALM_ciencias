---
output:
  pdf_document: default
  html_document: default
---
# Hand-on Lab 2: Script, funciones y loops

## Problema
Muchas veces la información que necesitamos no se encuentra en el formato que queremos.
A veces, está toda la información junta y necesitamos filtrarla, otras vezes tiene datos faltantes, un encodign diferente.
En este ejercicio, tienes en un sólo archivo de texto,
toda la información de concentraciones de PM2.5 de los meses de marzo de 2019, 2020 y 2021.
Usando tus conocimientos de funciones y scripts desarrollarás las siguientes tareas:

## Ejercicios:
1. Improta el archivo `pm25_march_19_20_21.tsv`. Primero examina el archivo, está separado por comas?

2. Crea un vector con los años que tiene ese archivo.

3. Crea una función para crear un data frame por año, que tenga como argumentos toda la base de datos y el año que se quiere filtrar.

4. Usa tu función para crear un data.frame con la información de marzo de 2019, de 2020 y 2021

5. Desarrolla un loop que imprima el mes con su año y la media mensual de marzo de ese año: "Mar 2020: 19.55"