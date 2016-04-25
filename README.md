# Getting-and-Cleaning-data

This README file serves as an explanation of the key steps executed by the "run_analysis.R" code as a part of the Assignment for the 'Getting and Cleaning data' course of the Data Science certification on Coursera.

During the assignment the data set used can be downloaded under the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Detailed explanation of the dataset is available:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The key activities performed by the "run_analysis.R" script:

SECTION 1:
- 1. Reading Activity lookup table ("activity_lables.txt") into R
- 2. Reading Variabletable ("features.txt") into R and creating descriptive variable names
- 3. Reading Train data ("X_train.txt") into R
- 4. Reading Train subjects data ("subject_train.txt") into R
- 5. Reading Train activity labels data ("y_train.txt") into R
- 6. Reading Test data ("X_test.txt") into R
- 7. Reading Test subjects data ("subject_test.txt") into R
- 8. Reading Test activity labels data ("y_test.txt") into R


SECTION 2:
- 1. Create a separate train and test dataset including the subject the activities and the measurement
- 2. Merge the train and test datasets
- 3. Extract the columns related to mean and standard deviation measurement and store them as "data" data.frame


SECTION 3:
- 1. Convert the "Subject" and "Activity" columns into factors for within "data"
- 2. Create a "tidydataset" table using the "Subject" and "Activity" as factors and storing the average of each measurement
- 3. Save the tidy data as "tidydata.txt"



