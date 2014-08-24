RCourse3Project
===============

### CoodBook.md

I provide in this repo a code book that describes the variables, the data, and any transformations I performed to clean up the data.

### run_analysis.R

This file explains how the scripts of this repo work.

The R script run_analysis.R reads downloaded data and process the required data. Then, it creates and saves the following dataset:

"TidyData.txt"

### R packages required

The R package reshape2 is required to run this script. You have to install it first and then call it... as follow:

install.package("reshape2")

and then call it as library("reshape2")

### GENERAL INFO

What I did and my code does is:

1- Read the unzip file provided and unzip it so it can be a normal folder. I do this manually not in R script (be aware of that). Then, place it in the working directory.

2- Load the files in R with different names ( I used read.table)

3- Row Bind all the *_test and *_train data into single datatable

4- Set textual columns heading

5- Create a smaller second dataset, containing only mean and std variables

6- Calculate the means of this secondary dataset. Group by Subject/Activity

7- Save this last dataset as "TidyData.txt"

