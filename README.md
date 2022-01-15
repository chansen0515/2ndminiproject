run_analysis.R

1st step - Download the dataset in the folder UCI HAR Dataset

2nd Step- Assigning variables

featureNames <- features.txt
activityLabels <- activity_labels.txt

subjectTrain <-train/subject_train.txt
activityTrain <-train/y_train.txt
featuresTrain <-train/x_train.txt

subjectTest <- test/subject_test.txt
activityTest <- y_test.txt
featuresTest <- x_test.txt

3rd Step - Merging...

subject was created using rbind() to merge subjectTrain and subjectTest
activty was created using rbind() to merge activtyTrain and activtyTest
features was created using rbind() to merge featuresTrain and featuersTest
completeData was created using cbind() to merge features, activty, and subject

4th Step - Extracting...

columnsWithMeanSTD was created by the grep() function
required columns was created by combining  columnsWithMeanSTD, 562,563, using c()

5th step - Naming activities...

extractedData was created using as.factor and as.character.

6th Step - Labeling appropriate names
Acc was changed into Accelerometer
Gyro was changed into Gyrscope
BodyBody was changed into Body
Mag was changed into Magnitute
F characters were changed into Frequency
T characters were changed into Time

Last Step - Create second Tidy Data set
tidyData was created by summarizing and ordering the extracted data
then it was transfered into Sorted_Data.txt






