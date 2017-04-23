# K-Means Clustering

## Change Working Directory
setwd('./Machine Learning A-Z/Part 4 - Clustering/Section 24 - K-Means Clustering')

## Importing the Mall Dataset
dataset <- read.csv("Mall_Customers.csv")
dataset
X <- dataset[4:5]
X

## Using the Elbow Method to Find the Optimal Number of Clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10, wcss, type = "b", main = paste('Clusters of Clients'), 
     xlab = "Number of Clusters", ylab = "WCSS")

## Applying K-Means to the Mall Dataset
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

## Visualizing the Clusters
library(cluster)
clusplot(X, kmeans$cluster, lines = 0, shade = TRUE, color = TRUE, 
         labels = 2, plotchar = FALSE, span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = "Annual Income",
         ylab = "Spending Score")
