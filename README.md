---
title: "README.Rmd"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE, 
                      eval = FALSE)
```
# README
This is a project that uses Human Activity Recognition Using Smartphones Data Set.
The original project is described (here)  [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#]


The project requires to write a script run_analysis.R that downloads the data files from the dataset, transforms the data into a single table with meaningful labels, extracts only mean and standard deviation measurements from the entire data and summarizes them into averages by subject and activity.

### Instructions
1. Download the data from the link 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

2. Unzip the file

3. Move the  run_analysis.R script into the "UCI HAR Dataset" directory.

4. In RStudio set the working directory to the same directory and run the script
```{r}
setwd("location of the dataset/UCI HAR Dataset")
source("run_analysis.R")
```
5. The script will load **dplyr** package and take a few seconds to run since the data is somewhat large. If there are any warnings, troubleshoot.

6. The script will create a new data file "tidymeans.csv". It can be read with any csv reading function

```{r}
means2 <- read.csv("tidymeans.csv", header=TRUE)
```

