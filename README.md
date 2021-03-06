# D3 JavaScript Network Graphs from R
########################################
## DEPRECATED: Those features have now been implemented into the d3Network package!
########################################
Version 0.1

This is a package inspired from the work from Christopher Gandrud. 

He implemented the [d3Network](http://christophergandrud.github.io/d3Network/) package to the
[htmlwidgets](https://github.com/ramnathv/htmlwidgets) framework.

Here the user can only use the forced network layout. However, he can add a legend depending on the group as well as changing the radius of the nodes. 

## Installation

You can install **D3forceNetwork** from GitHub as follows:

```S
devtools::install_github('csese/D3forceNetwork')
```
This is not yet deployed to CRAN. 

## Usage

Here's an example of `D3forceNetwork`:

```S
# Load data
data(MisLinks)
data(MisNodes)

# Plot
D3forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Nodesize = 'size',Group = "group", opacity = 1, 
             linkDistance = 100,charge = -400, legend = TRUE,
             colourScale = "d3.scale.category20b()")
```

![Alt text](/Example.png?raw=true "Force Network including legend and radius modification with R")
