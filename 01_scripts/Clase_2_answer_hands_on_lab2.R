# Solución Hands-on Lab2 

# 1. El archivo está separado por tabs: \t

all_march <- read.table("02_data/pm25_march_19_20_21.tsv", header = T, dec = ".", sep = "\t")

# 2. vector con los años
years <- unique(all_march$Year)

# 3. Función para extraer por año

FilterByYear <- function(all_data, year){
  month_year <- subset(all_march, subset = Year == year & QC.Name == "Valid")
  return(month_year)
}

# 4. 
mar_19 <- FilterByYear(all_data, 2019)
mar_20 <- FilterByYear(all_data, 2020)
mar_21 <- FilterByYear(all_data, 2021)

# 5.
for (year in years){
  print(paste("Marzo", year, 
        mean(FilterByYear(all_march, year)$Raw.Conc.))
  )
}