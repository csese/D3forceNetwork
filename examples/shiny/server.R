library(shiny)
library(D3forceNetwork)

data(MisLinks)
data(MisNodes)

shinyServer(function(input, output) {
    
  output$force <- renderD3forceNetwork({
          D3forceNetwork(Links = MisLinks, Nodes = MisNodes2, Source = "source",
                         Nodesize = 'size',Target = "target", Value = "value", NodeID = "name",
                         Group = "group", opacity = input$opacity, legend = T)
  })
  
  
})
