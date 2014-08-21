==================================================================
CodeBook for Human Activity Recognition Using Smartphones Tidy Dataset - Average of Mean and Standard Deviation Factors arranged by Activity and Subject
Version 1.0
==================================================================
Joel Verbist
as Part of Udacity Course Project - Getting and Cleaning Data (GetData 006)
==================================================================


I. Overview on creation of Tidy dataset:

One R script called run_analysis.R  does the following 5 steps. 

    1. Merge the training and the test sets to create one data and labels columns with appropriate descripions.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Label activity columns to name the activities in the data set
    4. Save the file. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


In summary, since we are only interested in the Mean and Standard Deviation features of the 561 feature vector contained in both the x_train and x_test datasets we can primarily focus on 5 files and ignore the other detailed Inertial datasets.

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

==================================================================

II. Step 1: Merge the training and the test sets to create one data and labels columns with appropriate descripions

The following files of the original dataset were merged

- 'features.txt': List of all features. Used to create Column header names.

- 'train/X_train.txt': Training set. 561 Feature Vector

- 'train/y_train.txt': Training labels. 6 Activity labels

- 'test/X_test.txt': Test set.  561 Feature Vector

- 'test/y_test.txt': Test labels. 6 Activity labels

- 'train/subject_train.txt': list of 30 subjects

- 'test/subject_test.txt': list of 30 subjects

Attribute or column header names are found in the features.txt file. A vector of these 561 features was made and assigned to attr_names

Then both train and test datasets were read in using read.table from their corresponding txt files. x_train and x_test contain the data for the 561 features, y_train and Y-test contain the activity types associated with these feauture set results. i.e. walking, walking upstairs, walking downstairs, sitting, standing, or laying down.  The subject_test and subject_train files contain the data on the 30 subject associated witht he feature set results. 
In order to make it easier to work with the data, I applied the feature names (attr_names) to the x_train and x_test datasets as header names (colnames). 

Then both test data and train data was combined thorugh binding columns (using cbind). i.e. I added a column for subject and column for activity to the X_test and X_train datasets creating two 563 column datasets, one for train and one for test.

Then as a final step both the training dataset (df_train) and test dataset (df_test) was combined into one final dataset (df_final) via rbind. i.e. I combined both train and test, adding all rows in train to all rows in test. 


==================================================================
III. Step 2: Extracts only the measurements on the mean and standard deviation for each measurement:

Since we are only interested in those features which measure Mean and Standard deviation we can reduce this final dataset drastically.
A vector containing all columns that do NOT have mean or SD was created. Then it was applied to the Final dataset stripping out any and all non mean and non SD columns by setting that column to NULL. 
We end up with 68 columns - 66 feature columns, and subject and activity

==================================================================
IV. Step 3. Label activity columns to name the activities in the data set:

The activities are still labeled as mumeric

1 = "WALKING"; 2 = "WALKING_UPSTAIRS"; 3 = "WALKING_DOWNSTAIRS"; 4 = "SITTING"; 5 = "STANDING"; 6="LAYIng"

I used the 'car' library recode function to recode the numeric labels for Activity to the appropriate string. New dataframe is called df


==================================================================
V. Step 4: Save the datafile into a txt file: 

Since I labeled columns at the beginning ( if find it easier to work with the data that way) they are already labelled appropriatelly.
Saved the data (df) into a txt file called tidy.txt using the write.table command


==================================================================
VI. step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject: 

first I sorted the data in df by subject and activity - I find it easier to work with and chekc my result when it is orderly - this step was not necessary however

created new dataframe (newdf) that aggregated the sorted data (sorteddf) by activity and subject by rolling up by mean (average)  for each feature (except subject and activity)
column names subject and activity had to be reassigned to first two columns

Then this newdf was saved as a txt file (tidy_ave2_act-subj.tx) using write.table command
