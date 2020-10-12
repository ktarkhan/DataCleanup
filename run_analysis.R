# Coursera Specialization "Data Science: Foundations using R" 
# Course 3 Getting and Cleaning data
# UCI HAR Dataset

# set directory load libraries
setwd("/Users/ktarkhan/RStat/CourseraR/DataCleanup/Dataset")
library(dplyr)

# load files and prepare the data 
# the names of the features measured
features <-
  read.table("./features.txt", col.names=c("col_num", "feature"), 
             colClasses=c("integer", "character"))
feature_names <- gsub("[-(),]+",'_', features$feature)

#the types of activities performed
activities <- 
  read.table("./activity_labels.txt", col.names=c("code", "activity"), 
             colClasses=c("integer", "character"))
code_activity <- activities$activity
names(code_activity) <- activities$code

#test data
x_test <- read.table("./test/X_test.txt", colClasses = "numeric")  
act_test <- read.table("./test/y_test.txt", colClasses = "factor")
subj_test <- read.table("./test/subject_test.txt",  colClasses="numeric")

#train data
x_train <- read.table("./train/X_train.txt", colClasses = "numeric")  
act_train <- read.table("./train/y_train.txt", colClasses = "factor")
subj_train <- read.table("./train/subject_train.txt",  colClasses="numeric")

# 1. Merge the training and the test sets to create one data set.
x_data <- rbind(x_test, x_train)
act_data <- rbind(act_test, act_train)
subj_data <- rbind(subj_test, subj_train)

# 2. Appropriately label the data set with descriptive variable names.
colnames(x_data) <- feature_names
colnames(act_data) <- c("activity")
colnames(subj_data) <- c("subject_id")

# 3. Use descriptive activity names to name the activities in the data set
act_data$activity <- plyr::revalue(act_data$activity, code_activity)

# 4. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_cols <- grep('mean|std', feature_names, ignore.case=TRUE)

#reduce the x data frame to contain only mean and std columns
mean_std_data <- x_data[,mean_std_cols]

# Construct a single dataset from all the parts
all_data <- cbind(subj_data, act_data, mean_std_data)

# 5. Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

means <- all_data %>%
  group_by(subject_id, activity) %>%
  summarise_all(mean)

means <- means[order(means$subject_id),]

write.table(means, file="./tidymeans.csv", sep=",", row.names=FALSE)

