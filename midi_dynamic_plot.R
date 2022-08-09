#Requires installation of following three libraries before loading

library(sna)
library(tsna)
library(ndtv)

staticEdges <- read.csv(file.choose()) #load the edges and vertices into variables
vertexAttributes <- read.csv (
  file.choose(),
  stringsAsFactors = FALSE
)

# Make and visualize our static network
thenetwork <- network(
  staticEdges,
  vertex.attr = vertexAttributes,
  vertex.attrnames = c("vertex.id", "name"),
  directed = TRUE,
  biparte = FALSE,
  loops = TRUE
)
plot (thenetwork, 
      displaylabels=TRUE, 
      label='name',
      vertex.cex=5,
      label.pos=7,
      arrowhead.cex=1.5,
      label.cex=2,
      edge.lwd=3,
      vertex.col='light blue')

#import temporal network data
dynamicNodes <- read.csv(file.choose())
dynamicEdges <- read.csv(file.choose())

#Make the temporal network
dynaHappen <- networkDynamic(
  thenetwork,
  edge.spells = dynamicEdges,
  vertex.spells = dynamicNodes
)

#Check the temporal network
network.dynamic.check(dynaHappen)

# Plot network dynamic object as a static image
plot(dynaHappen,
     displaylabels=TRUE,
     label='name',
     vertex.cex=5,
     label.pos=7,
     arrowhead.cex=1.5,
     label.cex=2,
     edge.lwd=3,
     vertex.col='light blue')

#Calculate how to plot an animated version of the dynamic network
compute.animation(
  dynaHappen,
  animation.mode = "kamadakawai", #force directed algorithm
  slice.par = list(
    start = 0, #start time
    end = 15359, #end time
    interval = 3840, #increment of advancement for frame
    aggregate.dur = 3840, #how much time included in each frame?
    rule = "any"
  )
)

#Plot dynamic network as a filmstrip
filmstrip(
  dynaHappen, 
  displaylabels = TRUE,
  label='name',
  vertex.cex=5,
  label.pos=7,
  arrowhead.cex=1.5,
  label.cex=1.5,
  edge.lwd=3,
  vertex.col='light blue')

# Render the animation and open it in a web browser
render.d3movie(
  dynaHappen,
  displaylabels = TRUE,
  label='name',
  vertex.cex=5,#vertex size
  label.pos=7,
  arrowhead.cex=1.5,
  label.cex=2,
  edge.lwd=3,
  vertex.col='light blue',
  #This slice function makes the labels work
  vertex.tooltip = function(slice) {
    paste (
      "<b>Note_name:</b>", (slice %v% "note_name")
    )
  }
)

?plot.network #see all parameters available to change for plotting in Statnet Network