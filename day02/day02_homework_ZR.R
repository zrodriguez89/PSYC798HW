# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

myIndiaSuicidesData0112 <- read.csv("Desktop/R/PSYC798W/Datasets/Suicides in India 2001-2012 Updated.csv")

# 2. Peek at the top few rows

myIndiaSuicidesData0112[1:3, 1:7]

# 3. Peek at the top few rows for only a few columns

myIndiaSuicidesData0112[1:6, 1:3]

# 4. How many rows does your data have?

nrow(myIndiaSuicidesData0112) #236583

# 5. Get a summary for every column

summary(myIndiaSuicidesData0112)

# 6. Get a summary for one column

summary(myIndiaSuicidesData0112$Age_group)

# 7. Are any of the columns giving you unexpected values?

#No. 

# 8. Select a few key columns, make a vector of the column names
#for # column and row for vector use NCOL/NROW (case sensitive specific)

columnIndiaNames <- c("Type","Gender","Total")

# 9. Create a new data.frame with just that subset of columns


#NOTE FUNCTION MAKES THE HEADERS THE FULL INPUT NAME.
indiaSuicideSubset <- data.frame(myIndiaSuicidesData0112[1:236583, "Type"],  myIndiaSuicidesData0112[1:236583, "Gender"], myIndiaSuicidesData0112[1:236583, "Total"])
#rename columns
names(indiaSuicideSubset) <- columnIndiaNames

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

#rbind does it vertically. Merge is for different context.
tenRowIndiaSubset <- rbind(head(indiaSuicideSubset, 10), tail(indiaSuicideSubset, 10))

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

randomRowIndiaSubset <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test() (or cor.test()) for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

#store numerical columnns of suicide totals

#sets 1 and 2



randomRowIndiaSubset <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubset2 <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubsetTotals <- randomRowIndiaSubset$Total
randomRowIndiaSubset2Totals <- randomRowIndiaSubset2$Total

t.test(randomRowIndiaSubsetTotals, randomRowIndiaSubset2Totals)



# 13. Repeat #12 for TWO more comparisons
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

#more random samples 

#sets 3 and 4
randomRowIndiaSubset3 <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubset4 <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubset3Totals <- randomRowIndiaSubset3$Total
randomRowIndiaSubset4Totals <- randomRowIndiaSubset4$Total

t.test(randomRowIndiaSubset3Totals, randomRowIndiaSubset4Totals)


# sets 5 and 6
randomRowIndiaSubset5 <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubset6 <- indiaSuicideSubset[sample(nrow(indiaSuicideSubset), size = (236583/2)), ]
randomRowIndiaSubset5Totals <- randomRowIndiaSubset5$Total
randomRowIndiaSubset6Totals <- randomRowIndiaSubset6$Total

t.test(randomRowIndiaSubset5Totals, randomRowIndiaSubset6Totals)

# 14. Save all results from #12 and #13 in an .RData file

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


