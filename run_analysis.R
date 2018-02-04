#set working directory
setwd("~/Documents/DSS/Course 3 -Data Cleaning /WorkingDirCourse3Proj")

#Load Data training data, features and activity lables
features <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/features.txt",header = TRUE)
activitylabels <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/activity_labels.txt")
xtrain <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/train/X_train.txt",header = TRUE)
ytrain <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/train/y_train.txt",header = TRUE)
subjecttrain <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/train/subject_train.txt",header = TRUE)

#Load Test data
xtest <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/test/X_test.txt",header = TRUE)
ytest <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/test/y_test.txt",header = TRUE)
subjecttest <- read.table("~/Documents/DSS/Course 3 -Data Cleaning /Course3Proj/UCI HAR Dataset/test/subject_test.txt",header=TRUE)

## Step 1: Combine Test and Train datasets

## Align column names from features to xtrain data
colnames(xtrain) <- features[ ,2] # train data
colnames(xtest) <- features[,2] # test data

## rename Activity and Volunteer subject Columns
colnames(subjecttrain)[colnames(subjecttrain)=="X1"] <- "Volunteer_Subject"
colnames(subjecttest)[colnames(subjecttest)=="X2"] <- "Volunteer_Subject"
colnames(ytrain)[colnames(ytrain)=="X5"] <- "Activity"
colnames(ytest)[colnames(ytest)=="X5"] <- "Activity"

## Add Activity Labels and Volunteer subject columns to dataset - train and test
trainCombine <- cbind(ytrain,subjecttrain,xtrain)
testCombine <- cbind(ytest,subjecttest,xtest)

## Combine Train and Test datasets
TidyDataSet <- rbind(trainCombine,testCombine)

## Step 2:Extracts only the measurements on the mean and standard deviation for each measurement
## select column names with mean and standard deviation(std) irrespective of upper or lower case
measurement <- TidyDataSet[grep("mean()|std()|Activity|Volunteer_Subject",colnames(TidyDataSet),ignore.case = TRUE)]

## Step 3:Uses descriptive activity names to name the activities in the data set 
measurement$Activity <- gsub("1","WALKING",measurement$Activity)
measurement$Activity <- gsub("2","WALKING_UPSTAIRS",measurement$Activity)
measurement$Activity <- gsub("3","WALKING_DOWNSTAIRS",measurement$Activity)
measurement$Activity <- gsub("4","SITTING",measurement$Activity)
measurement$Activity <- gsub("5","STANDING",measurement$Activity)
measurement$Activity <- gsub("6","LAYING",measurement$Activity)

## Step 4: Appropriately labels the data set with descriptive variable names
## Varibles / column headings for Sujects and Activities renamed as part of setp 1
## All other variables have discriptive names to represent signals and measrurements

## Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
groupdata <- group_by(measurement,Activity,Volunteer_Subject)
finaldata <- summarise_all(groupdata,mean)
## Create final txt file
write.table(finaldata,"~/Documents/DSS/Course 3 -Data Cleaning /WorkingDirCourse3Proj/finaldata.txt",row.names = FALSE)
write.csv(finaldata,"~/Documents/DSS/Course 3 -Data Cleaning /WorkingDirCourse3Proj/finaldata.csv",row.names = FALSE)
