getdata-006
===========

Coursera Get Data Course Repo

==================================================================
Human Activity Recognition Using Smartphones Tidy Dataset - Average of Mean and Standard Deviation Factors arranged by Activity and Subject
Version 1.0
==================================================================
Joel Verbist
as Part of Udacity Course Project - Getting and Cleaning Data (GetData 006)
==================================================================

I. Background Information on original dataset]1] out of which the Tidy dataset was created:

(For info on Tidy dataset see section II below)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The original dataset included the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This original dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

==================================================================
II. Background Information on Tidy dataset:

Since we are only interested in the Mean and Standard Deviation features of the 561 feature vector contained in both the x_train and x_test datasets we can primarily focus on 5 files and ignore the other detailed Inertial datasets.

The original files used for creating our tidy dataset were the following files:

- 'features.txt': List of all features. Used to create Column header names.
- 'train/X_train.txt': Training set. 561 Feature Vector

- 'train/y_train.txt': Training labels. 6 Activity labels

- 'test/X_test.txt': Test set.  561 Feature Vector

- 'test/y_test.txt': Test labels. 6 Activity labels

- 'train/subject_train.txt': list of 30 subjects

- 'test/subject_test.txt': list of 30 subjects


These files were merge (rbind) into one tidy dataset. i.e. both train and test datasets were combined and matched to their appropriate activity and subject. Only the mean and standard deviation features were included. This reduced the dataset from 563 columns to 68 - Activity, subject, and 66 Mean and SD features.

Then another dataset was created the rolled up the means and standard deviations by activity and subject. creating a 180 row by 68 column dataset. [30 subject x 6 activities X 68 columns of feature set). 

The Tidy file is the following:

-'tidy_ave2_act-subj': Data txt file containing 66 mean and standard deviation features organized by activity and then subject

For more information on how the tidy dataset was created see the Codebook.md file.

