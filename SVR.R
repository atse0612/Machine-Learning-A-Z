# Support Vector Regression

## Setting the Working Directory
setwd('./Machine Learning A-Z/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)')

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting the SVR Model to the dataset
library(e1071)
regressor = svm(formula = Salary ~  .,
                data= dataset,
                type= 'eps-regression')

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Visualising the SVR Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')