# Code Book for the 'run_analysis.R' file

## Information about and available in the raw data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Feature Selection:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

After unzipping the files in 'Wearable.zip' see 'README.txt' and 'features_info.txt' for more details.

## Collection, cleaning and merging of data

The 'test' and 'train' files were read into R and column names were assigned based on the information contained in the 'features.txt' file.

The assignment of the column names 'ActivityNr','ActivityName' and 'SubjectNr' was according to the preferences of the author.

The test and train data were then merged.

Descriptive activity names were used to name the activities in the data set

## Selection and description of the variables

* Measurements on the mean and standard deviation for each measurement

	The names of these variables were modified in order to have descriptive variable names

* 'ActivityNr': The number corresponding to the activity performed by the subject

* 'SubjectNr': The number of the subject

* 'ActivityName': The name of the activity performed by the subject

## Creation of a tidy data set

* A second, independent tidy data set with the average of each variable for each activity and each subject was created

* After the mean() function was applied to all variables in the tidy data set, the (last) column named "ActivityName" no longer had the name of the activity performed by the subject. Therefore, the final tidy data set was created without this column.
