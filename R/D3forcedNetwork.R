#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
D3forcedNetwork <- function(Links, Nodes, Source, Target, Value, NodeID,Nodesize,
                            Group, height = NULL, width = NULL, colourScale = "d3.scale.category20()",
                            fontsize = 7, linkDistance = 50, legend = FALSE, 
                            linkWidth = "function(d) { return Math.sqrt(d.value); }", charge = -120,
                            linkColour = "#666",opacity = 0.6)
        {

        # Subset data frames for network graph
        if (!is.data.frame(Links)){
                stop("Links must be a data frame class object.")
        }
        if (!is.data.frame(Nodes)){
                stop("Nodes must be a data frame class object.")
        }
        if (missing(Value)){
                LinksDF <- data.frame(Links[, Source], Links[, Target])
                names(LinksDF) <- c("source", "target")
        }
        else if (!missing(Value)){
                LinksDF <- data.frame(Links[, Source], Links[, Target], Links[, Value])
                names(LinksDF) <- c("source", "target", "value")
        }
        if (!missing(Nodesize)){
                NodesDF <- data.frame(Nodes[, NodeID], Nodes[, Group], Nodes[, Nodesize])
                names(NodesDF) <- c("name", "group", 'nodesize')
                nodesize = 'true'
        }else{
                NodesDF <- data.frame(Nodes[, NodeID], Nodes[, Group])
                names(NodesDF) <- c("name", "group") 
                nodesize = 'false'
        }
        if (legend){
                legend = 'true'
        }
        
        # create options
        options = list(
                NodeID = NodeID,
                Group = Group,
                colourScale = colourScale,
                fontsize = fontsize,
                clickTextSize = fontsize * 2.5,
                linkDistance = linkDistance,
                linkWidth = linkWidth,
                charge = charge,
                linkColour = linkColour,
                opacity = opacity,
                legend = legend,
                nodesize = nodesize
        )

  # create widget
  htmlwidgets::createWidget(
    name = 'D3forcedNetwork',
    x= list(links = LinksDF, nodes = NodesDF, options = options),
    width = width,
    height = height,
    htmlwidgets::sizingPolicy(padding = 0, browser.fill = TRUE),
    package = 'D3forcedNetwork'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
D3forcedNetworkOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'D3forcedNetwork', width, height, package = 'D3forcedNetwork')
}

#' Widget render function for use in Shiny
#'
#' @export
renderD3forcedNetwork <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, D3forcedNetworkOutput, env, quoted = TRUE)
}
