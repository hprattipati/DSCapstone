#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that predicts next word
shinyUI(fluidPage(

    # Application title
    titlePanel("Data Science Specialization - Capstone Project"),

    
    sidebarLayout(
        sidebarPanel(
            h4("Next Word prediction"),
            textInput("word1",
                      "Input a word or phrase upto 4 words"),
            submitButton("Predict next word", icon("refresh"))
        ),

        
        mainPanel(
            tabsetPanel(
            tabPanel("Prediction",
                     h4("Input given:"), textOutput("words"),
                     br(),
                     h4("Probable next word based on input"),verbatimTextOutput("nxtword") ),
            tabPanel("How It works",h3("Prediction algorithm"),
                     br(),
                     includeHTML("./Description.html")
                     )
            )
        )
    )
))
