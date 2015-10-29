　
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(edgeR)
library(reshape2)
load('pca_data2.RData')

plotByColor <- function(df, shape, color, text ) {
  ggplot(df, aes_string(x='x', y='y', label=text, shape=shape, color=color)) + geom_point(aes(size=18)) + geom_text(aes_string(vjust = -1)) + scale_shape_identity() + scale_color_discrete()
}



shinyServer(function(input, output,session) {
  
      
  mdsData <- reactive({
    
      dim <- c(input$dim1, input$dim2)
      dim <- as.numeric(dim)
      range <-  c(input$rangeStart , input$rangeEnd)
      range <- as.numeric(range)
      if (input$method == 'BCV'){      
        range = input$rangeEnd
    
        
      }
      
      
      
      d <- plotMDS(y, method = input$method, top=range , dim = dim)
      d <- data.frame(x = d$x, y = d$y) 
      d <- merge( classifications, d, by.x = 'Sample', by.y = 'row.names')
      return(d)
    })
  
  output$pcaPlot <- renderPlot({
    # draw the histogram with the specified number of bins
    
    plotByColor(mdsData(), input$shape, input$color, input$text)
  })
})
