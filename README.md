Project for Getting and Cleaning Data
=====================================

Author: Jing Zhang (https://github.com/zhj930924/Getting_Cleaning_Project)

Requirement for this project
--------------------------

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
> 
> One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
> 
> Here are the data for the project: 
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
> 
> You should create one R script called run_analysis.R that does the following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set.
> 4. Appropriately labels the data set with descriptive activity names.
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Steps to reproduce this project
-------------------------------
+ A. Open the R script `run_analysis.R` with RStudio.
+ B. Run the R script `run_analysis.R`. It does the following:

        1. Set up the environment - check and download neccessary R packages
        2. Download the dataset if it does not already exist in the working directory.
        3. Load the activity and feature information.
        4. Loads both the training and testing datasets, keeping only those columns which reflect a mean or standard deviation.
        5. Loads the activity and subject data for each dataset, and merges those columns with the dataset.
        6. Merges the two datasets.
        7. Converts the `Activity` and `Subject` columns into factors.
        8. Creates a tidy dataset that contains of the average (mean) value of each variable for each subject and activity pair.

Outputs produced
----------------
* Tidy dataset file `tidy_data.txt` (tab-delimited text)
