#  You should create one R script called run_analysis.R that does the following. 
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library (dplyr)
library (plyr)
library(reshape2)

# STEP 1-4 Import data, do the labeling and merge training and test data 
    
#import general files  
features <-read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#import train files
training_set <- read.table("UCI HAR Dataset/train/X_train.txt")  
training_labels <- read.table("UCI HAR Dataset/train/Y_train.txt")  
training_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")  

#import test files
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")  
test_labels <- read.table("UCI HAR Dataset/test/Y_test.txt")  
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")  

#set the column names for import and test
names(training_set) <- features[,2]
names(test_set) <- features[,2]

#add the feature name to the labels datasets. 
#i used join because merge changes the row order
training_labels <- join(training_labels, activity_labels)
test_labels <- join(test_labels, activity_labels)

names(training_labels) = c("Activity_code", "Activity_name")
names(test_labels) = c("Activity_code", "Activity_name")

#add the subjects to the dataset
names(training_subject) <- "Subject"
names(test_subject) <- "Subject"

training_set <- cbind(training_subject, training_labels, training_set)
test_set <- cbind(test_subject, test_labels, test_set)

# merge test and training sets
merged_set <- rbind(training_set, test_set)

# keep only the mean and standard deviation variables
# i used grep (regular expressions):
#       - The mean variables contain "mean". 
#       - The standard deviation variables contain "std". 
#       - We want to keep the first 3 columns with the subject and activity data. 

# This is the finished product for the first 4 steps
tidy_set <- merged_set[,grep("mean|std|Subject|Activity", names(merged_set), value=TRUE, invert=FALSE)] 
 
# Make the averages
melted <- melt(tidy_set, id=c("Subject", "Activity_name"))
tidy_data_means <- dcast(melted, Subject + Activity_name ~ variable, mean)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Write data set to file 
write.table(tidy_data_means, "tidy_data_means.csv", row.name = FALSE)
