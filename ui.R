
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinyTable)
#load('pca.data') ## contains 2 obj classifcation and compoennts

shinyUI(fluidPage(

  # Application title
  titlePanel("PLOT ALL PCA!"),
  
  
  column(12,plotOutput("pcaPlot"), align='center'),
  hr(),

  # Sidebar with a slider input for number of bins
  fluidRow(  sidebarLayout(
    sidebarPanel(
      selectInput("dim1", "Choose Your XAxis ( Principal Componenets )" , choices=1:nrow(classifications), selected = 1),
      selectInput("dim2", "Choose Your YAxis ( Principal Componenets )" , choices=1:nrow(classifications), selected=2),
      sliderInput("range", "Genes Range:", min = 1, max = 10000, value = c(1, 500)),
      selectInput("method", "Choose PCA Method", choices=c('BCF','logFC'), selected='logFC')
      
      
      
    ),
    
    mainPanel(
      column(4, radioButtons('text', 'Choose Label Class', colnames(classifications), selected = 'Sample', inline = T, width = NULL)),
      column(4,radioButtons('color', 'Choose Color Class', colnames(classifications), selected = 'Type', inline = T, width = NULL)),
      column(4, radioButtons('shape', 'Choose Shape Class', colnames(classifications), selected = 'Batch', inline = T, width = NULL))
      
      )
    
    
    # Show a plot of the generated distribution
  ))

))
