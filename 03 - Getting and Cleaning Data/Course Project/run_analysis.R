# Getting and Cleaning Data Course Project
# Stephen Blatti
# 09/10/2017

# Create one R script called run_analysis.R that does the following:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

# 1. Merge the training and the test sets to create one data set.

# Load activity labels and features

# fetures.txt - List of all features.
features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE); 
# activity_labels.txt - Links the class labels with their activity name.
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE); 

# Load train data sets

# subject_train.txt - Each row identifies the subject who performed the activity for each window sample. 
subjectTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE); 
xTrain <- read.table('./UCI HAR Dataset/train/x_train.txt',header=FALSE); # Training set
yTrain <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE); # Training labels

# Assign column names to these train data
colnames(activityLabels) <- c('activityId','activityName');
colnames(subjectTrain) <- "subjectId";
colnames(xTrain) <- features[,2]; 
colnames(yTrain) <- "activityId";

# Merge subjectTrain, yTrain, and xTrain into one data set
trainData <- cbind(subjectTrain,yTrain,xTrain);

# Load test data sets - descriptions are equivalent with train data sets.
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt',header=FALSE); 
xTest <- read.table('./UCI HAR Dataset/test/x_test.txt',header=FALSE); 

yTest <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE);

# Assign column names to these test data
colnames(subjectTest) <- "subjectId";
colnames(xTest) <- features[,2]; 
colnames(yTest) <- "activityId";

# Merge subjectTest, yTest and xTest into one data set
testData = cbind(subjectTest,yTest,xTest);


# Merge training and test data sets into one data set
combinedData = rbind(trainData,testData);


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Make a logical vector from the combinedData data set to use for the desired extraction
colNames <- colnames(combinedData);
cd_logicalVector <- (grepl("subject..",colNames) | grepl("activity..",colNames) | 
  grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | 
  grepl("-std..",colNames) & !grepl("-std()..-",colNames));

# Extract mean and sd from combinedData using cd_logicalVector 
combinedData <- combinedData[cd_logicalVector==TRUE];

# 3. Uses descriptive activity names to name the activities in the data set.

combinedData <- merge(combinedData,activityLabels,by='activityId',all.x=TRUE);

# 4. Appropriately labels the data set with descriptive variable names.
colNames <- colnames(combinedData); 
# Clean up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] <- gsub("^(t)","time",colNames[i])
  colNames[i] <- gsub("^(f)","freq",colNames[i])
  colNames[i] <- gsub("(BodyBody)","Body",colNames[i])
  colNames[i] <- gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] <- gsub("(Bodyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] <- gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] <- gsub("GyroMag","GyroMagnitude",colNames[i])
  colNames[i] <- gsub("\\()","",colNames[i])
  colNames[i] <- gsub("-mean","_Mean",colNames[i])
  colNames[i] <- gsub("-std","_StdDev",colNames[i])
};


# Label the data set with the new descriptive vriable names 
colnames(combinedData) <- colNames;

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

tidyData <- aggregate(combinedData[,names(combinedData) != c('activityId','subjectId','activityName')],
                      by=list(activityId=combinedData$activityId,subjectId = combinedData$subjectId,
                              activityName=combinedData$activityName),mean);
# Write the tidyData set to a file
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t');











