# Polynomial Regression

## Setting the Working Directory
setwd('./Machine Learning A-Z/Part 2 - Regression/Section 6 - Polynomial Regression')


## Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

## Part 2

### Fitting Linear Regression to the Dataset

lin_reg = lm(formula = Salary ~ ., data = dataset)
summary(lin_reg)

### Fitting Polynomial Regression to the Dataset

dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
dataset
poly_reg = lm(formula = Salary ~ . , data = dataset)
summary(poly_reg)


## Part 3 

### Visualizing Linear Regression Results

library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') +
  xlab('Level') + ylab('Salary')


### Visualizing Polynomial Regression Results

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'salmon') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)), color = 'darkgreen') +
  ggtitle('Truth or Bluff (Polynomial Regression)') +
  xlab('Level') + ylab('Salary')
  
## Part 4

### Predicting a New Result with Linear Regression

y_pred = predict(lin_reg, data.frame(Level = 6.5))
y_pred


### Predicting a New Result with Polynomial Regression

y_pred = predict(poly_reg, data.frame(Level = 6.5, 
                                      Level2 = 6.5^2, 
                                      Level3 = 6.5^3, 
                                      Level4 = 6.5^4))
y_pred


