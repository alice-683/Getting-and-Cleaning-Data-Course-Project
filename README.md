# Getting-and-Cleaning-Data-Course-Project
coursera project

# Project Overview

This project uses the Human Activity Recognition Using Smartphones (UCI HAR) dataset. The objective is to clean and transform raw smartphone sensor measurements into a tidy dataset containing the average of each selected measurement for each subject and activity.

# Dataset

The original dataset contains measurements collected from 30 volunteers performing six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

The dataset includes training and test datasets, subject identifiers (1-30), activity labels (1-6 and corresponding activities), and 561 sensor features stored in features.txt (explanation about the features can be found in features_info.txt in the original folder).

# Output files in This Analysis

run_analysis.R: R script containing all data-cleaning and transformation steps. 

tidyData.txt: Final tidy dataset with average of each variable for each activity and each subject containing 180 observations and 68 variables.

CodeBook.md.rmd: Describes the data, variables, transformation steps performed.

README.md: Explains the project, files, and instructions for reproducing the analysis.

# Analysis Procedure

0. Reads the training and test datasets, activity labels, subject identifiers, and feature names into R. (using read.table())

1. Merges the training and test datasets and then into one dataset. (using rbind() and cbind())

2. Extracts measurements containing mean and standard deviation features. (using grep())

3. Replaces numerical activity IDs with descriptive activity names in activity labels. (using match())

4. Appropriately labels the colnames of data set with simplified variable names. 

5.1. Groups the observations by subject and activity and calculates the average of each measurement. using(group_by(subject, activity))

5.2 Exports the final tidy dataset as tidyData.txt. (using write.table() and row.names = FALSE)

# Reproducible analysis

- Download and unzip the original UCI HAR dataset.

- Place the UCI HAR Dataset folder in the R working directory.

- Place run_analysis.R in the same working directory, adapt the script when necessary.

- Run the R script:

- The script generates tidydata.txt in the working directory.

# Reproducibility

The analysis is performed using R and the dplyr package. The original UCI HAR dataset is required to reproduce the results.
