#Carregando pacotes
library(googleway)
library(readxl)

#Carregando os dados e recursos
dados_map <- read_xlsx("Mapa/locais_afetados.xlsx")
api_key <- c("AIzaSyCO1kXag-sv5DND7Wz8tzmzNrfC51r5Z1g")

dados_map$INFO <- paste0(dados_map$localidade, " | ", 
                         dados_map$municipio, ", ", dados_map$sigla_uf)
map <- google_map(
  key = api_key,
  width = "100%",
  height = "100%",
  data = dados_map
)
map %>%
  add_markers(lat = "decimalLatitude", lon = "decimalLongitude",
              mouse_over = "INFO")