# | One of the great advantages of using a statistical programming language like R is its vast collection of tools for
# | simulating random numbers.

# | The first function we'll use to generate random numbers is sample(). Use ?sample to pull up the documentation.
?sample

# | Let's simulate rolling four six-sided dice
sample(1:6, 4, replace = TRUE)
## [1] 3 2 5 6
# 
# | Now repeat the command to see how your result differs. (The probability of rolling the exact same result is (1/6)^4
# | = 0.00077, which is pretty small!)
# sample(1:6, 4, replace = TRUE)
## [1] 3 6 6 5
#
# | sample(1:6, 4, replace = TRUE) instructs R to randomly select four numbers between 1 and 6, WITH replacement.
# | Sampling with replacement simply means that each number is "replaced" after it is selected, so that the same number
# | can show up more than once. This is what we want here, since what you roll on one die shouldn't affect what you roll
# | on any of the others.

# | Now sample 10 numbers between 1 and 20, WITHOUT replacement. To sample without replacement, simply leave off the
# | 'replace' argument.
sample(1:20, 10)
## [1]  3  5  9 14  7 17 20 15  1 18
# | Since the last command sampled without replacement, no number appears more than once in the output.

# | LETTERS is a predefined variable in R containing a vector of all 26 letters of the English alphabet.
LETTERS
## [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"

# | The sample() function can also be used to permute, or rearrange, the elements of a vector. For example, try
# | sample(LETTERS) to permute all 26 letters of the English alphabet.
sample(LETTERS)
## [1] "O" "I" "M" "R" "Z" "K" "E" "Y" "A" "P" "T" "C" "B" "W" "V" "H" "D" "G" "N" "J" "L" "U" "X" "F" "Q" "S"

# | This is identical to taking a sample of size 26 from LETTERS, without replacement. When the 'size' argument to
# | sample() is not specified, R takes a sample equal in size to the vector from which you are sampling.

# | Now, suppose we want to simulate 100 flips of an unfair two-sided coin. This particular coin has a 0.3 probability
# | of landing 'tails' and a 0.7 probability of landing 'heads'.
# | Let the value 0 represent tails and the value 1 represent heads. Use sample() to draw a sample of size 100 from the
# | vector c(0,1), with replacement. Since the coin is unfair, we must attach specific probabilities to the values 0
# | (tails) and 1 (heads) with a fourth argument, prob = c(0.3, 0.7). Assign the result to a new variable called flips.
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))
flips
## [1] 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 0 0 1 0 0 0 0 1 0 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1
##[58] 1 1 1 0 0 1 0 1 0 0 1 1 0 1 1 1 0 1 0 1 1 0 0 1 1 0 1 1 0 1 0 0 1 1 0 1 1 1 0 1 1 1 1

# | Since we set the probability of landing heads on any given flip to be 0.7, we'd expect approximately 70 of our coin
# | flips to have the value 1. Count the actual number of 1s contained in flips using the sum() function.
sum(flips)
## [1] 71

# | A coin flip is a binary outcome (0 or 1) and we are performing 100 independent trials (coin flips), so we can use
# | rbinom() to simulate a binomial random variable. Pull up the documentation for rbinom() using ?rbinom.
?rbinom

# | Each probability distribution in R has an r*** function (for "random"), a d*** function (for "density"), a p*** (
# | "probability"), and q*** (for "quantile"). We are most interested in the r*** functions 

# | A binomial random variable represents the number of 'successes' (heads) in a given number of independent 'trials'
# | (coin flips). 

# | Generate a single random variable that represents the number of heads in 100 flips
# | of our unfair coin using rbinom(1, size = 100, prob = 0.7). Note that you only specify the probability of 'success'
# | (heads) and NOT the probability of 'failure' (tails). Try it now.
rbinom(1, size = 100, prob = 0.7)
## [1] 68

# | Equivalently, if we want to see all of the 0s and 1s, we can request 100 observations, each of size 1, with success
# | probability of 0.7. Give it a try, assigning the result to a new variable called flips2.
flips2 <- rbinom(100, size = 1, prob = 0.7)
flips2
##  [1] 1 1 1 1 1 1 1 1 0 0 1 1 1 0 1 1 1 1 1 1 1 1 1 0 1 1 0 1 1 0 0 1 1 0 0 1 0 1 0 0 1 1 1 1 1 0 1 0 1 1 1 0 1 1 1 1 0
## [58] 1 1 1 1 0 1 1 1 1 0 0 1 0 1 0 0 1 1 0 1 1 1 1 1 0 1 0 1 1 0 1 0 1 1 1 1 0 0 1 1 1 1 0

# | Now use sum() to count the number of 1s (heads) in flips2. It should be close to 70!
sum(flips2)
## [1] 70

# | Similar to rbinom(), we can use R to simulate random numbers from many other probability distributions. Pull up the
# | documentation for rnorm() now.
?rnorm

# | The standard normal distribution has mean 0 and standard deviation 1.
# | the default values for the 'mean' and 'sd' arguments to rnorm() are 0 and 1, respectively.
rnorm(10)
## [1] -1.1597546 -0.7931967 -0.5584240  1.3259409  0.1493912  1.2429912 -0.1936775  0.6661137  0.1073612 -0.1526279
#
# | Now do the same, except with a mean of 100 and a standard deviation of 25.
rnorm(10, mean = 100, sd = 25)
## [1]  93.18557  70.81730  66.32810  49.32480 121.65456  82.92080 162.25589  76.27293 104.66060  94.68644

# | Finally, what if we want to simulate 100 *groups* of random numbers, each containing 5 values generated from a
# | Poisson distribution with mean 10? Let's start with one group of 5 numbers first.
#
# | Generate 5 random values from a Poisson distribution with mean 10.
rpois(5, lambda = 10)
## [1]  8  6 15 12 10
#
# Now use replicate to perform this operation 100 times and store the result in my-pois
my_pois <- replicate(100, rpois(5, 10))
#
# Now take a look at the contents of my_pois.
my_pois
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20]
# [1,]   10   11   10    9   10    3   14    9   10    11    19    12    14     9     7     8     7     9    15     5
# [2,]   16   10   13    6   12   13   12    5    6    15     9    14    11    17     4    14     6    14    14    13
# [3,]    5    5   10   10    8   10   10   13   13    11     6     9    11    13     8    10    19    11     8    12
# [4,]   12   11    8    9    9    9   12    7    7     9    10     7     8    12     9    11    10    11    12    12
# [5,]   11   13   10    9    9    7    8   17   10    12    16    12    13     7    13     6    15     7     7    10
#      [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34] [,35] [,36] [,37] [,38] [,39]
# [1,]    12     9    14    11    13    14     6    12    11    11     9    10    10    10     8    11    17    12     9
# [2,]     7    11    12     4     7     6    13     8    10     9     7     9    14     8    10     8    21    11     5
# [3,]     9     5    10     6    12     8     8     6     8    10    18    12    12    11    15    15     6     8     9
# [4,]     9    13     4     6    10    11    12    10    16    12    10    10     9     4    12     7    13    11    11
# [5,]    12     9     7    12    14     5    15    10    12     8    10    10     3    10     8    14     8    16     8
#      [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48] [,49] [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58]
# [1,]    10    13     7     5    12     9     8    10    13    11    11     9    12     9     9     5    12    12     7
# [2,]     8     7     6     9     6     5     9     8    11    10     7    10    15     8     4    14     8    14     9
# [3,]    10    11    10    12    15     9    11    11    12    13    13     9    10    10     8    12    10     7    10
# [4,]     6    17    15     8     8     5    11     6    12    14     6    13    10    12    11    12    11     8     3
# [5,]    10     8    10     8     9     9     9    12    15    13     9    14     8     7     9     9    12     9    10
#      [,59] [,60] [,61] [,62] [,63] [,64] [,65] [,66] [,67] [,68] [,69] [,70] [,71] [,72] [,73] [,74] [,75] [,76] [,77]
# [1,]     3    15     7    14    14    14     7     9     7    10    18    14    14     7     6    12     6     9     7
# [2,]     7     9    10    14    11     9    10     6    12     4    17     7    15     6     4     7    16     6    10
# [3,]    10    10    16    12    11    11    11    14    12    15     5    10    10    14    10    12     9    13    15
# [4,]    12     8     5     8     7    10     8    10    15    11     9     5     9    11    13     7    10    17    10
# [5,]    14     8    12     7    12    10    13     7    13     8     8    17    13    10     9    11    12    10     8
#      [,78] [,79] [,80] [,81] [,82] [,83] [,84] [,85] [,86] [,87] [,88] [,89] [,90] [,91] [,92] [,93] [,94] [,95] [,96]
# [1,]     7    10    11    13    11    12    12     9     3    12    13     7    14     6    11    15     8    11    12
# [2,]     7     7     5    12     5    11    13    15    12    10     8     6    13    13     6    11     9     8     8
# [3,]     9    11    12     8    14     8     9    10     6    10    14     8    14     8     9     7     7     7    13
# [4,]     7     7     9    11     8     7    13    10     4    13    10     8     9    13    11    10     8    14    11
# [5,]     8    12    17    10     7    10    14    12    11    10     6     8     5    14    13     9    15     8    12
#      [,97] [,98] [,99] [,100]
# [1,]    17    15     4      7
# [2,]    11    13    15     12
# [3,]    10     7    11      5
# [4,]    10    12    17     16
# [5,]    13    10    13     13


# | replicate() created a matrix, each column of which contains 5 random numbers generated from a Poisson distribution
# | with mean 10. Now we can find the mean of each column in my_pois using the colMeans() function. Store the result in
# | a variable called cm.
cm <- colMeans(my_pois)

# | And let's take a look at the distribution of our column means by plotting a histogram with hist(cm).
hist(cm)
# | Looks like our column means are almost normally distributed, right? That's the Central Limit Theorem at work

# | All of the standard probability distributions are built into R, including exponential (rexp()), chi-squared
# | (rchisq()), gamma (rgamma()), .... Well, you see the pattern.












