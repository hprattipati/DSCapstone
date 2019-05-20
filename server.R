#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tm)
source("./prediction.R")


shinyServer(function(input, output) {
    
    formatinput <- function(x)
    {
        formattext <- tolower(x)
        formattext <- removeNumbers(formattext)
        formattext <- removePunctuation(formattext)
        return(formattext)
    }

    predictnxtwrd <- function(x,y) {
        
        if(y==4)
        {
           x1 <- predict5gram(x)
        }
        if(y==3)
        
        {
            x1 <- predict4gram(x)
        }
        if(y==2)
        {
            x1 <- predict3gram(x)
        }
        if(y==1)
        {
            x1 <- predict2gram(x)
        }
        return(x1)
    }
    
        output$nxtword <- renderPrint({

        #x1 <- input$word1
        
        len <- length(unlist(strsplit(input$word1," ")))
        
        if(length(unlist(strsplit(input$word1,"")))==0)
        {
            result <- "Please enter a word to predict"
        }
        
        else {
            formatdata <- formatinput(input$word1)
            
            result <- predictnxtwrd(formatdata,len) 
        }
        if (is.null(result))
        {
            result <- "No probable word found"
        }
        
        
        print(result)

    })
        
    output$words <- renderText({
        input$word1
    })
    
   

})
