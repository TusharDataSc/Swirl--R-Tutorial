5 + 7
# [1] 12

x <- 5 + 7
x
# [1] 12

y <- x - 3
y
## [1] 9

z <- c(1.1, 9, 3.14)
z
## [1] 1.10 9.00 3.14

c(z, 555, z)
## [1]   1.10   9.00   3.14 555.00   1.10   9.00   3.14
z * 2 + 100
## [1] 102.20 118.00 106.28


my_sqrt <- sqrt(z - 1)

# 1: a vector of length 0 
# 2: a vector of length 3
# 3: a single number

my_sqrt
## [1] 0.3162278 2.8284271 1.4628739

my_div <- z / my_sqrt
# 1: my_div is undefined
# 2: my_div is a single number (i.e a vector of length 1)
# 3: The first element of my_div is equal to the first element of z divided by the first element of my_sqrt, and so on...

my_div
## [1] 3.478505 3.181981 2.146460

z * 2 + 100
## [1] 102.20 118.00 106.28

z * c(2, 2, 2) + c(100, 100, 100)
## [1] 102.20 118.00 106.28

c(1, 2, 3, 4) + c(0, 10)
## [1]  1 12  3 14

c(1, 2, 3, 4) + c(0, 10, 100)
## Warning in c(1, 2, 3, 4) + c(0, 10, 100): 
## [1]   1  12 103   4