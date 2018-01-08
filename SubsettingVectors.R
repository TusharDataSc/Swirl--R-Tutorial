# | created a vector called x that contains a random ordering of 20 numbers (from a standard normal distribution) and
# | 20 NAs. Type x now to see what it looks like.
sample(c(rnorm(20), rep(NA, 20)))
#   x
#  [1] -0.1810913  1.1631353         NA  1.0543190         NA         NA  0.9219092         NA  1.7851252         NA         NA
# [12]         NA  0.3485079  0.5691754         NA         NA         NA  0.2999769         NA         NA         NA -1.8007918
# [23]  1.0407016  1.7755705 -0.5373061         NA -0.9397652         NA         NA  0.8097822 -0.4657390         NA -0.8591798
# [34] -0.2168145  0.9095468         NA -0.4870950 -0.3555410         NA         NA

# | view the first ten elements of x.
x[1:10]
## [1]         NA  0.3620513         NA  1.5077505         NA         NA         NA -0.1354412  0.4008181         NA

# | is.na(x) yields a vector of logical values the same
# | length as x, with TRUEs corresponding to NA values in x and FALSEs corresponding to non-NA values in x.

# | What do you think x[is.na(x)] will give you?
# 1: A vector of all NAs
# 2: A vector of TRUEs and FALSEs
# 3: A vector with no NAs
# 4: A vector of length 0
## Selection: 1

# print x[is.na(x)]
x[is.na(x)]
## [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

# create a vector called y that contains all of the non-NA values from x
y <- x[!is.na(x)] 

# | Print y to the console.
y
## [1]  0.36205133  1.50775052 -0.13544123  0.40081809  0.31371513 -1.18529934 -0.82051417  0.23414314  0.84038849  2.03246643
##[11]  0.52904062  1.18184965 -1.46919749  0.26604910 -0.31950252 -1.04060542 -0.68550709  2.27984937 -1.49475312 -0.08222847

# | What do you think y[y > 0] will give you?
# 1: A vector of all the negative elements of y
# 2: A vector of TRUEs and FALSEs
# 3: A vector of all the positive elements of y
# 4: A vector of all NAs
# 5: A vector of length 0
# Selection: 3

# Type y[y > 0] to see that we got all the positive elements of y
y[y > 0]
## [1] 0.3620513 1.5077505 0.4008181 0.3137151 0.2341431 0.8403885 2.0324664 0.5290406 1.1818497 0.2660491 2.2798494

# | Now isolate the positive elements of x i.e. reques only values of x that are both non-missing and greater than zero.
x[x > 0]
##  [1]        NA 0.3620513        NA 1.5077505        NA        NA        NA 0.4008181        NA 0.3137151 0.2341431 0.8403885
## [13]        NA 2.0324664 0.5290406        NA        NA        NA        NA        NA        NA        NA 1.1818497        NA
## [25]        NA 0.2660491        NA        NA        NA 2.2798494        NA

# Combining our knowledge of logical operators with our new knowledge of subsetting, we could do this -- x[!is.na(x) & x > 0].
x[!is.na(x) & x > 0]
## [1] 0.3620513 1.5077505 0.4008181 0.3137151 0.2341431 0.8403885 2.0324664 0.5290406 1.1818497 0.2660491 2.2798494

# subset the 3rd, 5th, and 7th elements of x
x[c(3, 5, 7)]
## [1] NA NA NA

# What happens if we ask for zeroth element of x ?
x[0]
## numeric(0)

# print 3000th elemet of x
x[3000]
## [1] NA

# | R accepts negative integer indexes.
# | What if we're interested in all elements of x EXCEPT the 2nd and 10th?
x[c(-2, -10)] # x[-c(2, 10)]
##  [1]          NA          NA  1.50775052          NA          NA          NA -0.13544123  0.40081809  0.31371513 -1.18529934
## [11] -0.82051417  0.23414314  0.84038849          NA  2.03246643  0.52904062          NA          NA          NA          NA
## [21]          NA          NA          NA  1.18184965 -1.46919749          NA          NA  0.26604910          NA -0.31950252
## [31]          NA -1.04060542 -0.68550709          NA  2.27984937 -1.49475312          NA -0.08222847

# | Create a numeric vector with three named elements using vect <- c(foo = 11, bar = 2, norf = NA).
vect <- c(foo = 11, bar = 2, norf = NA)

# | When we print vect to the console, you'll see that each element has a name. Try it out.
vect
## foo  bar norf 
##  11    2   NA

# | We can also get the names of vect by passing vect as an argument to the names() function. Give that a try.
names(vect)
## [1] "foo"  "bar"  "norf"

# | create an unnamed vector vect2 with c(11, 2, NA)
vect2 <- c(11, 2, NA)

# add the `names` attribute to vect2 after the fact
names(vect2) <- c("foo", "bar", "norf")

# check if vect and vect2 are identical
identical(vect, vect2)
## [1] TRUE

# | Now, back to the matter of subsetting a vector by named elements. Which of the following commands do you think would give us
# | the second element of vect?
# 1: vect["2"]
# 2: vect[bar]
# 3: vect["bar"]
## Selection: 3
vect["bar"]
## bar 
##   2

# | Likewise, we can specify a vector of names with vect[c("foo", "bar")]. Try it out.
vect[c("foo", "bar")]
## foo bar 
##  11   2
















