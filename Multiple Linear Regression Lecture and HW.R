# Multiple Linear Regression

setwd('./Machine Learning A-Z/Part 2 - Regression/Section 5 - Multiple Linear Regression')

# Importing the dataset
dataset = read.csv('50_Startups.csv')
# dataset = dataset[, 2:3]

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

dataset


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


## Part 2
# Feature Scaling
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting Multiple Linear Regression Models
regressor = lm(formula = Profit ~ ., data = training_set)
summary(regressor)


## Part 3 - Predicting the Test Set Results

y_pred = predict(regressor, newdata = test_set)
y_pred

## Building the Optimal Model Using Backward Elimination

regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
                 Marketing.Spend + State, data = dataset)
summary(regressor)

#### Iteration 1

regressor = lm(formula = Profit ~ R.D.Spend + Administration + 
                 Marketing.Spend, data = dataset)
summary(regressor)


#### Iteration 2 (Solutions) 
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset)
summary(regressor)


#### Iteration 3

regressor = lm(formula = Profit ~ R.D.Spend, data = dataset)
summary(regressor)


