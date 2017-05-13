# Apriori

### Part 1

## Change Working Directory

setwd('./Machine Learning A-Z/Part 5 - Association Rule Learning/Section 28 - Apriori')


# Data Preprocessing

### Loading the Arules Package

library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 100)
itemFrequencyPlot(dataset, topN = 10)
3*7/7500

## Part 2

### Training Apriori on the dataset
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.4))


## Part 3

### Visualising the results
inspect(sort(rules, by = 'lift')[1:10])



