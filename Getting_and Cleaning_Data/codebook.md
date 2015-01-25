---
title: "Codebook"
author: "S Dery"
date: "January 24, 2015"
output: html_document
---

###Explanation of each file

* features.txt: Names of the 561 features.
* activity_labels.txt: Names and IDs for each of the 6 activities.

* X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

* subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

* y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

* X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

* subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

* y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

<br>

#### These variables identify the unique subject/activity pair the variables relate to:

Subject: the integer subject ID.
Activity: the string activity name:
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
*Laying

All variables are the mean of a measurement for each subject and activity. All values are floating point numbers.


* TimeBodyAccMeanX
* TimeBodyAccMeanY
* TimeBodyAccMeanZ

* TimeBodyAccStdDevX
* TimeBodyAccStdDevY
* TimeBodyAccStdDevZ

* TimeGravityAccMeanX
* TimeGravityAccMeanY
* TimeGravityAccMeanZ

* TimeGravityAccStdDevX
* TimeGravityAccStdDevY
* TimeGravityAccStdDevZ

* TimeBodyAccJerkMeanX
* TimeBodyAccJerkMeanY
* TimeBodyAccJerkMeanZ

* TimeBodyAccJerkStdDevX
* TimeBodyAccJerkStdDevY
* TimeBodyAccJerkStdDevZ

* TimeBodyGyroMeanX
* TimeBodyGyroMeanY
* TimeBodyGyroMeanZ

* TimeBodyGyroStdDevX
* TimeBodyGyroStdDevY
* TimeBodyGyroStdDevZ

* TimeBodyGyroJerkMeanX
* TimeBodyGyroJerkMeanY
* TimeBodyGyroJerkMeanZ

* MeanTimeBodyGyroJerkStdDevX
* MeanTimeBodyGyroJerkStdDevY
* MeanTimeBodyGyroJerkStdDevZ

* TimeBodyAccMagMean

* TimeBodyAccMagStdDev

* TimeGravityAccMagMean

* TimeGravityAccMagStdDev

* TimeBodyAccJerkMagMean

* TimeBodyAccJerkMagStdDev

* TimeBodyGyroMagMean

* TimeBodyGyroMagStdDev

* TimeBodyGyroJerkMagMean

* MeanTimeBodyGyroJerkMagStdDev

* FrequencyBodyAccMeanX
* FrequencyBodyAccMeanY
* FrequencyBodyAccMeanZ

* FrequencyBodyAccStdDevX
* FrequencyBodyAccStdDevY
* FrequencyBodyAccStdDevZ

* FrequencyBodyAccJerkMeanX
* FrequencyBodyAccJerkMeanY
* FrequencyBodyAccJerkMeanZ

* FrequencyBodyAccJerkStdDevX
* FrequencyBodyAccJerkStdDevY
* FrequencyBodyAccJerkStdDevZ

* FrequencyBodyGyroMeanX
* FrequencyBodyGyroMeanY
* FrequencyBodyGyroMeanZ

* FrequencyBodyGyroStdDevX
* FrequencyBodyGyroStdDevY
* FrequencyBodyGyroStdDevZ

* FrequencyBodyAccMagMean

* FrequencyBodyAccMagStdDev

* FrequencyBodyAccJerkMagMean

* FrequencyBodyAccJerkMagStdDev

* FrequencyBodyGyroMagMean

* FrequencyBodyGyroMagStdDev

* FrequencyBodyGyroJerkMagMean

* FrequencyBodyGyroJerkMagStdDev
