#### Note : lapply() and sapply()
# | Both take a list as input, apply a function to each element of the list, then combine and return the result.
# | lapply() always returns a list, whereas sapply() attempts to simplify the result

# | The Flags dataset from the UCI Machine Learning Repository contains details of various nations and their flags. More
# | information may be found here: http://archive.ics.uci.edu/ml/datasets/Flags
flags <- read.table("flag.data.txt")

# review the dataset
dim(flags)
head(flags)
str(flags)
summary(flags)

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

# | Whereas sapply() tries to 'guess' the correct format of the result, vapply() allows you to specify it explicitly. If
# | the result doesn't match the format you specify, vapply() will throw an error, causing the operation to stop. This
# | can prevent significant problems in your code that might be caused by getting unexpected return values from
# | sapply().

# | Try vapply(flags, unique, numeric(1)), which says that you expect each element of the result to be a numeric vector
# | of length 1. Since this is NOT actually the case, YOU WILL GET AN ERROR. Once you get the error, type ok() to
# | continue to the next question.

vapply(flags, unique, numeric(1))
# Error in vapply(flags, unique, numeric(1)) : values must be length 1,
# but FUN(X[[1]]) result is length 194
ok()

sapply(flags, class)
#     name   landmass       zone       area population   language   religion       bars    stripes    colours 
# "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
#      red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
# "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer" 
# saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
# "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 

vapply(flags, class, character(1))
#     name   landmass       zone       area population   language   religion       bars    stripes    colours 
# "factor"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer" 
#      red      green       blue       gold      white      black     orange    mainhue    circles    crosses 
# "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"  "integer"  "integer" 
# saltires   quarters   sunstars   crescent   triangle       icon    animate       text    topleft   botright 
# "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"  "integer"   "factor"   "factor" 

# character(1) - vapply() result is identical to sapply() result result i.e. a character vector of column classes.

#### Note : vapply is 'safer' than sapply(), sine it requires you to specify the format of the output in advance
#### vapply() may perform faster than sapply() for large datasets
#### However, when doing data analysis interactivley, sapply() saves you some typing and will often be good enough

# see the content of variable 'landmass' in tabular format
table(flags$landmass)
## 1  2  3  4  5  6
## 31 17 35 52 39 20

# tabulate 'animate' variable
table(flags$animate)
## 0   1 
## 155  39 

# | If you take the arithmetic mean of a bunch of 0s and 1s, you get the proportion of 1s. Use tapply(flags$animate,
# | flags$landmass, mean) to apply the mean function to the 'animate' variable separately for each of the six landmass
# | groups, thus giving us the proportion of flags containing an animate image WITHIN each landmass group.
tapply(flags$animate, flags$landmass, mean)
##         1         2         3         4         5         6 
## 0.4193548 0.1764706 0.1142857 0.1346154 0.1538462 0.3000000 
# | The first landmass group (landmass = 1) corresponds to North America and contains the highest proportion of flags
# | with an animate image (0.4194).

# | Similarly, we can look at a summary of population values (in round millions) for countries with and without the
# | color red on their flag with tapply(flags$population, flags$red, summary).
tapply(flags$population, flags$red, summary)
## $`0`
## Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 0.00    0.00    3.00   27.63    9.00  684.00 
# 
## $`1`
## Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 0.0     0.0     4.0    22.1    15.0  1008.0 

# | What is the median population (in millions) for countries *without* the color red on their flag?
# 1: 4.0
# 2: 22.1
# 3: 0.0
# 4: 27.6
# 5: 9.0
# 6: 3.0
# Selection: 6

# | Lastly, use the same approach to look at a summary of population values for each of the six landmasses.
tapply(flags$population, flags$landmass, summary)
# $`1`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    0.00    0.00   12.29    4.50  231.00 
# 
# $`2`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    1.00    6.00   15.71   15.00  119.00 
# 
# $`3`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    0.00    8.00   13.86   16.00   61.00 
# 
# $`4`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.000   1.000   5.000   8.788   9.750  56.000 
# 
# $`5`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    2.00   10.00   69.18   39.00 1008.00 
# 
# $`6`
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00    0.00    0.00   11.30    1.25  157.00 

# | What is the maximum population (in millions) for the fourth landmass group (Africa)?
# 1: 157.00
# 2: 1010.0
# 3: 56.00
# 4: 5.00
# 5: 119.0
# Selection: 3

# | In this lesson, you learned how to use vapply() as a safer alternative to sapply(), which is most helpful when
# | writing your own functions. You also learned how to use tapply() to split your data into groups based on the value
# | of some variable, then apply a function to each group. 




















