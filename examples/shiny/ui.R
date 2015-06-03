library(shiny)
library(D3forceNetwork)

shinyUI(fluidPage(
  
  titlePanel("Shiny networkD3 "),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("opacity", "Opacity", 0.6, min = 0.1, max = 1, step = .1)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Force Network", D3forceNetworkOutput("force"))
      )
    )
  )
))