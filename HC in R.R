# Hierarchical Clustering

### Part 1

## Change Working Directory

setwd('./Machine Learning A-Z/Part 4 - Clustering/Section 25 - Hierarchical Clustering')

## Importing the Mall Dataset

dataset <- read.csv("Mall_Customers.csv")
dataset
X <- dataset[4:5]
X

### Part 2

## Using the Dendrogram to Find the Optimal Number of Clusters

dendrogram = hclust(dist(X, method = 'euclidean'), method='ward.D')
plot(dendrogram, main=paste('Dendrogram'), 
     xlab='Customers', ylab='Euclidean Distances')

### Part 3

## Fitting Hierarchical Clustering to the Mall Dataset

hc = hclust(dist(X, method='euclidean'), method='ward.D')
y_hc = cutree(hc, 5)
y_hc

### Part 4

## Visualizing the Clusters
library(cluster)
clusplot(X, y_hc, lines = 0, shade = TRUE, color = TRUE, 
         labels = 2, plotchar = FALSE, span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = "Annual Income",
         ylab = "Spending Score")



