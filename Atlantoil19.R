library(shiny)
library(tidyverse)
library(DT)
library(bslib)
#install.packages("bootstraplib")
library(bootstrap)
library(readxl)



dados <- read_excel("data_oil.xlsx")
dados1 <- dados[,c(1,37,23,13)]

ui <-  navbarPage("My Application",
                  tabPanel("Component 1",
                           tabPanel("Plot",card(fluidRow(column(12, dataTableOutput('table')))))
                  ),
                  tabPanel("Component 2"),
                  tabPanel("Component 3")
)
  

server <- function(input,output){
  #bs_theme_preview()
  output$table <- renderDataTable(
    dados1, filter = 'top',
    extensions = 'Buttons', 
    options = list(scrollX = TRUE
                   , pageLength = 5
                   , dom = 'Blfrtip'
                   ,buttons = c('copy', 'csv', 'excel', 'pdf', 'print',
                                'colvis')
    ))
}

shinyApp(ui=ui, server=server)
