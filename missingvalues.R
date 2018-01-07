# | Any operation involving NA generally yields NA as the result. To illustrate, let's create a vector c(44, NA, 5, NA) and assign
# | it to a variable x.
x <- c(44,NA, 5, NA)

# | Now, let's multiply x by 3.
x * 3
## [1] 132  NA  15  NA

# | create a vector containing 1000 draws from a standard normal distribution with y <- rnorm(1000).
y <- rnorm(1000)

# | create a vector containing 1000 NAs with z <- rep(NA, 1000).
z <- rep(NA, 1000)

# | Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't know how many NAs
# | we'll wind up with or what positions they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).
my_data <- sample(c(y, z), 100)

# |  Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each element of a
# | vector is NA. Call is.na() on my_data and assign the result to my_na.
my_na <- is.na(my_data)

# | Now, print my_na to see what you came up with.
my_na
##  [1] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [21] FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
## [41] FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE
## [61] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
## [81]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE

# | Does the expression my_data == NA yields the same results as is.na() ?
my_data == NA
## [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
## [42] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
## [83] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

# | The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0. Therefore,
# | if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.

# | Let's give that a try here. Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the total
# | number of NAs in my_data. Don't assign the result to a new variable.
sum(my_na)
# [1] 42

# | print my_data
my_data
#  [1]  0.867338293           NA  0.429242125 -1.095044415           NA -0.986957207           NA -1.477045152  0.274200738
# [10] -0.917508168           NA -2.024088127 -0.677045025 -0.455367931  0.786443383 -1.002607914  0.246766728           NA
# [19]           NA  0.005196304 -0.235418750           NA           NA -1.179275012           NA -0.478778184           NA
# [28]           NA           NA           NA           NA           NA           NA  0.404158880 -0.879476162           NA
# [37] -0.965070144           NA           NA  0.863682472 -0.529519883 -0.391408254           NA -0.572748583           NA
# [46]           NA -1.150455060 -1.231981731  0.476097837           NA -0.011011307           NA -0.100825903           NA
# [55]  0.405890475           NA           NA -0.431796635           NA  0.375344287 -0.107544779           NA -0.828237846
# [64] -1.378361877           NA           NA -1.999484969           NA -0.237758770 -1.591395673  1.029648534           NA
# [73] -0.071117400 -0.021349820           NA           NA -0.528259567           NA  1.653765361           NA           NA
# [82]  0.760686963  0.893319500           NA           NA  0.839410379  1.925278966           NA -0.181624740  0.316942268
# [91]  0.036160959  0.222145968  0.695405714 -0.545835883 -0.853786694           NA  2.391757465 -2.728035048  0.162587261

# | second type of missing value -- NaN, which stands for 'not a number'.
0 / 0
## [1] NaN

Inf - Inf
## [1] NaN


#[100]  0.299022656




