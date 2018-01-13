# load text data with read.table() and csv file with read.csv()
flags <- read.table("flag.data.txt")

# preview first six lines of the dataset
head(flags)

##             name landmass zone area population language religion bars stripes colours red green blue gold white black
## 1    Afghanistan        5    1  648         16       10        2    0       3       5   1     1    0    1     1     1
## 2        Albania        3    1   29          3        6        6    0       0       3   1     0    0    1     0     1
## 3        Algeria        4    1 2388         20        8        2    2       0       3   1     1    0    0     1     0
## 4 American-Samoa        6    3    0          0        1        1    0       0       5   1     0    1    1     1     0
## 5        Andorra        3    1    0          0        6        0    3       0       3   1     0    1    1     0     0
## 6         Angola        4    2 1247          7       10        5    0       2       3   1     0    0    1     0     1
##   orange mainhue circles crosses saltires quarters sunstars crescent triangle icon animate text topleft botright
## 1      0   green       0       0        0        0        1        0        0    1       0    0   black    green
## 2      0     red       0       0        0        0        1        0        0    0       1    0     red      red
## 3      0   green       0       0        0        0        1        1        0    0       0    0   green    white
## 4      1    blue       0       0        0        0        0        0        1    1       1    0    blue      red
## 5      0    gold       0       0        0        0        0        0        0    0       0    0    blue      red
## 6      0     red       0       0        0        0        1        0        0    1       0    0     red    black

# check out the dimensions of the dataset
dim(flags)
## [1] 194  30
# there are 194 rows, or observations, and 30 columns, or variables.

#### Note : To open a more complete description of the dataset in a separate text file, type viewinfo()

# what is the 'class' of each variable? check what happens if you write class(flags)
class(flags)
## [1] "data.frame"
# This just tells us that entire dataset is stored as data.frame, which doesn't answer our question
# what we really need is to call class() on each individual column. 

#### Note :
# | The lapply() function takes a list as input, applies a function to each element of the list, then returns a list of
# | the same length as the original one. Since a data frame is really just a list of vectors

# | Type cls_list <- lapply(flags, class) to apply the class() function to each column of the flags dataset and store
# | the result in a variable called cls_list.
cls_list <- lapply(flags, class)
cls_list
## $name
## [1] "factor"
##
## $landmass
## [1] "integer"
##
## $zone
## [1] "integer"
##
## $area
## [1] "integer"
##
## $population
## [1] "integer"
##
## $language
## [1] "integer"
##
## $religion
## [1] "integer"
##
## $bars
## [1] "integer"
##
## $stripes
## [1] "integer"
##
## $colours
## [1] "integer"
##
## $red
## [1] "integer"
##
## $green
## [1] "integer"
##
## $blue
## [1] "integer"
##
## $gold
## [1] "integer"
##
## $white
## [1] "integer"
##
## $black
## [1] "integer"
##
## $orange
## [1] "integer"
##
## $mainhue
## [1] "factor"
##
## $circles
## [1] "integer"
##
## $crosses
## [1] "integer"
##
## $saltires
## [1] "integer"
##
## $quarters
## [1] "integer"
##
## $sunstars
## [1] "integer"
##
## $crescent
## [1] "integer"
##
## $triangle
## [1] "integer"
##
## $icon
## [1] "integer"
##
## $animate
## [1] "integer"
##
## $text
## [1] "integer"
##
## $topleft
## [1] "factor"
##
## $botright
## [1] "factor"

class(cls_list)
## [1] "list"

# | You may remember from a previous lesson that lists are most helpful for storing multiple classes of data. In this
# | case, since every element of the list returned by lapply() is a character vector of length one (i.e. "integer" and
# | "vector"), cls_list can be simplified to a character vector. To do this manually, type as.character(cls_list).
as.character(cls_list)
## [1] "factor"  "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer" "integer"
## [12] "integer" "integer" "integer" "integer" "integer" "integer" "factor"  "integer" "integer" "integer" "integer"
## [23] "integer" "integer" "integer" "integer" "integer" "integer" "factor"  "factor" 

# | sapply() allows you to automate this process by calling lapply() behind the scenes, but then attempting to simplify
# | (hence the 's' in 'sapply') the result for you. Use sapply() the same way you used lapply() to get the class of each
# | column of the flags dataset and store the result in cls_vect. If you need help, type ?sapply to bring up the
# | documentation.

cls_vect <- sapply(flags, class)
class(cls_vect)
## [1] "character"

# | In general, if the result is a list where every element is of length one, then sapply() returns a vector. If the
# | result is a list where every element is a vector of the same length (> 1), sapply() returns a matrix. If sapply()
# | can't figure things out, then it just returns a list, no different from what lapply() would give you.

# | Therefore, if we want to know the total number of countries (in our dataset) with, for example, the color orange on
# | their flag, we can just add up all of the 1s and 0s in the 'orange' column. Try sum(flags$orange) to see this.
sum(flags$orange)
## [1] 26

# | Now we want to repeat this operation for each of the colors recorded in the dataset.
# | First, use flag_colors <- flags[, 11:17] to extract the columns containing the color data and store them in a new
# | data frame called flag_colors. (Note the comma before 11:17. This subsetting command tells R that we want all rows,
# | but only columns 11 through 17.)
flag_colors <- flags[, 11:17]

# | Use the head() function to look at the first 6 lines of flag_colors.
head(flag_colors)
## red green blue gold white black orange
##   1   1     1    0    1     1     1      0
##   2   1     0    0    1     0     1      0
##   3   1     1    0    0     1     0      0
##   4   1     0    1    1     1     0      1
##   5   1     0    1    1     0     0      0
##   6   1     0    0    1     0     1      0

# | To get a list containing the sum of each column of flag_colors, call the lapply() function with two arguments. The
# | first argument is the object over which we are looping (i.e. flag_colors) and the second argument is the name of the
# | function we wish to apply to each column (i.e. sum). Remember that the second argument is just the name of the
# | function with no parentheses, etc.
lapply(flag_colors, sum)
## $red
## [1] 153
##
## $green
## [1] 91
##
## $blue
## [1] 99
##
## $gold
## [1] 91
##
## $white
## [1] 146
##
## $black
## [1] 52
##
## $orange
## [1] 26

# | The result is a list, since lapply() always returns a list.
# | Each element of this list is of length one, so the result can be simplified 
# | to a vector by calling sapply() instead of lapply().
sapply(flag_colors, sum)
## red  green   blue   gold  white  black orange 
## 153     91     99     91    146     52     26 
sapply(flag_colors, mean)
##       red     green      blue      gold     white     black    orange 
## 0.7886598 0.4690722 0.5103093 0.4690722 0.7525773 0.2680412 0.1340206 

# | To illustrate this, let's extract columns 19 through 23 from the flags dataset and store the result in a new data
# | frame called flag_shapes.
flag_shapes <- flags[, 19:23]

# | The range() function returns the minimum and maximum of its first argument, which should be a numeric vector. Use
# | lapply() to apply the range function to each column of flag_shapes. Don't worry about storing the result in a new
# | variable. By now, we know that lapply() always returns a list.
lapply(flag_shapes, range)
## $circles
## [1] 0 4
##
## $crosses
## [1] 0 2
##
## $saltires
## [1] 0 1
##
## $quarters
## [1] 0 4
##
## $sunstars
## [1]  0 50

shape_mat <- sapply(flag_shapes, range)
shape_mat
##      circles crosses saltires quarters sunstars
## [1,]       0       0        0        0        0
## [2,]       4       2        1        4       50

class(shape_mat)
## [1] "matrix"

# | As we've seen, sapply() always attempts to simplify the result given by lapply(). It has been successful in doing so
# | for each of the examples we've looked at so far. Let's look at an example where sapply() can't figure out how to
# | simplify the result and thus returns a list, no different from lapply().

# | When given a vector, the unique() function returns a vector with all duplicate elements removed. In other words,
# | unique() returns a vector of only the 'unique' elements. To see how it works, try unique(c(3, 4, 5, 5, 5, 6, 6)).
unique(c(3, 4, 5, 5, 5, 6, 6))
## [1] 3 4 5 6

# | We want to know the unique values for each variable in the flags dataset. To accomplish this, use lapply() to apply
# | the unique() function to each column in the flags dataset, storing the result in a variable called unique_vals.
unique_vals <- lapply(flags, unique)

# | Since unique_vals is a list, you can use what you've learned to determine the length of each element of unique_vals
sapply(unique_vals, length)
##     name   landmass       zone       area population   language   religion       bars    stripes    colours 
##      194          6          4        136         48         10          8          5         12          8 
##      red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
##        2          2          2          2          2          2          2          8          4          3 
## saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
##        2          3         14          2          2          2          2          2          7          8 

# | The fact that the elements of the unique_vals list are all vectors of *different* length poses a problem for
# | sapply(), since there's no obvious way of simplifying the result.

# | Use sapply() to apply the unique() function to each column of the flags dataset to see that you get the same
# | unsimplified list that you got from lapply().
sapply(flags, unique)
# $name
# [1] Afghanistan              Albania                  Algeria                  American-Samoa          
# [5] Andorra                  Angola                   Anguilla                 Antigua-Barbuda         
# [9] Argentina                Argentine                Australia                Austria                 
# [13] Bahamas                  Bahrain                  Bangladesh               Barbados                
# [17] Belgium                  Belize                   Benin                    Bermuda                 
# [21] Bhutan                   Bolivia                  Botswana                 Brazil                  
# [25] British-Virgin-Isles     Brunei                   Bulgaria                 Burkina                 
# [29] Burma                    Burundi                  Cameroon                 Canada                  
# [33] Cape-Verde-Islands       Cayman-Islands           Central-African-Republic Chad                    
# [37] Chile                    China                    Colombia                 Comorro-Islands         
# [41] Congo                    Cook-Islands             Costa-Rica               Cuba                    
# [45] Cyprus                   Czechoslovakia           Denmark                  Djibouti                
# [49] Dominica                 Dominican-Republic       Ecuador                  Egypt                   
# [53] El-Salvador              Equatorial-Guinea        Ethiopia                 Faeroes                 
# [57] Falklands-Malvinas       Fiji                     Finland                  France                  
# [61] French-Guiana            French-Polynesia         Gabon                    Gambia                  
# [65] Germany-DDR              Germany-FRG              Ghana                    Gibraltar               
# [69] Greece                   Greenland                Grenada                  Guam                    
# [73] Guatemala                Guinea                   Guinea-Bissau            Guyana                  
# [77] Haiti                    Honduras                 Hong-Kong                Hungary                 
# [81] Iceland                  India                    Indonesia                Iran                    
# [85] Iraq                     Ireland                  Israel                   Italy                   
# [89] Ivory-Coast              Jamaica                  Japan                    Jordan                  
# [93] Kampuchea                Kenya                    Kiribati                 Kuwait                  
# [97] Laos                     Lebanon                  Lesotho                  Liberia                 
# [101] Libya                    Liechtenstein            Luxembourg               Malagasy                
# [105] Malawi                   Malaysia                 Maldive-Islands          Mali                    
# [109] Malta                    Marianas                 Mauritania               Mauritius               
# [113] Mexico                   Micronesia               Monaco                   Mongolia                
# [117] Montserrat               Morocco                  Mozambique               Nauru                   
# [121] Nepal                    Netherlands              Netherlands-Antilles     New-Zealand             
# [125] Nicaragua                Niger                    Nigeria                  Niue                    
# [129] North-Korea              North-Yemen              Norway                   Oman                    
# [133] Pakistan                 Panama                   Papua-New-Guinea         Parguay                 
# [137] Peru                     Philippines              Poland                   Portugal                
# [141] Puerto-Rico              Qatar                    Romania                  Rwanda                  
# [145] San-Marino               Sao-Tome                 Saudi-Arabia             Senegal                 
# [149] Seychelles               Sierra-Leone             Singapore                Soloman-Islands         
# [153] Somalia                  South-Africa             South-Korea              South-Yemen             
# [157] Spain                    Sri-Lanka                St-Helena                St-Kitts-Nevis          
# [161] St-Lucia                 St-Vincent               Sudan                    Surinam                 
# [165] Swaziland                Sweden                   Switzerland              Syria                   
# [169] Taiwan                   Tanzania                 Thailand                 Togo                    
# [173] Tonga                    Trinidad-Tobago          Tunisia                  Turkey                  
# [177] Turks-Cocos-Islands      Tuvalu                   UAE                      Uganda                  
# [181] UK                       Uruguay                  US-Virgin-Isles          USA                     
# [185] USSR                     Vanuatu                  Vatican-City             Venezuela               
# [189] Vietnam                  Western-Samoa            Yugoslavia               Zaire                   
# [193] Zambia                   Zimbabwe                
# 194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina ... Zimbabwe
# 
# $landmass
# [1] 5 3 4 6 1 2
# 
# $zone
# [1] 1 3 2 4
# 
# $area
# [1]   648    29  2388     0  1247  2777  7690    84    19     1   143    31    23   113    47  1099   600  8512     6
# [20]   111   274   678    28   474  9976     4   623  1284   757  9561  1139     2   342    51   115     9   128    43
# [39]    22    49   284  1001    21  1222    12    18   337   547    91   268    10   108   249   239   132  2176   109
# [58]   246    36   215   112    93   103  3268  1904  1648   435    70   301   323    11   372    98   181   583   236
# [77]    30  1760     3   587   118   333  1240  1031  1973  1566   447   783   140    41  1267   925   121   195   324
# [96]   212   804    76   463   407  1285   300   313    92   237    26  2150   196    72   637  1221    99   288   505
# [115]    66  2506    63    17   450   185   945   514    57     5   164   781   245   178  9363 22402    15   912   256
# [134]   905   753   391
# 
# $population
# [1]   16    3   20    0    7   28   15    8   90   10    1    6  119    9   35    4   24    2   11 1008    5   47   31
# [24]   54   17   61   14  684  157   39   57  118   13   77   12   56   18   84   48   36   22   29   38   49   45  231
# [47]  274   60
# 
# $language
# [1] 10  6  8  1  2  4  3  5  7  9
# 
# $religion
# [1] 2 6 1 0 5 3 4 7
# 
# $bars
# [1] 0 2 3 1 5
# 
# $stripes
# [1]  3  0  2  1  5  9 11 14  4  6 13  7
# 
# $colours
# [1] 5 3 2 8 6 4 7 1
# 
# $red
# [1] 1 0
# 
# $green
# [1] 1 0
# 
# $blue
# [1] 0 1
# 
# $gold
# [1] 1 0
# 
# $white
# [1] 1 0
# 
# $black
# [1] 1 0
# 
# $orange
# [1] 0 1
# 
# $mainhue
# [1] green  red    blue   gold   white  orange black  brown 
# Levels: black blue brown gold green orange red white
# 
# $circles
# [1] 0 1 4 2
# 
# $crosses
# [1] 0 1 2
# 
# $saltires
# [1] 0 1
# 
# $quarters
# [1] 0 1 4
# 
# $sunstars
# [1]  1  0  6 22 14  3  4  5 15 10  7  2  9 50
# 
# $crescent
# [1] 0 1
# 
# $triangle
# [1] 0 1
# 
# $icon
# [1] 1 0
# 
# $animate
# [1] 0 1
# 
# $text
# [1] 0 1
# 
# $topleft
# [1] black  red    green  blue   white  orange gold  
# Levels: black blue gold green orange red white
# 
# $botright
# [1] green  red    white  black  blue   gold   orange brown 
# Levels: black blue brown gold green orange red white

# | Pretend you are interested in only the second item from each element of the unique_vals list that you just created.
# | Since each element of the unique_vals list is a vector and we're not aware of any built-in function in R that
# | returns the second element of a vector, we will construct our own function.

# | lapply(unique_vals, function(elem) elem[2]) will return a list containing the second item from each element of the
# | unique_vals list. Note that our function takes one argument, elem, which is just a 'dummy variable' that takes on
# | the value of each element of unique_vals, in turn.
# | will return a list containing the second item from each element of the unique_vals list.
lapply(unique_vals, function(elem) elem[2])
# $name
# [1] Albania
# 194 Levels: Afghanistan Albania Algeria American-Samoa Andorra Angola Anguilla Antigua-Barbuda Argentina ... Zimbabwe
# 
# $landmass
# [1] 3
# 
# $zone
# [1] 3
# 
# $area
# [1] 29
# 
# $population
# [1] 3
# 
# $language
# [1] 6
# 
# $religion
# [1] 6
# 
# $bars
# [1] 2
# 
# $stripes
# [1] 0
# 
# $colours
# [1] 3
# 
# $red
# [1] 0
# 
# $green
# [1] 0
# 
# $blue
# [1] 1
# 
# $gold
# [1] 0
# 
# $white
# [1] 0
# 
# $black
# [1] 0
# 
# $orange
# [1] 1
# 
# $mainhue
# [1] red
# Levels: black blue brown gold green orange red white
# 
# $circles
# [1] 1
# 
# $crosses
# [1] 1
# 
# $saltires
# [1] 1
# 
# $quarters
# [1] 1
# 
# $sunstars
# [1] 0
# 
# $crescent
# [1] 1
# 
# $triangle
# [1] 1
# 
# $icon
# [1] 0
# 
# $animate
# [1] 1
# 
# $text
# [1] 1
# 
# $topleft
# [1] red
# Levels: black blue gold green orange red white
# 
# $botright
# [1] red
# Levels: black blue brown gold green orange red white
 
# | The only difference between previous examples and this one is that we are defining and using our own function right
# | in the call to lapply(). Our function has no name and disappears as soon as lapply() is done using it. So-called
# | 'anonymous functions' can be very useful when one of R's built-in functions isn't an option.




