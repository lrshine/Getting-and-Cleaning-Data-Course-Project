Getting and Cleaning Data Course Project

The data contained in this project are the result of experiments which have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, a 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Variable names and their descriptions:

fileURL - URLto the website where the data for the project was downloaded

mainDir - Directory that is used to download to and extract project files

X_Train - Dataframe that contains 'training' data collected from Samsung accelerometers on volunteers who performed 6 activities 

Y_Train - Dataframe that contains the 'training' labels for X_Train dataset

Subject_Train - Each row identifies the 'training' subject who performed the activity for each window sample. Its range is from 1 to 30.

X_Test - Dataframe that contains 'test' data collected from Samsung accelerometers on volunteers who performed 6 activities

Y_Test - Dataframe that contains the 'test' labels for X_Test dataset

Subject_Test - Each row identifies the 'test' subject who performed the activity for each window sample. Its range is from 1 to 30.

Subject_combine - Dataframe that contains the merged data from Subject_Train and Subject_Test datasets

X_combine - Dataframe that contains the merged data from X_Train and X_Test datasets

Y_combine - Dataframe that contains the merged data from Y_Train and Y_Test datasets

CombineSubjectandY - Dataframe that contains merged data from Subject_combine and Y_combine

FeatureNames - Dataframe that contains a list of names of all features

OneDataFrame - Dataframe that contains merged data from all datasets, specifically CombineSubjectandY and X_combine.

subOneDataNames - Dataframe that contains only feature names from FeatureNames related to std (Standard deviation) and Mean

selectedNames - List of final column names that will be included in final data set (FeatureNames plus Subject and Activity)

subOneDataFrame - Dataframe that contains final subset of training and test data that lists the subjects, activities and accelerometer details on mean and std

ActivityName - Dataframe that links the class labels with their activity name.

TidyData - Dataframe that contains the averages of each fully descriptive variable for each identified activity and each subject.
