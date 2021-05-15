# Preparando datos para el ejercicio de 03 Marzo de 2020

lima19 <- read.table("02_data/Lima_PM2.5_2019_YTD.csv", header = T,
                     sep = ",", stringsAsFactors = F)
lima20 <- read.table("02_data/Lima_PM2.5_2020_YTD.csv", header = T,
                     sep = ",", stringsAsFactors = F)
lima21 <- read.table("02_data/Lima_PM2.5_2021_YTD.csv", header = T,
                     sep = ",", stringsAsFactors = F)

mar19 <- subset(lima19, subset = Month == 3 & Raw.Conc. >= 0.0)
mar20 <- subset(lima20, subset = Month == 3 & Raw.Conc. >= 0.0)
mar21 <- subset(lima21, subset = Month == 3 & Raw.Conc. >= 0.0)

write.table(mar19, "02_data/pm25_0319.csv", row.names = F, quote = F, sep = ",")
write.table(mar20, "02_data/pm25_0320.csv", row.names = F, quote = F, sep = ",")
write.table(mar21, "02_data/pm25_0321.csv", row.names = F, quote = F, sep = ",")

a <- read.table("02_data/pm25_0319.csv", sep = ",", header = T, stringsAsFactors = F, dec=".")
b <- read.table("02_data/pm25_0320.csv", sep = ",", header = T, stringsAsFactors = F, dec=".")
c <- read.table("02_data/pm25_0321.csv", sep = ",", header = T, stringsAsFactors = F, dec=".")

all_march <- do.call(rbind, list(mar19, mar20, mar21))

write.table(all_march, "02_data/pm25_march_19_20_21.tsv", sep = "\t", quote = F, row.names = F)

d <- read.table("02_data/pm25_march_19_20_21.tsv", header = T, sep = "\t")
