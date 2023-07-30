#A API deve ser gerada no google cloud em API
#fica dando erro se não restrigir a chave para os recursos usados
#que devem ser ativados: https://appsilon.com/interactive-google-maps-with-r-shiny/
#solução do erro que estava dando: https://stackoverflow.com/questions/46560859/expiredkeymaperror-on-newly-generated-api-key


#Carregando pacotes
library(googleway)
library(readxl)


#Carregando os dados e recursos
dados <- read_xlsx("Mapa/locais_afetados.xlsx")
api_key <- c("AIzaSyCO1kXag-sv5DND7Wz8tzmzNrfC51r5Z1g")


head(data)

google_map(
  key = api_key
)

map <- google_map(
  key = api_key,
  data = dados
)
map %>%
  add_markers(lat = "decimalLatitude", lon = "decimalLongitude")




dados$COLOR <- "red"

map <- google_map(
  key = api_key,
  data = dados
)

map %>%
  add_markers(lat = "decimalLatitude", lon = "decimalLatitude")


map <- google_map(
  key = api_key,
  data = dados
)

map %>%
  add_markers(lat = "decimalLatitude", lon = "decimalLongitude",
              mouse_over = "localidade")


dados$INFO <- paste0(dados$localidade, " | ", 
                     dados$municipio, ", ", dados$sigla_uf)
map <- google_map(
  key = api_key,
  data = dados
)
map %>%
  add_markers(lat = "decimalLatitude", lon = "decimalLongitude",
              mouse_over = "INFO")
