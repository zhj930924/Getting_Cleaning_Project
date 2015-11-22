# Set up packages
if (!require("data.table")) {
        install.packages("data.table")
}
if (!require("reshape2")) {
        install.packages("reshape2")
}
require("data.table")
require("reshape2")

#Download the zip file

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/WearableData.zip")

#Unzip the file

if (!file.exists("./data/UCI HAR Dataset")) {unzip("./data/WearableData.zip")}

#Merges the training and the test sets to create one data set.

#Load activity labels from activity_labels.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
activity_labels <- as.character(activity_labels)

#Get attribute(Column) names from features.txt
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
features <- as.character(features)

#Create logical operator to extract mean and standard deviation
extract_features <- grepl("mean|std", features)

# Load and process training data

# Load training data
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Process tranining data
names(data_train) = features ##label the training set
data_train_clean = data_train[,extract_features] ## Extract mean and std from training set
activities_train[,2] = activity_labels[activities_train[,1]]
names(activities_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "Subject"

# Combine training data
wearable_train <- cbind(as.data.table(subject_train), activities_train, data_train_clean)

# Load and process testing data

# Load testing data
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Process tesring data
names(data_test) = features ## label the testing set
data_test_clean = data_test[,extract_features] ## Extract mean and std from testing set
activities_test[,2] = activity_labels[activities_test[,1]]
names(activities_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "Subject"

# Combine testing data
wearable_test <- cbind(as.data.table(subject_test), activities_test, data_test_clean)

# Merge training and testing data
wearable_dataset = rbind(wearable_train, wearable_test)
ID_labels = c("Subject", "Activity_ID", "Activity_Label")

# Set labels and datatypes
data_labels = setdiff(colnames(wearable_dataset), ID_labels)
melt_data = melt(wearable_dataset, id = ID_labels, measure.vars = data_labels)

# Generate the average of each variable for each activity and each subject
tidy_data = dcast(melt_data, Subject + Activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt", row.names = FALSE)





