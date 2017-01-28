# Decision Tree Regression in R

## Setting the Working Directory
setwd('./Machine Learning A-Z/Part 2 - Regression/Section 8 - Decision Tree Regression')

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the Decision Tree Regression to the dataset
library(e1071)
library(rpart)
regressor = rpart(formula = Salary ~  .,
                data = dataset,
                control = rpart.control(minsplit = 1))

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualising the SVR Model results

library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, 
            newdata = data.frame(Level=X_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')