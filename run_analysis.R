###Download dataset and unzip file

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
mainDir <- "./Coursera/Getting and Cleaning Data"
if (file.exists(mainDir)) {
  setwd(file.path(mainDir))
} else {
  dir.create(file.path(mainDir))
  setwd(file.path(mainDir))
}
  
download.file(fileURL,destfile = "./Smartphones.zip")
unzip("./Smartphones.zip",exdir = "./Dataset")

###Merges the training and test sets to create one data set

X_Train <- read.table("./Dataset/UCI HAR Dataset/train/X_train.txt", header = FALSE)
Y_Train <- read.table("./Dataset/UCI HAR Dataset/train/y_train.txt", header=FALSE)
Subject_Train <- read.table("./Dataset/UCI HAR Dataset/train/subject_train.txt", header=FALSE)

X_Test <- read.table("./Dataset/UCI HAR Dataset/test/X_test.txt", header = FALSE)
Y_Test <- read.table("./Dataset/UCI HAR Dataset/test/y_test.txt", header=FALSE)
Subject_Test <- read.table("./Dataset/UCI HAR Dataset/test/subject_test.txt", header=FALSE)

Subject_combine <- rbind(Subject_Train, Subject_Test)
X_combine <- rbind(X_Train,X_Test)
Y_combine <- rbind (Y_Train, Y_Test)

names(Subject_combine) <- c("Subject")
names(Y_combine) <- c("Activity")
FeatureNames <- read.table("./Dataset/UCI HAR Dataset/features.txt",header=FALSE)
names(X_combine) <- FeatureNames$V2

###Make one big data frame

CombineSubjectandY <- cbind(Subject_combine,Y_combine)
OneDataFrame <- cbind(X_combine, CombineSubjectandY)

##Extract the measurements on the mean and std

subOneDataNames <- FeatureNames$V2[grep("*[Mm]ean*|*std*", FeatureNames$V2)]
selectedNames <- c(as.character(subOneDataNames),"Subject","Activity")
subOneDataFrame <- subset(OneDataFrame, select = selectedNames)

##Use descriptive Activity Names to name the Activity Variable in data set
ActivityName <- read.table("./Dataset/UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(ActivityName) <- c("ActivityID","Activity")
subOneDataFrame$Activity <- factor(subOneDataFrame$Activity,levels=c(ActivityName$ActivityID),labels=ActivityName$Activity)

##Appropriately labels the data set with descriptive variable names.
names(subOneDataFrame) <- gsub("BodyBody","Body",names(subOneDataFrame))
names(subOneDataFrame) <- gsub("Acc","Accelerometer",names(subOneDataFrame))
names(subOneDataFrame) <- gsub("^t","time",names(subOneDataFrame))
names(subOneDataFrame) <- gsub("^f","frequency",names(subOneDataFrame))
names(subOneDataFrame) <- gsub("Gyro", "Gyroscope",names(subOneDataFrame))
names(subOneDataFrame) <- gsub("Mag","Magnitude",names(subOneDataFrame))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

TidyData <- aggregate(subOneDataFrame,list(Participant = subOneDataFrame$Subject,NotedActivity = subOneDataFrame$Activity),mean)
TidyData <- select(TidyData,-Subject,-Activity)
TidyData <- TidyData[order(TidyData$Participant,TidyData$NotedActivity),]
write.table(TidyData,file="TidyData.txt",row.names=FALSE)