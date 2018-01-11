# | Functions are one of the fundamental building blocks of the R language. 
# | They are small pieces of reusable code that can be treated like any other R object.

# | The Sys.Date() function returns a string representing today's date.
Sys.Date()
## [1] "2018-01-08"

# | The mean() function takes a vector of numbers as input, and returns the average of all of the numbers in the input vector.
mean(c(2, 4, 5))
## [1] 3.666667

# General format of function in R :
# function_name <- function(arg1, arg2){
#	# Manipulate arguments in some way
#	# Return a value
# }

# Create a function named boring_function which takes x as input and return x without modifying it
boring_function <- function(x) {
  return(x)
}

# Test boring_function()
boring_function('My first function!')
## [1] "My first function!"

# | If you want to see the source code for any function, just type the function name without any arguments or parentheses.
boring_function
# function(x) {
    return(x)
# }
# <bytecode: 0x0000000016c0e550>

# | replicate the functionality of the mean() function by creating a function called: my_mean().
my_mean <- function(my_vector) {
  return(sum(my_vector)/length(my_vector))
}

my_mean(c(4, 5, 10))
# [1] 6.333333

# | create a function named increment() which takes two arguments: "number" and "by". 
# where "number" is the number to increment and "by" is the amount to increment by.
# set default value of "by" to 1
increment <- function(number, by){
  number + by
}

# create a function remainder() which takes two arguments, "num" and "divisor"
# where "num" is divided by "divisor" and remainder is returned.
# set the deault value of divisor to 2
remainder <- function(num, divisor=2){
  return(num %% divisor)
}
# run remainder(5) to check if it works
remainder(5)
## [1] 1
remainder(11,5)
## [1] 1
# You can also explicitly specify arguments in a function. When you explicitly designate argument values by name, the
# ordering of the arguments becomes unimportant.
remainder(divisor = 11, num = 5)
## [1] 5
# | R can also partially match arguments. Try typing remainder(4, div = 2) to see this feature in action.
remainder(4, div = 2)
## [1] 0
# look for function's argument with args() and not documentation
args(remainder)
function (num, divisor = 2) 
NULL

# YOU CAN PASS FUNCTION AS ARGUMENT
evaluate <- function(func, dat){
  func(dat)
}
  
# | Use evaluate to find the standard deviation of the vector c(1.4, 3.6, 7.9, 8.8).
evaluate(sd, c(1.4, 3.6, 7.9, 8.8))
## [1] 3.514138

#### Note : you can pass a function as an argument without first defining the passed function. Functions that are not named are
####        appropriately known as anonymous functions.

# | The first argument is a tiny anonymous function that takes one argument `x` and returns `x+1`. We passed the number 6 into this function so the entire
# | expression evaluates to 7.
evaluate(function(x){x+1}, 6)
## [1] 7

# | Try using evaluate() along with an anonymous function to return the first element of the vector c(8, 4, 0). Your anonymous function should only take one
# | argument which should be a variable `x`.
evaluate(function(x){x[1]}, c(8, 4, 0))
## [1] 8

# | Now return the last element of the same vector
evaluate(function(x){x[length(x)]}, c(8, 4, 0))
## [1] 0

#### Note :
?paste
# first argument of paste() is `...` which is referred to as an ellipsis or simply dot-dot-dot. The ellipsis allows an indefinite
# | number of arguments to be passed into a function. In the case of paste() any number of strings can be passed as arguments and paste() will return all of
# | the strings combined into one string.

# | Just to see how paste() works, type paste("Programming", "is", "fun!")
paste("Programming", "is", "fun!")
## [1] "Programming is fun!"

# The ellipses can be used to pass on arguments to other functions that are
# used within the function you're writing. Usually a function that has the
# ellipses as an argument has the ellipses as the last argument. The usage of
# such a function would look like:
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# In the above example arg1 has no default value, so a value must be provided
# for arg1. arg2 has a default value, and other arguments can come after arg2
# depending on how they're defined in the ellipses_func() documentation.
# Interestingly the usage for the paste function is as follows:
#
# paste (..., sep = " ", collapse = NULL)
#
# Notice that the ellipses is the first argument, and all other arguments after
# the ellipses have default values. This is a strict rule in R programming: all
# arguments after an ellipses must have default values. Take a look at the
# simon_says function below:
#
# simon_says <- function(...){
#   paste("Simon says:", ...)
# }
#
# The simon_says function works just like the paste function, except the
# begining of every string is prepended by the string "Simon says:"
# 
# Telegrams used to be peppered with the words START and STOP in order to
# demarcate the beginning and end of sentences. Write a function below called 
# telegram that formats sentences for telegrams.
# For example the expression `telegram("Good", "morning")` should evaluate to:
# "START Good morning STOP"
telegram <- function(...){
  paste("START", ..., "STOP")
}
telegram("Hello", "World")
## [1] "START Hello World STOP"

# Let's explore how to "unpack" arguments from an ellipses when you use the
# ellipses as an argument in a function. Below I have an example function that
# is supposed to add two explicitly named arguments called alpha and beta.
# 
# add_alpha_and_beta <- function(...){
#   # First we must capture the ellipsis inside of a list
#   # and then assign the list to a variable. Let's name this
#   # variable `args`.
#
#   args <- list(...)
#
#   # We're now going to assume that there are two named arguments within args
#   # with the names `alpha` and `beta.` We can extract named arguments from
#   # the args list by using the name of the argument and double brackets. The
#   # `args` variable is just a regular list after all!
#   
#   alpha <- args[["alpha"]]
#   beta  <- args[["beta"]]
#
#   # Then we return the sum of alpha and beta.
#
#   alpha + beta 
# }
#
# Have you ever played Mad Libs before? The function below will construct a
# sentence from parts of speech that you provide as arguments. We'll write most
# of the function, but you'll need to unpack the appropriate arguments from the
# ellipses.

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
mad_libs(Norway, countless, CCTV)
## [1] "News from Norway today where countless students took to the streets in protest of the new CCTV being installed on campus." 

# The syntax for creating new binary operators in R is unlike anything else in
# R, but it allows you to define a new syntax for your function. I would only
# recommend making your own binary operator if you plan on using it often!
#
# User-defined binary operators have the following syntax:
#      %[whatever]% 
# where [whatever] represents any valid variable name.
# 
# Let's say I wanted to define a binary operator that multiplied two numbers and
# then added one to the product. An implementation of that operator is below:
#
# "%mult_add_one%" <- function(left, right){ # Notice the quotation marks!
#   left * right + 1
# }
#
# I could then use this binary operator like `4 %mult_add_one% 5` which would
# evaluate to 21.
#
# Write your own binary operator below from absolute scratch! Your binary
# operator must be called %p% so that the expression:
#
#       "Good" %p% "job!"
#
# will evaluate to: "Good job!"

# lets use your opertor %p%
"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left, right)
}
'I' %p% 'love' %p% 'R!'
## [1] "I love R!"













 



