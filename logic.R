# Use the equality operator below to find out if TRUE is equal to TRUE.
TRUE == TRUE
## [1] TRUE

# | Just like arithmetic, logical expressions can be grouped by parenthesis 
(FALSE == TRUE) == FALSE
# [1] TRUE

# | The equality operator can also be used to compare numbers. Use `==` to see if 6 is equal to 7.
6 == 7
## [1] FALSE

# Write an expression to test whether 6 is less than 7.
6 < 7
## [1] TRUE

#  Write an expression to test whether 10 is less than or equal to 10.
10 <= 10
## [1] TRUE

# | Which of the following evaluates to FALSE?
# 1: 6 < 8
# 2: 0 > -36
# 3: 9 >= 10
# 4: 7 == 7
## Selection: 3

# | Which of the following evaluates to TRUE?
# 1: 57 < 8
# 2: 9 >= 10
# 3: 7 == 9
# 4: -6 > -7
## Selection: 4

# | Try writing an expression to see if 5 is not equal to 7.
5 != 7
## [1] TRUE

# Try using the NOT operator and the equals operator to find the opposite of whether 5 is equal to 7.
!(5 == 7)
## [1] TRUE

# | Which of the following evaluates to FALSE?
# 1: 7 != 8
# 2: 9 < 10
# 3: !FALSE
# 4: !(0 >= -1)
## Selection: 4

# | What do you think the following expression will evaluate to?: (TRUE != FALSE) == !(6 == 7)
# 1: Can there be objective truth when programming?
# 2: %>%
# 3: TRUE
# 4: FALSE
## Selection: 3

# | There are two AND operators in R, `&` and `&&`. Both operators work similarly, if
# | the right and left operands of AND are both TRUE the entire expression is TRUE, otherwise it is FALSE.
# Try typing false and false 
FALSE & FALSE
## [1] FALSE

#### Note : `&` operator evaluates AND across a vector. The `&&` version of AND only evaluates the first member of a vector. 

# Evaluate TRUE & c(TRUE, FALSE, FALSE).
TRUE & c(TRUE, FALSE, FALSE)
## [1]  TRUE FALSE FALSE

# | Now we'll type the same expression except we'll use the `&&` operator. 
TRUE && c(TRUE, FALSE, FALSE)
## [1] TRUE
# | In this case, the left operand is only evaluated with the first member of the right operand (the vector). The rest of the
# | elements in the vector aren't evaluated at all in this expression.

#### Note : | The OR operator follows a similar set of rules.
# The `|` version of OR evaluates OR across an entire vector, while the `||`
# version of OR only evaluates the first member of a vector.
# | An expression using the OR operator will evaluate to TRUE if the left operand or the right operand is TRUE. If both are TRUE,
# | the expression will evaluate to TRUE, however if neither are TRUE, then the expression will be FALSE.
TRUE | c(TRUE, FALSE, FALSE)
## [1] TRUE TRUE TRUE

TRUE || c(TRUE, FALSE, FALSE)
## [1] TRUE

# | All AND operators are evaluated before OR operators. Try it out
5 > 8 || 6 != 8 && 4 > 3.9
## [1] TRUE
# | 6 is not equal 8, 4 is greater than 3.9, therefore both operands are TRUE so the resulting expression `TRUE &&
# | TRUE` evaluates to TRUE. Then the left operand of the OR operator is evaluated: 5 is not greater than 8 so the entire
# | expression is reduced to FALSE || TRUE. Since the right operand of this expression is TRUE the entire expression 
# | evaluates to TRUE.

# | Which one of the following expressions evaluates to TRUE?
# 1: 99.99 > 100 || 45 < 7.3 || 4 != 4.0
# 2: TRUE && 62 < 62 && 44 >= 44
# 3: FALSE || TRUE && FALSE
# 4: TRUE && FALSE || 9 >= 4 && 3 < 6
## Selection: 4

# | Which one of the following expressions evaluates to FALSE?
# 1: FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5
# 2: 6 >= -9 && !(6 > 7) && !(!TRUE)
# 3: FALSE || TRUE && 6 != 4 || 9 > 4
# 4: !(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
## Selection: 1

# | isTRUE() takes one argument. If that argument evaluates to TRUE, the function will return TRUE. Otherwise, the
# | function will return FALSE.
isTRUE(6 > 4)
## [1] TRUE

# | Which of the following evaluates to TRUE?
# 1: !isTRUE(4 < 3)
# 2: isTRUE(!TRUE)
# 3: isTRUE(3)
# 4: isTRUE(NA)
# 5: !isTRUE(8 != 5)
## Selection: 1

# | identical() will return TRUE if the two R objects passed to it as arguments are identical. 
identical('twin', 'twins')
## [1] FALSE

# Try again but with 'twins'
identical('twins', 'twins')
## [1] TRUE

# | Which of the following evaluates to TRUE?
# 1: identical(5 > 4, 3 < 3.1)
# 2: identical('hello', 'Hello')
# 3: !identical(7, 7)
# 4: identical(4, 3.1)
## Selection: 1

# | The xor() function stands for exclusive OR. If one
# | argument evaluates to TRUE and one argument evaluates to FALSE, then this function will return TRUE, otherwise it will return
# | FALSE. Try out the xor() function by typing: xor(5 == 6, !FALSE)
xor(5 == 6, !FALSE)
## [1] TRUE
# | 5 == 6 evaluates to FALSE, !FALSE evaluates to TRUE, so xor(FALSE, TRUE) evaluates to TRUE. On the other hand if the first
# | argument was changed to 5 == 5 and the second argument was unchanged then both arguments would have been TRUE, 
# | so xor(TRUE,TRUE) would have evaluated to FALSE.

# | Which of the following evaluates to FALSE?
# 1: xor(4 >= 9, 8 != 8.0)
# 2: xor(!isTRUE(TRUE), 6 > -1)
# 3: xor(identical(xor, 'xor'), 7 == 7.0)
# 4: xor(!!TRUE, !!FALSE)
## Selection: 1

# create a vector of random sampling of integers from 1 to 10 without replacement.
ints <- sample(10)
ints
## [1]  1  6  5  2  8  3  9  7 10  4

# check whether each element of ints is greater than 5.
ints > 5
## [1] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE

#### Note : The which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE.
# | Use the which() function to find the indices of ints that are greater than 7.
which(ints > 7)
## [1] 5 7 9

# | Which of the following commands would produce the indices of the elements in ints that are less than or equal to 2?
# 1: which(ints < 2)
# 2: ints < 2
# 3: which(ints <= 2)
# 4: ints <= 2
## Selection: 3

#### Note : any() function will return TRUE if one or more of the elements in the logical vector is TRUE. 
# The all() function will return TRUE if every element in the logical vector is TRUE.

# | Use the any() function to see if any of the elements of ints are less than zero.
any(ints < 0)
## [1] FALSE

# | Use the all() function to see if all of the elements of ints are greater than zero.
all(ints > 0)
## [1] TRUE

# | Which of the following evaluates to TRUE?
# 1: all(ints == 10)
# 2: any(ints == 10)
# 3: any(ints == 2.5)
# 4: all(c(TRUE, FALSE, TRUE))
## Selection: 2








