#SECTION 1: READING VARAIBLES INTO R
# reading the data from the "UCI HAR Dataset" library within the working directory to R in the following order:

# 1.Activity lookup table
# 2.Variabletable
# 3.Train data 
# 4.Train data subjects
# 5.Train data activity labels
# 6.Test data 
# 7.Test data subjects
# 8.Test data activity labels

# reading activity labels
rundataactivitylabel<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(rundataactivitylabel)<-c("Activity_ID","Activity_Name")

# reading variable tables and creating descriptive names
rundataactivityfeatures<-read.table("./UCI HAR Dataset/features.txt")
rundataactivityfeatures[,2]<-sub("t","Time_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("f","Frequency_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("Acc","Accelerometer_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("Gyro","Gyroscope_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("Mag","Magnitude_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("Jerk","JerkSignal_",rundataactivityfeatures[,2])
rundataactivityfeatures[,2]<-sub("Body","Body_",rundataactivityfeatures[,2])

# reading train data
rundatatrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
names(rundatatrain)<-rundataactivityfeatures[,2]
rundatatrainsubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(rundatatrainsubject)<-"Subject"
rundatatrainlabel<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(rundatatrainlabel)<-"Activity"

# reading test data
rundatatest<-read.table("./UCI HAR Dataset/test/X_test.txt")
names(rundatatest)<-rundataactivityfeatures[,2]
rundatatestsubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(rundatatestsubject)<-"Subject"
rundatatestlabel<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(rundatatestlabel)<-"Activity"


#SECTION2: MERGE THE TRAIN AND TEST DATASETS AND EXTRACT MEAN AND STD MEASUREMENTS
# creating a test and a train dataset with proper activity labels
rundatatrainfull<-cbind(rundatatrainsubject,rundatatrainlabel,rundatatrain)
rundatatestfull<-cbind(rundatatestsubject,rundatatestlabel,rundatatest)

# merge the test and the train datasets
datasetfull<-rbind(rundatatestfull,rundatatrainfull)

# extract the mean and standard deviation values
columnlist1<-grep("Mean",names(datasetfull))
columnlist2<-grep("mean",names(datasetfull))
columnlist3<-grep("Std",names(datasetfull))
columnlist4<-grep("std",names(datasetfull))
columnskeep<-c(columnlist1,columnlist2,columnlist3,columnlist4)

data<-datasetfull[,c(1,2,columnskeep)]


#SECTION3: CREATING TIDY DATA SET INCLUDING THE AVERAGE OF EACH VARIABLES FOR EACH SUBJECT AND ACTIVITY
library(reshape2)

data[,1] <- as.factor(data[,1])
data[,2] <- factor(data[,2], levels = rundataactivitylabel[,1], labels = rundataactivitylabel[,2])


datamelt<-melt(data,id=c("Subject","Activity"))

tidydataset<-dcast(datamelt,Subject+Activity~variable,mean)

write.table(tidydataset, "tidy.txt", row.names = FALSE, quote = FALSE)
