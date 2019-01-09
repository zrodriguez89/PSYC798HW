# 1. Run t-tests with the "iris" data set
#    - compare sepal width
#    - two different pairwise comparisons (i.e., between the three species)
#    HINT: use the t.test() function

#setosa 1-50, versicolor 51-100, virginica 101-150. Sepal.Width = Col 2

#copydata set
myiris <- iris


#create data sets for each species. useful later on.

setosas <- myiris[1:50,1:5]
versicolor <- myiris[51:100,1:5]
virginica <- myiris[101:150,1:5]

#copy just petal width data
setosaSepWidth <- myiris$Petal.Width[1:50]
versiSepWidth <- myiris$Petal.Width[51:100]
virginSepWidth <- myiris$Petal.Width[101:150]


t.test(setosaSepWidth, versiSepWidth)
t.test(setosaSepWidth, virignSepWidth)
t.test(versiSepWidth, virginSepWidth)



# 2. Find the overall correlation between Sepal.Length and Petal.Length
#    HINT: use the cor() function


# 3. Get the correlation between Sepal.Length and Petal.Length for each Species separately


# 4. Look at the built-in data set ToothGrowth. Use a t-test to compare tooth
#    lengths in the different supplement types.
#    HINT: first use head() and summary() to "peek" at the data


# 5. Re-run #4 t-test as a true "Student's" t-test, not a Welch's. 
#    Re-run it an additional time as a paired t-test.
#    HINT: read the help file carefully!


# 6. Run a Wilcoxon Signed Rank test for the same comparisons in #1
#    HINT: use help.search() or ?? to find a function to do this


# 7. Save all results (and only those results!) in an .RData object
#    - try to think of (at least) two ways to do this


# 8. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
#    HINT: start with the help for read.table()

