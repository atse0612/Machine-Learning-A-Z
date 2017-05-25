# Natural Language Processing

## Part 1

# Setting the Working Directory
setwd('./Machine Learning A-Z/Part 7 - Natural Language Processing/Section 37 - Natural Language Processing Algorithms')

# Importing the dataset
dataset_original = read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

## Part 2

# Cleaning the texts
# install.packages('tm')
# install.packages('SnowballC')
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset_original$Review))

## Part 3
corpus = tm_map(corpus, content_transformer(tolower))
as.character(corpus[[1]])
## Part 4
corpus = tm_map(corpus, removeNumbers)
as.character(corpus[[841]])

## Part 5
corpus = tm_map(corpus, removePunctuation)
as.character(corpus[[1]])

## Part 6
corpus = tm_map(corpus, removeWords, stopwords())
as.character(corpus[[1]])

## Part 7
corpus = tm_map(corpus, stemDocument)
as.character(corpus[[1]])

## Part 8
corpus = tm_map(corpus, stripWhitespace)
as.character(corpus[[841]])
as.character(corpus[[1]])

## Part 9

# Creating the Bag of Words model
dtm = DocumentTermMatrix(corpus)
dtm = removeSparseTerms(dtm, 0.999)

## Part 10

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

dataset = as.data.frame(as.matrix(dtm))
dataset$Liked = dataset_original$Liked

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))
dataset$Liked

# Splitting the dataset into the Training set and Test set

library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest Classification to the Training set

library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)
classifier

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)
cm

(79+70)/200