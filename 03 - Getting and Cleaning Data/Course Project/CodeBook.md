## Getting and Cleaning Data Project

Author: Stephen Blatti

### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.
A full description is available at:
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Source Data
The source data is available at:
[Sourse data for project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### 1. Merge the training and the test sets to create one data set.
a) Load into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

b) Assign column names and merge to create one data set.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
a. Make a logical vector from the combinedData data set to use for the desired extraction
b. Extract mean and sd using this logical vector

#### 3. Uses descriptive activity names to name the activities in the data set.
Merge data set with the activityLabels table to include the descriptive activity names

#### 4. Appropriately labels the data set with descriptive variable names. 
a. Use the gsub function clean up the data labels 
b. relabel the data set with the new descriptive variable names 

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use write.table() function with row.name=FALSE (as per assignment instructions) to create the tidy data set








