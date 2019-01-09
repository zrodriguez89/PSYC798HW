# Day 2 lecture

##############################
# Review
# - cloning a repo from GitHub
# - pulling changes from that repo

# - setting up your own repo (locally)
# - setting up a repo on GitHub
# - pushing changes to GitHub

# - last resort for today: zip-file download from GitHub

# - workflow recommendations
# 
#   Option 1: add to Scott's repo
#   - pull changes from r_programming_bsos_winter2019
#   - DON'T modify any of Scott's files
#   - DO make new copies of files to make notes in (e.g., "day02_lecture_notes.R")
#   - DO commit your own changes (additions) before pulling new changes from GitHub
#   - NOTE: you'll need to set up a different remote to push to if you want your
#     "fork" to also live on GitHub
# 
#   Option 2: merge with Scott's repo
#   - pull changes from Scott
#   - make your own notes in the files
#   - DO commit your changes before pulling new changes from Scott
#   - MERGING: you will need to merge changes "manually" when we edit the same file

# - other workflow tips for class
#   - if you get muddled/confused, you can always clone Scott's repo in a fresh start
#   - COMMIT, COMMIT, COMMIT

# - (Drop)Box tip: a "bare" repo can serve as a kind of "just for sharing" master repo
#   1. make a repo (normal ways), make first commit, etc.
#   2. make a copy onto a "synced" folder
#   3. open a shell (Git Bash, Terminal, etc.)
#   4. use "cd" command to navigate to the repo in the synced folder
#   5. make the synced folder "bare" with:
#      git config --bool core.bare true
#   6. go back in your original repo in your normal folder
#   7. set the "origin" remote to the location of the synced repo
#      git remote add origin [PATH TO REPO IN SYNCED FOLDER]
#   8. do NOT work directly on the synced folder repo
#   9. work on your local (not synced) repo, push/pull to/from synced (bare) repo

# - other questions?

#############################
# Topics:
# - console interface
# - calculator and simple interactive use in the console
# - syntax/formatting basics
# - interface: scripts
# - workbench analogy
# - object basics: creating/assigning, naming
# - simple object structure: 1- and 2-dimensional structures
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - reading data from files

####################################################################

# Console
# - most "bare bones" interface with R
# - type commands at the command line, hit Enter after each command
# - code run and evaluated every time you hit Enter
# - can (usually) use up/down arrows to scroll through previous commands

# Basic calculator examples (type along!)


# Some syntax basics
# - whitespace (mostly) doesn't matter
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out


#########
# Scripts
# - End with .R
# - written *entirely* in R
# - this document is a script!
# - the "comment" symbol is #
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)
# - you can run entire scripts using `source()` function

2 + 2 # this is trivial math

# RStudio note: switching back and forth between script & console

#############################
# Workbench analogy for R use
# - R has a "workspace"
# - you add/remove/manipulate things in this workspace

##############################
# Objects: creating and naming

# assignment: creating something in your workspace


# checking the workspace contents


# removing things from the workspace
rm("x")
objects()
x <- 10
y <- 20
mean(c(x, y))h

#^^^^ Need to be mean(c(x,y)). Need to treat it as a vector. 
# Command enter for mac. It will run line that is on for script in console. 
# Also can highlight sections. Can also use = sign. Or flip arrow 5 -> x

# rm(list = objects()) # remove everything from the workspace

#to list objects. objects() or ls()


# object naming conventions
# cannot start with a number
b1 <- 10
# 1b <- 10 

# b1*w <- 10 # no "meaningful" symbols in object names

# some principles
# 1. make them meaningful
# 2. make them easy to type

big_long_name_that_describes_things_in_detail <- 10 # not a great name

# RStudio helps with #2
# tab-completion


# some different "style" options
camelCase <- 10
thisIsaVariableInCamelCase <- 11
thisisavariablenotincamelcase <- 12 # harder to read
dot.delimited <- 13
underscore_delimited <- 14

#some people hate . because means something python.
#R is case sensitive. Avoid similiar letters. Typically avoid uppercase. poc
# other style examples:
# https://google.github.io/styleguide/Rguide.xml
# http://adv-r.had.co.nz/Style.html


# case matters


# upshot: avoid upper-case or "ambiguous" characters to help avoid confusion


######################
# Structure of objects

# simple structure: vectors
# c()
# seq() for sequences
# x:y as a shortcut for seq(from = x, to = y, by = 1)
# [] for subsetting

#x[] will pull number element from vector. First element = 1. seq(from, to, by) FTB. Can just input number
#x[3] or do parts of vector x[3:10]. In r can also run highlighted chunk of line.

y <- seq(7, 11, 1)
y <- 7:11
y[c(1,2,3)]

# syntax note: [square brackets] are used ONLY for "extraction"/subsetting
#              (parentheses) are used in math, and in functions (more below)

##########
# Vectors:
# - all a single data type
# - always one-dimensional
# - multi-dimensional things are other types of objects
#   - data frames (different data types each column. Column vector same data type)
#   - lists
#   - matrices (everything has to be same data type)
#   - arrays

#############
# Data frames
# - two dimensional
# - columns act as vectors (all same data type)
# - ideal standard format for (most) data
# - columns = variables, rows = cases
?sleep

# [rows, columns]  
# names
# $



# Some handy functions for inspecting data frames
# head(), tail() default look at top/last rows. Can put argument for amount.

head(letters, 6)
tails(letters, 3)


# nrow(), ncol()
# summary()
# colnames() (e.g. colnames(sleep))
# View()

#can refer to columns by "name". Names >>> numbers usually. Don't use row names.

sleep[2,"extra"]
#print vector of columns. 
sleep[1:5, c("ID", "extra")] 

#1:5 looks at left first

#sleep extra column extra 1-5 rows. 
sleep$extra[1:5] 

#1:5 looks at left first

#multiplies number in that row, column by 4. $
(sleep$extra * 4)[1:5]

#can also store dataset to another place.

mysleep <- sleep

#can also store columns you want into different data frame. 

###########
# Functions
# - everything in R is an object!
# - some objects function as "tools" -- they *do* stuff
# - these are "functions"
# - functions are still objects, too!

# syntax: FUNCTIONNAME(arg1, arg2, arg3...)

# functions return a single value, but may have other "side effects" (plotting is a side effect)
#plotting is in addition to the value being returned.
# the returned value may be complex, but it is still a single *object*

# examples: rnorm(), t.test()
# with made-up vectors

#10 numbers from random normal distribution 
rnorm(10) 

#setting seed for pseudorandom number generator. Seems to only work once before. 
set.seed(40) 

#.Random.seed saves the seed set for the uniform random-number generator, at least for the system generators. 
#It does not necessarily save the state of other generators
#If you want to reproduce work later, call set.seed 
#(preferably with explicit values for kind and normal.kind) rather than set .Random.seed.
#set.seed will produce code for function

set.seed


################
# Quick practice

# using [ ] and <-, pull out some numbers from the sleep data, and compare with t.test



###################
# More on arguments
# - names
# - order
# - optional vs. required

# getting help()

example(rnorm) #will give you example code from section

#value of help section describes what function returns


?rnorm
help(rnorm)

#rnorm(n, mean = 0, sd = 1). n = # of observations

rnorm(n = 10, mean = 0, sd = 10)
rnorm(10, 5, 10)

#You mix order of arguments as long as you use name

rnorm(sd = 10, mean = 4)

#USE TAB COMPLETION R. HELPFUL FUNCTIONS/VARIABLES. 


# finding help
#R can complete arguments if mean. me = 10, it will figure it out. Best not to leave out. 
# Google
# "fuzzy matching" with ?? to find help function

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names

# return to t-test (options)

t-test 
#rnorm(n, mean = 0, sd = 1). n = # of observations

x <- rnorm(20, 2, 1)
y <- rnorm(20, 4, 1)
t.test(x,y)

ttest.result <- t.test(x,y)
print(ttest.result)

#practice two vectors from sleep. Compare with ttest.
#t.test(x, y = NULL,alternative = c("two.sided", "less", "greater"),mu = 0, paired = FALSE, var.equal = FALSE, conf.level = 0.95, ...)


sleepPart1 <- sleep$extra[1:5]
sleepPart2 <- sleep$extra[6:10]
t.test(sleepPart1, sleepPart2)

#could also do sleep[1:10, 1] row column. Arguably bad since numbers confusing and meangingless. Large data sets.

x <- sleep[1:10, "extra"] #better way naming columns


########################################
# PRACTICE TIME!
# Complete items 1-3 in day02_practice.R
########################################
?iris
my.iris <- iris
head(my.iris)
View(my.iris)

#make copy incase mess something up

##########
# Packages- set of r code or data that is in easy to use format

library(MASS) 
install.packages("dplyr") #what you use to install on system.
library(dplyr)
install.packages(c("ggplot2", "tidyr"))
library(ggplot2)
install.packages("tidyverse") # https://www.tidyverse.org/

#usually put library statements at top of script so that you don't have to open up "file drawer" every time

#library() accepts either character or name and makes it possible for you to write the name of the package without quotes.
#After this, you no longer need the package::function() notation
#And you can access directly its functionalities as any other R base functions or data.

# update.packages() get latest version of a package. No arguments means update all of them. 

##############
# Environments

# workspaces

# naming conflicts

# MASS::select(x)  # 
# select(x) # this will run the dplyr version of select()

# saving workspaces & objects
# save(), load()
# .RData


########################################
# PRACTICE TIME!
# Complete items 4-7 in day02_practice.R
########################################


#########################
# Reading data from files

# read.table() family
?read.table

#read.csv(file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "", ...)
#header	= a logical value indicating whether the file contains the names of the variables as its first line.
#sep = the field separator character. Default is whitespace
#quote the set of quoting characters.
#These functions can use a surprising amount of memory when reading large files. 
#There is extensive discussion in the ‘R Data Import/Export’ manual, supplementing the notes here.


# for SPSS
# old package: `foreign`
# new package: `haven`

# for Excel: `readxl`
# install.packages("readxl")
# library(readxl)

# Others?

####################################
# PRACTICE: Try to read in your data
####################################
