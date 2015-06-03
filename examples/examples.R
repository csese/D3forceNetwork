library(D3forceNetwork)

# forceNetwork  
data(MisLinks)
data(MisNodes)
D3forceNetwork(Links = MisLinks, Nodes = MisNodes2, Source = "source",
             Nodesize = 'size',Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4, legend = T)


