# Reinforcement Learning

### Part 1

## Setting the Working Directory

setwd('./Machine Learning A-Z/Part 6 - Reinforcement Learning/Section 32 - Upper Confidence Bound (UCB)')

## Import the Dataset

dataset = read.csv('./Ads_CTR_Optimisation.csv')
View(dataset)

## Implementing Random Selection
N = 10000
d = 10
ads_selected = integer(0)
total_reward = 0
for (n in 1:N) {
  ad = sample(1:10, 1)
  ads_selected = append(ads_selected, ad)
  reward = dataset[n, ad]
  total_reward = total_reward + reward
}
total_reward

## Visualizing the Results - Histogram

hist(ads_selected, col='blue', main='Histogram of Ads Selection', 
     xlab='Ads', ylab='Number of Times Each Ad Was Selected')

### Part 2
#### Implementing Upper Confidence Bound

N = 10000
d = 10
ads_selected = integer()
numbers_of_selections = integer(d)
sums_of_rewards = integer(d)
total_reward = 0
#### For Loop in UCB

for (n in 1:N){
  ad = 0
  max_upper_bound = 0
  for (i in 1:d){
    if (numbers_of_selections[i] > 0){
      average_reward = sums_of_rewards[i]/numbers_of_selections[i]
      delta_i = sqrt(3/2 * log(n)/numbers_of_selections[i])
      upper_bound = average_reward + delta_i
    }else {
      upper_bound = 1e400
    }
    if (upper_bound > max_upper_bound){
      max_upper_bound = upper_bound
      ad = i
    }
  }
### Part 3
  
  ads_selected = append(ads_selected, ad)
  numbers_of_selections[ad] = numbers_of_selections[ad] + 1
  reward = dataset[n, ad]
  sums_of_rewards[ad] = sums_of_rewards[ad] + reward
  total_reward = total_reward + reward
}
ads_selected
total_reward

### Part 4

#### Visualizing the Results - Histogram

hist(ads_selected, col = 'red', main = 'Histogram of Ads Selections',
     xlab = 'Ads', ylab = 'Number of Times Each Ad was Selected')
