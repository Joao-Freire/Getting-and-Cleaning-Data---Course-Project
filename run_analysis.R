# Create directory if it doesn't exist
if(!file.exists("./project")) {dir.create("./project")}

# Download data set
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="./project/wearable.zip")

# Unzip data set
unzip(zipfile="./project/wearable.zip",exdir="./project")

# Read activity_labels and features files
activityLabels <- read.table("./project/UCI HAR DataSet/activity_labels.txt")
features <- read.table("./project/UCI HAR DataSet/features.txt")

# Read test files
subjectTest <- read.table("./project/UCI HAR DataSet/test/subject_test.txt")
xTest <- read.table("./project/UCI HAR DataSet/test/X_test.txt")
yTest <- read.table("./project/UCI HAR DataSet/test/y_test.txt")

# Read train files
subjectTrain <- read.table("./project/UCI HAR DataSet/train/subject_train.txt")
xTrain <- read.table("./project/UCI HAR DataSet/train/X_train.txt")
yTrain <- read.table("./project/UCI HAR DataSet/train/y_train.txt")

# Assign column names

colnames(activityLabels) <- c("ActivityNr","ActivityName")

colnames(subjectTest) <- "SubjectNr"
colnames(xTest) <- features[,2]
colnames(yTest) <- "ActivityNr"
colnames(subjectTrain) <- "SubjectNr"
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "ActivityNr"

# Merge the data

test <- cbind(subjectTest,yTest,xTest)
train <- cbind(subjectTrain,yTrain,xTrain)

test_train <- rbind(test,train)

# Extract only the measurements on the mean and standard deviation for each measurement

col_mean <- grep("mean",names(test_train))
col_std <- grep("std",names(test_train))
col_mean_std <- c(1,2,col_mean,col_std)

# Because 1 and 2 were added to the col_mean_std numeric vector, the "SubjectNr" and "ActivityNr" columns are also extracted

test_train_mean_std <- test_train[,col_mean_std]

# Name the activities with descriptive names

test_train_mean_std_activity <- merge(test_train_mean_std,activityLabels,by="ActivityNr",all.x=TRUE)

# Note: merge() reorders the data. The "ActivityNr" column in test_train_mean_std_act_names is now the first column

# Label the data set with descriptive variable names

# The first instance of t and f is replaced by "Time" and "FrequencyDomainSignals" respectively only if it occurs in the beginning of the string

colnames(test_train_mean_std_activity) <- sub("^t","Time",colnames(test_train_mean_std_activity))
colnames(test_train_mean_std_activity) <- sub("^f","FrequencyDomainSignals",colnames(test_train_mean_std_activity))
colnames(test_train_mean_std_activity) <- sub("Acc","Acceleration",colnames(test_train_mean_std_activity))
colnames(test_train_mean_std_activity) <- sub("Gyro","Gyroscope",colnames(test_train_mean_std_activity))
colnames(test_train_mean_std_activity) <- sub("Mag","Magnitude",colnames(test_train_mean_std_activity))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject

tidyData <- aggregate(. ~ActivityNr+SubjectNr,test_train_mean_std_activity,mean)

# Remove the column named "ActivityName"

tidyData <- tidyData[,-82]
