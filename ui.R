library(shiny)
shinyUI(fluidPage(
  theme="bootstrap.css",
  titlePanel(
    img(src='title.png', align = "center")
  ),
  h2("\"The Wine Tester\" is your guide to choose a good wine."),
  h2("It uses the benefits of Machine Learning to simulate a professional
     wine tester that can tell if the wine's quality is bad, average, good 
     or excellent."),
  h2("Just select the values for the wine's attributes and let
     \"The Wine Tester\" decide if you should buy this bottle or discard it."),
  h1("Enjoy!"),
  h3("Instructions:"),
  h3("1. Move the slidebars to the desired value"),
  h3("2. Click the \"Calculate\" button to calculate the wine's quality"),
  h3("3. Wait for a rating to be displayed. Note: first calculation takes more time. Be patient"),
  h3("3. Read the Quality output. Possible values: Very Bad, Bad, Average, Above Average, Good, Very Good, and Excellent"),
  
  sidebarLayout(
      sidebarPanel(
          position="center",
          h2("Select the values for the wine's attributes:"),
          sliderInput("Alcohol_sl", "Alcohol level", 8, 15, value = 10, step=0.1),
          sliderInput("Sulphates_sl", "Sulphites level", 0, 2, value = 1, step=0.1),
          sliderInput("Acidity_sl", "Volatile Acidity", 0, 2, value = 1, step=0.1),
          submitButton("Calculate")
      ),
      mainPanel(
        tags$div(class="result",
            tags$h1("Wine Quality"),
            tags$div(class="qual",
                verbatimTextOutput("Quality")
                #textOutput("Quality")
            )    
        )
      )
  ),
  h4("\"The Wine Tester\" was inspired by this paper:"),
  h4("https://www.sciencedirect.com/science/article/pii/S0167923609001377?via%3Dihub"),
  h4("Original data can be downloaded here: "),
  h4("http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/")
)
)