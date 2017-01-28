# Random Forest Regression in R

## Setting the Working Directory
setwd('./Machine Learning A-Z/Part 2 - Regression/Section 9 - Random Forest Regression')

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Random Forest Regression to the dataset
library(e1071)
library(randomForest)
library(rpart)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)
regressor

# Predicting a new result

y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualising the Random Forest Regression Model results

library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, 
                                        newdata = data.frame(Level=X_grid))),
            color = 'blue') +
  ggtitle('Truth or Bluff (Random Forest Regression)') +
  xlab('Level') +
  ylab('Salary')