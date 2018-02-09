The Wine Tester
========================================================
author: Jorge Sauma
date: February 9th, 2018
autosize: true
css: bootstrap.css
width: 1440
height:1400

What is the Wine Tester
========================================================

- The Wine Tester is a web page that can tell if a wine's quality is good or bad.

- User just needs to enter the values of three of the main wine's attributes to get the quality of such wine. 

- The used attributes are: Alcohol level, Sulphites level, and the Volatile Acidity.

- The Wine Tester is good tool to select a good wine without having to be a wine expert.

Technical details
========================================================

"The Wine Tester" was inspired by this paper:
- https://www.sciencedirect.com/science/article/pii/S0167923609001377?via%3Dihub

Original data can be downloaded here:
- http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/

Here is the description of the data. Note: data was rearranged to get a better dataset:






```r
str (Tidy_wine_data)
```

```
'data.frame':	1599 obs. of  12 variables:
 $ FixedAcidity      : chr  "7.4" "7.8" "7.8" "11.2" ...
 $ VolatileAcidity   : chr  "0.7" "0.88" "0.76" "0.28" ...
 $ CitricAcid        : chr  "0" "0" "0.04" "0.56" ...
 $ ResidualSugar     : chr  "1.9" "2.6" "2.3" "1.9" ...
 $ Chlorides         : chr  "0.076" "0.098" "0.092" "0.075" ...
 $ FreeSulfurDioxide : chr  "11" "25" "15" "17" ...
 $ TotalSulfurDioxide: chr  "34" "67" "54" "60" ...
 $ Density           : chr  "0.9978" "0.9968" "0.997" "0.998" ...
 $ pH                : chr  "3.51" "3.2" "3.26" "3.16" ...
 $ Sulphates         : chr  "0.56" "0.68" "0.65" "0.58" ...
 $ Alcohol           : chr  "9.4" "9.8" "9.8" "9.8" ...
 $ Quality           : chr  "5" "5" "5" "6" ...
```

Model details
========================================================

The model for the Wine Tester was created using the Random Forest algorithm. Here are the details of the model definition:




```r
set.seed(2402)
modFit1<-train(Quality ~ ., data=training, method = "rf", proxy=TRUE)
```

```
note: only 2 unique complexity parameters in default grid. Truncating the grid to 2 .
```

```r
modFit1
```

```
Random Forest 

1200 samples
   3 predictors

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 1200, 1200, 1200, 1200, 1200, 1200, ... 
Resampling results across tuning parameters:

  mtry  RMSE       Rsquared   MAE      
  2     0.6599649  0.3491418  0.4901790
  3     0.6688691  0.3364541  0.4954775

RMSE was used to select the optimal model using the smallest value.
The final value used for the model was mtry = 2.
```

ENJOY!
========================================================
