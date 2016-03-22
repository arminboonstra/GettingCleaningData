## About
The purpose of this repository is to fulfil the Course Project for the Coursera Course "Getting and Cleaning Data".

This repository contains 4 files:
- this readme file
- a codebook, containing an explanation of the work
- an R file with the script to make the required output csv file
- the output: tidy_data_means.csv

## About the experiments:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## About the original data:
The raw data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
The raw data is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

About these files:
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

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Steps to achieve output:

1. Downloaded the data from the above site and unzip it into the R working directory
2. Run the program "run_analysis.R"  

The program itself gives a good description of the steps taken in more detail. In general the following is done:

- Activity and variable names are added to the raw data
- The training and test sets are merged
- The averages of the variables are calculated for each subject and each activity. There are 30 subjects and 6 activities so 180 rows.
- The data is saved to a file

