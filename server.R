library(shiny)
library(caret)
library(tidyr)
library(randomForest)

value=-1

#wine_data<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv")
wine_data<-read.csv("winequality-red.csv")
colnames(wine_data) <- "Wine_colnames"
Tidy_wine_data <- separate(wine_data, Wine_colnames, into=c("FixedAcidity", "VolatileAcidity", "CitricAcid", "ResidualSugar", "Chlorides", "FreeSulfurDioxide", "TotalSulfurDioxide", "Density", "pH", "Sulphates", "Alcohol", "Quality"), sep=";")

Tidy_wine_data<-as.data.frame(sapply(Tidy_wine_data, as.numeric))

wine_short_set<-Tidy_wine_data[c("Alcohol", "Sulphates", "VolatileAcidity", "Quality")]
training_partition <- createDataPartition(y = wine_short_set$Quality, p = 0.75, list=FALSE)
training <- wine_short_set[training_partition,]
validation <- wine_short_set[-training_partition,]

print("Ready")

shinyServer(function(input, output) {

  set.seed(2402)
  modFit1<-train(Quality ~ ., data=training, method = "rf", proxy=TRUE)
  
  QualityPred <- reactive({
    AlcoholInput <- input$Alcohol_sl
    SulphatesInput <- input$Sulphates_sl
    Acidityinput <- input$Acidity_sl
    round(predict(modFit1, newdata = data.frame(Alcohol=AlcoholInput, Sulphates=SulphatesInput, VolatileAcidity=Acidityinput)))
    })
  
  output$Quality <- renderText({
    value<-QualityPred()
    print(value)
    if (value >=0 & value<2) { "Very Bad" }
    else if (value>=2 & value<3) { "Bad" }
    else if (value>=3 & value<4) { "Average" }
    else if (value>=4 & value<5) { "Above average" }
    else if (value>=5 & value<6) { "Good" }
    else if (value>=6 & value<7) { "Very Good" }
    else if (value>=7) {"Excellent"}
    else {"Calculating..."}
  })
})