---
title: "codebook.Rmd"
author: ktarkhan
date: 2020.10.12

output: html_document
---

## Project 
The goal of this project is to prepare raw data collected from an experiment for analysis.

### Original experiment

The experiment is described in (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#]

In the experiment 30  volunteers age 19-48 performed 6 different simple activities while wearing a smartphone. The smartphone captured various data about their movements. 
The obtained data was randomly assigned to two datasets: 70% of the subjects were used as the training dataset and the rest became the test dataset. 

### Processing of the original data
Here we need to 

* load the raw data from both training and test datasets and merge them into a single dataset. (there 10299 observations in total between the two sets)  
* Assign  meaningful names to the variables from the features list (there are 561 variables).   
* Rename the activities from numerical codes to the actual activities names.  

* Select only mean and standard deviation variables from the entire list (there are 86 of those)  
* calculate means of those measurements by subject, by activity type.  30 subjects times 6 activities yield a table of 180 means for each off the 86 measurements.  
* save the new tidy data set into a file.  
