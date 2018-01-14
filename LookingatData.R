# | Whenever you're working with a new dataset, the first thing you should do is look at it! What is the format of the
# | data? What are the dimensions? What are the variable names? How are the variables stored? Are there missing data?
# | Are there any flaws in the data?


# | We'll be using a dataset from United States Department of Agriculture's PLANTS Database
# | (http://plants.usda.gov/adv_search.html).

# | Let's begin by checking the class of the plants variable with class(plants).
class(plants)
## [1] "data.frame"

# find how many rows and columns are in plants dataset
dim(plants)
## [1] 5166   10
# | The first number you see (5166) is the number of rows (observations) and the second number (10) is the number of
# | columns (variables).

# If you just want to see rows or just columns use nrow() and ncol()
nrow(plants)
## [1] 5166

ncol(plants)
## [1] 10

# | If you are curious as to how much space the dataset is occupying in memory, you can use object.size(plants).
object.size(plants)
## 644232 bytes

# find out whats inside the dataset
names(plants)
# [1] "Scientific_Name"      "Duration"             "Active_Growth_Period" "Foliage_Color"        "pH_Min"              
# [6] "pH_Max"               "Precip_Min"           "Precip_Max"           "Shade_Tolerance"      "Temp_Min_F"

# Show the preview of top of the dataset
head(plants)
# Scientific_Name          Duration Active_Growth_Period Foliage_Color pH_Min pH_Max Precip_Min
# 1                  Abelmoschus              <NA>                 <NA>          <NA>     NA     NA         NA
# 2       Abelmoschus esculentus Annual, Perennial                 <NA>          <NA>     NA     NA         NA
# 3                        Abies              <NA>                 <NA>          <NA>     NA     NA         NA
# 4               Abies balsamea         Perennial    Spring and Summer         Green      4      6         13
# 5 Abies balsamea var. balsamea         Perennial                 <NA>          <NA>     NA     NA         NA
# 6                     Abutilon              <NA>                 <NA>          <NA>     NA     NA         NA
# Precip_Max Shade_Tolerance Temp_Min_F
# 1         NA            <NA>         NA
# 2         NA            <NA>         NA
# 3         NA            <NA>         NA
# 4         60        Tolerant        -43
# 5         NA            <NA>         NA
# 6         NA            <NA>         NA

# | By default, head() shows you the first six rows of the data. You can alter this behavior by passing as a second
# | argument the number of rows you'd like to view. Use head() to preview the first 10 rows of plants.

# | The same applies for using tail() to preview the end of the dataset. Use tail() to view the last 15 rows.
tail(plants, n=15)
# Scientific_Name  Duration Active_Growth_Period Foliage_Color pH_Min pH_Max Precip_Min Precip_Max
# 5152                          Zizania      <NA>                 <NA>          <NA>     NA     NA         NA         NA
# 5153                 Zizania aquatica    Annual               Spring         Green    6.4    7.4         30         50
# 5154   Zizania aquatica var. aquatica    Annual                 <NA>          <NA>     NA     NA         NA         NA
# 5155                Zizania palustris    Annual                 <NA>          <NA>     NA     NA         NA         NA
# 5156 Zizania palustris var. palustris    Annual                 <NA>          <NA>     NA     NA         NA         NA
# 5157                      Zizaniopsis      <NA>                 <NA>          <NA>     NA     NA         NA         NA
# 5158             Zizaniopsis miliacea Perennial    Spring and Summer         Green    4.3    9.0         35         70
# 5159                            Zizia      <NA>                 <NA>          <NA>     NA     NA         NA         NA
# 5160                     Zizia aptera Perennial                 <NA>          <NA>     NA     NA         NA         NA
# 5161                      Zizia aurea Perennial                 <NA>          <NA>     NA     NA         NA         NA
# 5162                 Zizia trifoliata Perennial                 <NA>          <NA>     NA     NA         NA         NA
# 5163                          Zostera      <NA>                 <NA>          <NA>     NA     NA         NA         NA
# 5164                   Zostera marina Perennial                 <NA>          <NA>     NA     NA         NA         NA
# 5165                           Zoysia      <NA>                 <NA>          <NA>     NA     NA         NA         NA
# 5166                  Zoysia japonica Perennial                 <NA>          <NA>     NA     NA         NA         NA
# Shade_Tolerance Temp_Min_F
# 5152            <NA>         NA
# 5153      Intolerant         32
# 5154            <NA>         NA
# 5155            <NA>         NA
# 5156            <NA>         NA
# 5157            <NA>         NA
# 5158      Intolerant         12
# 5159            <NA>         NA
# 5160            <NA>         NA
# 5161            <NA>         NA
# 5162            <NA>         NA
# 5163            <NA>         NA
# 5164            <NA>         NA
# 5165            <NA>         NA
# 5166            <NA>         NA

# NAs in R are placeholders
# Use summary(plants) to get a better feel for how each variable is distributed and how much of the
# | dataset is missing.
summary(plants)
#                     Scientific_Name              Duration              Active_Growth_Period      Foliage_Color 
# Abelmoschus                 :   1   Perennial        :3031   Spring and Summer   : 447      Dark Green  :  82  
# Abelmoschus esculentus      :   1   Annual           : 682   Spring              : 144      Gray-Green  :  25  
# Abies                       :   1   Annual, Perennial: 179   Spring, Summer, Fall:  95      Green       : 692  
# Abies balsamea              :   1   Annual, Biennial :  95   Summer              :  92      Red         :   4  
# Abies balsamea var. balsamea:   1   Biennial         :  57   Summer and Fall     :  24      White-Gray  :   9  
# Abutilon                    :   1   (Other)          :  92   (Other)             :  30      Yellow-Green:  20  
# (Other)                     :5160   NA's             :1030   NA's                :4334      NA's        :4334  
#      pH_Min          pH_Max         Precip_Min      Precip_Max         Shade_Tolerance   Temp_Min_F    
# Min.   :3.000   Min.   : 5.100   Min.   : 4.00   Min.   : 16.00   Intermediate: 242   Min.   :-79.00  
# 1st Qu.:4.500   1st Qu.: 7.000   1st Qu.:16.75   1st Qu.: 55.00   Intolerant  : 349   1st Qu.:-38.00  
# Median :5.000   Median : 7.300   Median :28.00   Median : 60.00   Tolerant    : 246   Median :-33.00  
# Mean   :4.997   Mean   : 7.344   Mean   :25.57   Mean   : 58.73   NA's        :4329   Mean   :-22.53  
# 3rd Qu.:5.500   3rd Qu.: 7.800   3rd Qu.:32.00   3rd Qu.: 60.00                       3rd Qu.:-18.00  
# Max.   :7.000   Max.   :10.000   Max.   :60.00   Max.   :200.00                       Max.   : 52.00  
# NA's   :4327    NA's   :4327     NA's   :4338    NA's   :4338                         NA's   :4328    

#### NOte : summary()
# | summary() provides different output for each variable, depending on its class. For numeric data such as Precip_Min,
# | summary() displays the minimum, 1st quartile, median, mean, 3rd quartile, and maximum. These values help us
# | understand how the data are distributed.
#
# | For categorical variables (called 'factor' variables in R), summary() displays the number of times each value (or
# | 'level') occurs in the data. For example, each value of Scientific_Name only appears once, since it is unique to a
# | specific plant. In contrast, the summary for Duration (also a factor variable) tells us that our dataset contains
# | 3031 Perennial plants, 682 Annual plants, etc.

# | You can see that R truncated the summary for Active_Growth_Period by including a catch-all category called 'Other'.
# | Since it is a categorical/factor variable, we can see how many times each value actually occurs in the data with
# | table(plants$Active_Growth_Period).
table(plants$Active_Growth_Period)
## Fall, Winter and Spring                  Spring         Spring and Fall       Spring and Summer 
##                      15                     144                      10                     447 
##    Spring, Summer, Fall                  Summer         Summer and Fall              Year Round 
##                      95                      92                      24                       5 


# | Perhaps the most useful and concise function for understanding the *str*ucture of your data is str(). 
str(plants)
# 'data.frame':	5166 obs. of  10 variables:
# $ Scientific_Name     : Factor w/ 5166 levels "Abelmoschus",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Duration            : Factor w/ 8 levels "Annual","Annual, Biennial",..: NA 4 NA 7 7 NA 1 NA 7 7 ...
# $ Active_Growth_Period: Factor w/ 8 levels "Fall, Winter and Spring",..: NA NA NA 4 NA NA NA NA 4 NA ...
# $ Foliage_Color       : Factor w/ 6 levels "Dark Green","Gray-Green",..: NA NA NA 3 NA NA NA NA 3 NA ...
# $ pH_Min              : num  NA NA NA 4 NA NA NA NA 7 NA ...
# $ pH_Max              : num  NA NA NA 6 NA NA NA NA 8.5 NA ...
# $ Precip_Min          : int  NA NA NA 13 NA NA NA NA 4 NA ...
# $ Precip_Max          : int  NA NA NA 60 NA NA NA NA 20 NA ...
# $ Shade_Tolerance     : Factor w/ 3 levels "Intermediate",..: NA NA NA 3 NA NA NA NA 2 NA ...
# $ Temp_Min_F          : int  NA NA NA -43 NA NA NA NA -13 NA ...

# | The beauty of str() is that it combines many of the features of the other functions you've already seen, all in a
# | concise and readable format. At the very top, it tells us that the class of plants is 'data.frame' and that it has
# | 5166 observations and 10 variables. It then gives us the name and class of each variable, as well as a preview of
# | its contents.
#
# | str() is actually a very general function that you can use on most objects in R. Any time you want to understand the
# | structure of something (a dataset, function, etc.), str() is a good place to start.





























