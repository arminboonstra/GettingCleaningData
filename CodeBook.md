##This file describes the steps taken to create the data set for the project.

## About the data:
The raw data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
There are 30 volunteers who perform 6 different activities.

The raw data is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

About the files:
- activity_labels.txt    : the names of the 6 different activities
- features.txt           : the feature names
- features_info.txt      : information about the output variables
- README.txt             : general information 

- subject_test.txt       : the subject ID's for the data
- X_test.txt             : the raw data for the volunteers in the test group
- y_test.txt             : the activity ID's for the data

- subject_train.txt       : the subject ID's for the data
- X_train.txt             : the raw data for the volunteers in the train group
- y_train.txt             : the activity ID's for the data

The inertial Signals files were not used.

## Steps to achieve output:

1. downloaded the data from the above site and unzip it into the R working directory
2. run the program "run_analysis.R"  

The program itself gives a good description of the steps taken in more detail. In general the following is done:

- Activity and variable names are added to the raw data
- The training and test sets are merged
- The averages of the variables are calculated for each subject and each activity. There are 30 subjects and 6 activities so 180 rows.
- The data is saved to a file

(I first completed this assignment in s)eptember. I'm retaking this course as part of the complete Data Science specialisation.)
