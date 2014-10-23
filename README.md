Getting and Cleaning Data: Course Project
=========================================

Repository for the Coursera Course Project for Getting and Cleaning Data


## Description

This repository contains information, source data, code and processed data related to a Course Project for the 'Getting and Cleaning Data' course on Coursera. 

The purpose of the project was to demonstrate the ability to collect, work with, and clean a data set. In order to achieve the above, I was tasked with processing an existing data set by means of filtering and value aggregation. Please refer to the below sections for more details.


## Source

The source data used in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone during an experiment with a group of 30 volunteers performing a set of different activities.

The dataset obtained in the abovementioned experiment is partitioned into two sets: test and Training and is available here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The archive containing the collected data also contains more thorough description of it. Please refer to _README.txt_ (located in the archive) for more details 


## Task 

Author was requested to provide a working R script fit for the purpose described below.

The data from the experiment, was supposed to be merged into a single dataset, which then was supposed to be filtered down to only include variables representing measurements on the mean and standard deviation. 

The filtered data was then supposed to be aggregated to average values for each activity and each subject. The resulting dataset was supposed to be saved in a _.txt_ file.

R script is included in this repository as: _run_analysis.R_

Dataset containing aggregated results is included in this repository: _DataTidy.txt_
>_NOTE:_ If you want to import the dataset to R, the following code is suggested: _dataTidy <- read.table(".\\DataTidy.txt", header=TRUE)_ 



## Data Processing

Preparation for running _run_analysis.R_:

* Download source data
* Extract files from archive
* Move the extracted 'UCI HAR Dataset' folder to R work directory


This is the process flow of the _run_analysis.R_

* Paths to data elements are assigned to variables (meant to make potential alterations to paths easier in case path variables are frequently re-used in the code)
* Data (including feature-vector, subject and Activity) is extracted from 'Train' section of the source data
 * Subject data column is appended to the Feature-vector dataframe
 * Activity data column is appended to the Feature-vector dataframe
* Data (including feature-vector, subject and Activity) is extracted from 'Test' section of the source data
 * Subject data column is appended to the Feature-vector dataframe
 * Activity data column is appended to the Feature-vector dataframe
* Both dataframes are merged. This is only done after the addition of the abovementioned columns in order to preserve the original sorting
* List of 'features' - data variable names is imported
* Dataframe tables are renamed to represent 'features' as variable names
* List of 'Activity Labels' - activity names is imported
* Activity identifiers in the Activity column are replaced with the imported activity labels
* Dataframe is subsetted to only contain variables that represent mean or standard deviation of the readings
* Mean values of each variable are calculated for each subject/activity group and stored in a new dataframe
* Subject and Activity columns are added to resulting dataframe



