# 1.Merges the training and the test sets to create one data set.

# download and unzip data file
# ignore if the data is already present
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "project_data.zip")
unzip("project_data.zip")

# read data from txt files in the folder "UCI HAR Dataset"
# Read feature names
features <- read.table(
  "UCI HAR Dataset/features.txt")

# Read activity labels
activities <- read.table(
  "UCI HAR Dataset/activity_labels.txt")

# Training measurements
X_train <- read.table(
  "UCI HAR Dataset/train/X_train.txt")

# Training activity labels
y_train <- read.table(
  "UCI HAR Dataset/train/y_train.txt")

# Training subject IDs
subject_train <- read.table(
  "UCI HAR Dataset/train/subject_train.txt")

# Test measurements
X_test <- read.table(
  "UCI HAR Dataset/test/X_test.txt")

# Test activity labels
y_test <- read.table(
  "UCI HAR Dataset/test/y_test.txt")

# Test subject IDs
subject_test <- read.table(
  "UCI HAR Dataset/test/subject_test.txt")

# assign names
names(X_train) <- features$V2
names(X_test) <- features$V2

# merge data
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train,subject_test)

names(subject) <- "subject"
names(y) <- "activity"
df <- cbind(subject, y, X)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
selected_features <- grep("mean\\(\\)|std\\(\\)",names(df),value = TRUE)
df_extract <- df[,c("subject", "activity",selected_features)]


# 3.Uses descriptive activity names to name the activities in the data set
df_extract$activity <- activities$V2[
  match(df_extract$activity, activities$V1)]

# 4.Appropriately labels the data set with descriptive variable names. 
names(df_extract) <- gsub( "-", "_",
  names(df_extract))

names(df_extract) <- gsub( "\\(\\)", "",
  names(df_extract))

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
df_avg <- df_extract %>%
  group_by(subject, activity) %>%
  summarise(
    across(where(is.numeric), mean),
    .groups = "drop")

# store the file
write.table(df_avg,
            file = "tidyData.txt",
            row.names = FALSE)
