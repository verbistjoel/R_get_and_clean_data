if (!file.exists("project")){
	dir.create("project")
}

####
#### Step 1: read all data in to tables and merge sets
####

attr_names <-read.table("./UCI HAR Dataset/features.txt")   ### column names for x_train and x_test
attr_names <-as.vector(attr_names[[2]])

subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE)    ### read in train set
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE)
y_train <- sapply(y_train, as.numeric)
colnames(x_train)<-attr_names				### Add column names
colnames(subj_train)<-c("subject")
colnames(y_train)<-c("activity")

subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE)    ### read in test set
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE)
y_test <- sapply(y_test, as.numeric)
colnames(x_test)<-attr_names				### Add column names
colnames(subj_test)<-c("subject")
colnames(y_test)<-c("activity")


df_train <- cbind(subj_train,y_train)			### adding subject and activity columns to x_train (which has most data)
df_train <- cbind(df_train,x_train)


df_test <- cbind(subj_test,y_test)			### adding subject and activity columns to x_test (which has most data)
df_test <- cbind(df_test,x_test)

df_final<-rbind(df_train,df_test)  #### merged datasets


###
### Step 2:  Strip out non-means or non-standard deviation
###


nullcolumns <-c(9:42,49:82,89:122,129:162,169:202,205:215,218:228,231:241,244:254,257:267,274:346,353:425,432:504,507:517,520:530,533:543,546:563)  ### These are the columns that do not correspond to Mean or Standard Deviation
df<-df_final      

df[nullcolumns]<-list(NULL)			### dropping columns that are not mean or sd


###
### Step 3:  add descripive names for activities  
###

library(car)

df$activity<-recode(df$activity, '1 = "WALKING"; 2 = "WALKING_UPSTAIRS"; 3 = "WALKING_DOWNSTAIRS"; 4 = "SITTING"; 5 = "STANDING"; 6="LAYING"')


###
### Step 4:  ensure all columns are labeled and save file
###

# Since I labeled columns since the beginning ( if find it easier to work with the data that way, they are already labelled appropriatelly

write.table(df, "./tidy.txt",row.name=FALSE)

####
#### Step 5: create 2nd independent tidy set with average of each variable for each activity and each subject
####

# we can either arrange it by activity first or subject first. I opted for by activity first then subject

sorteddf<-df[order(df$subject,df$activity),]
sorteddf[,3:68] <- sapply(sorteddf[, 3:68], as.numeric)
newdf <-aggregate(sorteddf[,c(3:68)], by=list(sorteddf$subject,sorteddf$activity), FUN=mean, na.rm=TRUE)
colnames(newdf)[2]<-c("activity")
colnames(newdf)[1]<-c("subject")

write.table(newdf, "./tidy_ave2_act-subj.txt",row.name=FALSE)
