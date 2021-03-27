---
output:
  pdf_document: default
  html_document: default
---
# Hand-on Lab 1: Comparando medias mensuales de PM2.5

## Problema

Como en toda megaciudad, Lima sufre los embates de la contaminación atmosférica.
Durante la pandemia, al igual que en diferentes ciudades, en Lima se tomaron medidas de isolamiento, las llamadas cuarentenas. 
En este ejercicio, aplicando tus nuevos conociemientos adquiridos de R,
vamos a usar los datos de PM25 para marzo del 2019, 2020, y 2021, 
medidos en [la embajada de los Estados Unidos en Perú](https://www.airnow.gov/international/us-embassies-and-consulates/#Peru$Lima), para ver el efecto de la cuarentena en la contaminación atmosférica.
Y además, tomando a la concentración de contaminante como um proxy de isolamiento, será que este marzo de 2021, estuvimos más isolados?

## Ejercicios

La columna con los datos que miden PM2.5 se llama `Raw.Conc`.

1. Lee los archivos `pm25_0319.csv`, `pm25_0320.csv`, `pm25_0321.csv` en R.
2. Los datos están completos? si la respuesta es negativa, cuántos datos faltan para completar un mes de datos horarios.
3. Cuál es la máxima concentración horaria de PM2.5 en cada marzo? En qué día y a qué hora sucedió?
4. Cuál es la mínima concentración horaria de PM2.5 en cada marzo? En qué día y a qué hora sucedió?
5. Cuál es la média mensual para cada mes?
6. Tomando como referencia marzo de 2019 como nuestra línea base, cuál es la diferencia de concentración de PM2.5 con marzo de 2020 y marzo de 2021?
7. Estuvimos más isolados este mes?
