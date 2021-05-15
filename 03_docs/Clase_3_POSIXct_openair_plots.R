---
title: "Un curso introductorio de R"
subtitle: "`openair`, series temporales y buenos plots"
author: "Mario Gavidia-Calderón"
date: "4/9/2021"
output: 
  beamer_presentation:
    theme: "Dresden"
    fonttheme: "structurebold"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## El menú de hoy
- as.POSIXct()
- Completando datos faltantes de fecha
- `openair`
- Plots (buenos plots)

## `as.POSIXct()`
- Un dato `POSIXct` representa **tiempos** y **fechas de calendarios**.
- Importante decirle a R que tenemos datos de fechas de calendarios:
   - Permite nuevas funcionalidades
   - Integración con otros paquetes/librerias