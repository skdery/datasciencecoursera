---
title: "Readme"
author: "S Dery"
date: "January 24, 2015"
output: html_document
---

This is a Coursera Getting and Cleaning Data class project. The project uses data from the "Human Activity Recognition Using Smartphones" to clean and tranform the data into a tidy data set for analysis. The main output of the project is a tidy data set of measures involving the mean and standard deviations.

### **Here are the steps that must be performed before running the R script:**

Download the zip file from the URL.
Unzip the file into a "UCI HAR Dataset" directory.
Load the following files to R:

* features.txt
* subject_train.txt
* subject_test.txt
* X_train.txt
* X_test.txt
* y_train.txt
* y_test.txt

Append (cbind) the features and the subject data to both the training and test data 
Merge the results of the training and test data.
Extract only the data with the measurement of mean and standard deviation for each measurement.
Appropraite descriptive activity names were used to name the activities in the data set. A second independent tidy data set with the average of each variable for each activity and each subject was created.

The final data set can be found in the tidyMeans.txt file, which can be read into R with read.table("tidyMeans.txt", header = TRUE). A detailed description of the variables can be found in CodeBook.md.