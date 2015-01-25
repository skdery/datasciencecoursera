## This R script gets and performs some cleaning on human activity data, built from 
## recordings of subjects performing daily activities while carrying smartphone. 
## The full description of the data set is available at:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Goals
## 1. each variable should be in one column
## 2. each observation of that variable should be in a diferent row

## load appropraite libraries

library(plyr)
library(reshape2)


## Set the working directory to the directory where the data has been downloaded

setwd("~/Documents/Courses/Coursera/Getting and Cleaning Data/Data/UCI HAR Dataset")

root.dir <- "~/Documents/Courses/Coursera/Getting and Cleaning Data/Data/UCI HAR Dataset"

data <- list()

## load the features data and name the columns as id and name

message("loading features.txt data")
data$features <- read.table(paste(root.dir, "features.txt", sep="/"), col.names=c('id', 'name'), stringsAsFactors=FALSE)

## load the factivity data and name the columns as id and activity

message("loading activity_features.txt")
data$activity_labels <- read.table(paste(root.dir, "activity_labels.txt", sep="/"), col.names=c('id', 'Activity'))

## load and combine the test set data

message("loading test set, please wait")
data$test <- cbind(subject=read.table(paste(root.dir, "test", "subject_test.txt", sep="/"), col.names="Subject"),
                       y=read.table(paste(root.dir, "test", "y_test.txt", sep="/"), col.names="Activity.ID"),
                       x=read.table(paste(root.dir, "test", "x_test.txt", sep="/")))

## load and combine the training data

message("loading train set, please wait")
data$train <- cbind(subject=read.table(paste(root.dir, "train", "subject_train.txt", sep="/"), col.names="Subject"),
                        y=read.table(paste(root.dir, "train", "y_train.txt", sep="/"), col.names="Activity.ID"),
                        x=read.table(paste(root.dir, "train", "X_train.txt", sep="/")))


# Read features and appropriately label the data set with descriptive feature names better suited for R.
# Change t to Time, f to Frequency, mean() to Mean and std() to StdDev
# Remove extra dashes and BodyBody naming error from original feature names

rename.features <- function(col) {
  col <- gsub("tBody", "TimeBody", col)
  col <- gsub("tGravity", "TimeGravity", col)
  
  col <- gsub("fBody", "FrequencyBody", col)
  col <- gsub("fGravity", "FrequencyGravity", col)
  
  col <- gsub("\\-mean\\(\\)\\-", "Mean", col)
  col <- gsub("\\-std\\(\\)\\-", "Std", col)
  
  col <- gsub("\\-mean\\(\\)", "Mean", col)
  col <- gsub("\\-std\\(\\)", "Std", col)
  
  return(col)
}

## Extracts only the measurements for the mean and standard deviation for each measurement.

tidy <- rbind(data$test, data$train)[,c(1, 2, grep("mean\\(|std\\(", data$features$name) + 2)]

## Uses descriptive activity names to name the activities in the data set

names(tidy) <- c("Subject", "Activity.ID", rename.features(data$features$name[grep("mean\\(|std\\(", data$features$name)]))

## Appropriately labels the data set with descriptive activity names.

tidy <- merge(tidy, data$activity_labels, by.x="Activity.ID", by.y="id")
tidy <- tidy[,!(names(tidy) %in% c("Activity.ID"))]

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy.mean <- ddply(melt(tidy, id.vars=c("Subject", "Activity")), .(Subject, Activity), summarise, MeanSamples=mean(value))

write.csv(tidy.mean, file = "tidy.mean.txt",row.names = FALSE)
write.csv(tidy, file = "tidy.txt",row.names = FALSE)