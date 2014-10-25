# For the code to work properly the orignal data folder
# 'UCI HAR Dataset' must be placed in R work directory

# Sets paths to all elemnts of itnerest within the data folder
# and assigns them to variables used further in the code
# Should you want to assign alternative paths - change them here
pathXN <- ".\\UCI HAR Dataset\\train\\X_train.txt"
pathSN <- ".\\UCI HAR Dataset\\train\\subject_train.txt"
pathYN <- ".\\UCI HAR Dataset\\train\\y_train.txt"
pathXT <- ".\\UCI HAR Dataset\\test\\X_test.txt"
pathST <- ".\\UCI HAR Dataset\\test\\subject_test.txt"
pathYT <- ".\\UCI HAR Dataset\\test\\y_test.txt"
pathF  <- ".\\UCI HAR Dataset\\features.txt"
pathAL <- ".\\UCI HAR Dataset\\activity_labels.txt"
pathDT <- ".\\UCI HAR Dataset\\DataTidy.txt"

# Extracts and stores feature-vector, subject and activity data 
# from the 'Train' folder and assigns them to variables
train <- read.table(pathXN, header = FALSE)
subjectN <- read.table(pathSN, header = FALSE)
activityN <- read.table(pathYN, header = FALSE)

# Appends subject and activity columns 
train <- cbind(train, subjectN)
train <- cbind(train, activityN)

# Extracts and stores feature-vector, subject and activity data 
# from the 'Test' folder and assigns them to variables
test <- read.table(pathXT, header = FALSE)
subjectT <- read.table(pathST, header = FALSE)
activityT <- read.table(pathYT, header = FALSE)

# Appends subject and activity columns 
test <- cbind(test, subjectT)
test <- cbind(test, activityT)

# Merges Test and Train dataframes
dat <- data.frame()
dat <- rbind(dat,train)
dat <- rbind(dat,test)

# Exctracts and stores feature-vector variable names
features <- read.table(pathF, header = FALSE)

# Appends variable names for subject and activity
features <- features[,2]
features <- c(as.character(features), "Subject", "Activity")

# Assigns variable names to respective column in the dataframe
colnames(dat) <- features

# Exctracts and stores activity types (description)
activities <- read.table(pathAL, header = FALSE)
activities <- as.character(activities[, 2])

# Changes indexes used in activity column to descriptive names
dat$Activity <- activities[dat$Activity]

# Filters the dataframe leaving only columns related to vasriables 
# that contain mean or standard deviation data for measurements
# as well as subject and activity data
dat <- dat[, grep("mean()|std()|Subject|Activity", 
                 names(dat))]

# Aggregates the data by calculating mean values of variables for each 
# subject/activity group and stores the resulting data in a new dataframe 
datStep5 <- data.frame(1:180)
for (i in 1:79) {
    datStep5 <- cbind(datStep5, 
                     as.data.frame(unique(ave(dat[, i],
                                              dat[, 80],
                                              dat[, 81]))))
    names(datStep5)[i + 1] <- names(dat)[i]
}
datStep5 <- datStep5[,2:80]
LastColsS5 <- unique(dat[, c("Subject", "Activity")])
datStep5 <- cbind(datStep5, LastColsS5)


## Below is the optional code for exporting the dataframe 
## that contains agregated data to R work directory:  
## ------------------------------------------------------
## write.table(datStep5, file = pathDT, row.name = FALSE)
## ------------------------------------------------------

## Below is the optional code for importing the dataframe 
## that contains agregated data to R work directory:  
## ------------------------------------------------------
## dataTidy <- read.table(pathDT, header = TRUE)
## ------------------------------------------------------
