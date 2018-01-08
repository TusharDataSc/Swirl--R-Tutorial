###### MATRIX AND DATAFRAME ######
# Matrices can only contain a single class of data, while data frames can consist of many different classes of data.

# | create a vector containing the numbers 1 through 20 
my_vector <- 1:20
my_vector
## [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

# | The dim() function tells us the 'dimensions' of an object. What happens if we do dim(my_vector)? 
dim(my_vector)
## NULL

# find the length of my_vector
length(my_vector)
## [1] 20

# give my_vector a 'dim' attribute. 
dim(my_vector) <- c(4, 5)

# confirm that we have set the 'dim' attribute correctly
dim(my_vector)
## [1] 4 5

# | Another way to see this is by calling the attributes() function on my_vector. Try it now.
attributes(my_vector)
## $dim
## [1] 4 5

# view he content of my_vector
my_vector
##       [,1] [,2] [,3] [,4] [,5]
##  [1,]    1    5    9   13   17
##  [2,]    2    6   10   14   18
##  [3,]    3    7   11   15   19
##  [4,]    4    8   12   16   20

# | Now, let's confirm it's actually a matrix by using the class() function
class(my_vector)
## [1] "matrix"

# | Store the value of my_vector in a new variable called my_matrix.
my_matrix <- my_vector

# Note : Matrix is simply an atomic vector with a dimension attribute. matrix() function can also be used to create a matrix

# | create a matrix containing the numbers (1-20) and dimensions (4 rows, 5 columns) 
my_matrix2 <- matrix(1:20, nrow = 4, ncol = 5)

# confirm that my_matrix and my_matrix2 are actually identical.
identical(my_matrix, my_matrix2)
## [1] TRUE

# | Now, imagine that the numbers in our table represent some measurements from a clinical experiment, where each row represents one patient and each column
# | represents one variable for which measurements were taken.
# | We may want to label the rows, so that we know which numbers belong to each patient in the experiment. One way to do this is to add a column to the matrix,
# | which contains the names of all four people.

# | create a character vector containing the names of our patients -- Bill, Gina, Kelly, and Sean
# | Store the result in a variable called patients.
patients <- c("Bill", "Gina", "Kelly", "Sean")

# | use the cbind() function to 'combine columns' with two arguments -- the patients vector and my_matrix.
cbind(patients, my_matrix)
patients                       
## [1,] "Bill"   "1" "5" "9"  "13" "17"
## [2,] "Gina"   "2" "6" "10" "14" "18"
## [3,] "Kelly"  "3" "7" "11" "15" "19"
## [4,] "Sean"   "4" "8" "12" "16" "20"

# | matrices can only contain ONE class of data. Therefore, when we tried to combine a
# | character vector with a numeric matrix, R was forced to 'coerce' the numbers to characters, hence the double quotes.
# | This is called 'implicit coercion', because we didn't ask for it. 
# | Data Frames are the solution tho this problem.
my_data <- data.frame(patients, my_matrix)

# | Now view the contents of my_data to see what we've come up with.
my_data
#   patients X1 X2 X3 X4 X5
# 1     Bill  1  5  9 13 17
# 2     Gina  2  6 10 14 18
# 3    Kelly  3  7 11 15 19
# 4     Sean  4  8 12 16 20

# | call the class() function on our newly created data frame.
class(my_data)
## [1] "data.frame"

# | assign names to the columns of our data frame.
# | Create a character vector called cnames that contains the following values (in order) 
# | -- "patient", "age", "weight", "bp", "rating", "test".
cnames <- c("patient", "age", "weight", "bp", "rating", "test")

# | Now, use the colnames() function to set the `colnames` attribute for our data frame. 
colnames(my_data) <- cnames

# | Print the contents of my_data.
my_data
##    patient age weight bp rating test
##  1    Bill   1      5  9     13   17
##  2    Gina   2      6 10     14   18
##  3   Kelly   3      7 11     15   19
##  4    Sean   4      8 12     16   20










