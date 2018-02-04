##                            HAR Tidy Dataset ReadMe
==================================================================
Human Activity Recognition Using Smartphones Dataset - Tidy DataSet
Readme v1.0
==================================================================
Author: Trilochan Dave
Created as part of Tidy Data Set created as part of 'Getting and Cleaning Data' course from Coursera
This readme is based on original Readme file provided with raw dataset
==================================================================

## Overview
Human Activity Recognition data Using Smartphones Dataset is collected from the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The Tidy dataset submission includes the following files:
=========================================================
run_analysis.R : This file has R script to analyse raw and create Tidy Data
HAR Code book.md : This file has details for variables used in Tidy Data
Readme.md: This file provide details on what is included in the Tidy Data and how it was created
finaldata.txt: Final output of the Tidy data in text file format
finaldata.csv: Final output of the Tidy data in csv format
=========================================================

# Steps to create Tidy Data
* Step 1: Combine Test and Train datasets. Add Activity and Volunteer Columns to the combined dataset
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
* Step 3: Change numbers to descriptive activity names in Activities column
* Step 4: Give discriptive names to Acitivity and Volunteer Columns
* Step 5: Create final tidy data set with the average of each variable for each activity and each subject.Write output to a txt and csv file




