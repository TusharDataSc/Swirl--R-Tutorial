# | Determine which directory your R session is using as its current working directory using getwd().
getwd()
## [1] "C:/Users/himymgot88/Documents/Swirl--R-Tutorial"


# | List all the objects in your local workspace using ls().
ls()
## [1] "my_div"  "my_sqrt" "x"       "y"       "z"  

# | Assign 9 to x using x <- 9.
x <- 9

# | Now take a look at objects that are in your workspace using ls().
ls()
## [1] "my_div"  "my_sqrt" "x"       "y"       "z"

# | List all the files in your working directory using list.files() or dir().
list.files()
## [1] "basicbuildingblocks.R"   "README.md"               "Swirl--R-Tutorial.Rproj"

# you should be examining the help page for each new function. Check out the help page for
# | list.files with the command ?list.files.
?list.files

# | Using the args() function on a function name is also a handy way to see what arguments a function can take.
args(list.files)
## function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, 
## recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, 
## no.. = FALSE) 
## NULL

# | Assign the value of the current working directory to a variable called "old.dir".
old.dir <- getwd()

# | Use dir.create() to create a directory in the current working directory called "testdir".
dir.create("testdir")

# | Set your working directory to "testdir" with the setwd() command.
setwd("testdir")

# | Create a file in your working directory called "mytest.R" using the file.create() function.
file.create("mytest.R")
## [1] TRUE

# | Use list.files() shows that the directory only contains mytest.R.
list.files()
## [1] "mytest.R"

# | Check to see if "mytest.R" exists in the working directory using the file.exists() function.
file.exists("mytest.R")
## [1] TRUE

# | Access information about the file "mytest.R" by using file.info().
file.info("mytest.R")
##          size  isdir  mode                mtime                ctime                atime  exe
## mytest.R    0  FALSE   666  2018-01-06 15:48:04  2018-01-06 15:45:26  2018-01-06 15:45:26   no

# NOTE : 
# You can use the $ operator --- e.g., file.info("mytest.R")$mode --- to grab specific items.

# | Change the name of the file "mytest.R" to "mytest2.R" by using file.rename().
file.rename("mytest.R", "mytest2.R")
## [1] TRUE

# | Make a copy of "mytest2.R" called "mytest3.R" using file.copy().
file.copy("mytest2.R","mytest3.R")
## [1] TRUE

# | Provide the relative path to the file "mytest3.R" by using file.path().
file.path("mytest3.R")
## [1] "mytest3.R"

# | You can use file.path to construct file and directory paths that are independent of the operating system your R code is running
# | on. Pass 'folder1' and 'folder2' as arguments to file.path to make a platform-independent pathname.
file.path('folder1', 'folder2')
## [1] "folder1/folder2"

# | Take a look at the documentation for dir.create by entering ?dir.create . Notice the 'recursive' argument. In order to create
# | nested directories, 'recursive' must be set to TRUE.
?dir.create

# | Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3", all in one
# | command by using dir.create() and file.path().
dir.create(file.path("testdir2", "testdir3"), recursive = TRUE)

# | Go back to your original working directory using setwd(). (Recall that we created the variable old.dir with the full path for
# | the orginal working directory at the start of these questions.)
setwd(old.dir)


